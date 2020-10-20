/*
 * Created by Ubique Innovation AG
 * https://www.ubique.ch
 * Copyright (c) 2020. All rights reserved.
 */

import CoreBluetooth
import Foundation
import UIKit.UIApplication

/// struct used for storing peripheral information at runtime
struct PeripheralMetaData: CustomDebugStringConvertible {
    var rssiReadings: Int = 0
    var rssiValues: [Date: Double] = [:] {
        didSet {
            rssiReadings += max(rssiValues.count - oldValue.count, 0)
        }
    }

    var TXPowerlevel: Double?
    var ephID: EphID?
    var discovery: Date = Date()
    var lastConnection: Date?

    var debugDescription: String {
        "<Peripheral rssiReadings:\(rssiReadings) discovery: \(discovery) lastConnection \(lastConnection.debugDescription)"
    }
}

/// The discovery service responsible of scanning for nearby bluetooth devices offering the DP3T service
class BluetoothDiscoveryService: NSObject {
    /// The manager
    private var manager: CBCentralManager?

    /// A delegate for receiving the discovery callbacks
    public weak var delegate: BluetoothDiscoveryDelegate?

    /// A  delegate capable of responding to permission requests
    public weak var bluetoothDelegate: BluetoothDelegate?

    
      private  var crypto: DP3TCryptoModule?
    
      var timerForScanning: Timer?
    
    /// A logger for debugging

        public weak var logger: LoggingDelegate?


    /// A list of peripherals pending for retriving info
    private var pendingPeripherals: [CBPeripheral: PeripheralMetaData] = [:] {
        didSet {
            #if CALIBRATION
                logger?.log(type: .receiver, "updatedPeripherals: \n\(pendingPeripherals)")
            #endif
        }
    }

    /// A list of peripherals that are about to be discarded
    private var peripheralsToDiscard: [CBPeripheral]?

    /// Update all services
    private func updateServices() {
        guard manager?.state == .some(.poweredOn) else { return }
        manager?.scanForPeripherals(withServices: [Default.shared.parameters.bluetooth.serviceCBUUID], options: [
            CBCentralManagerOptionShowPowerAlertKey: NSNumber(booleanLiteral: true),
        ])
        #if CALIBRATION
            DispatchQueue.main.async {
                self.logger?.log(type: .receiver, " scanning for \(Default.shared.parameters.bluetooth.serviceCBUUID.uuidString)")
            }
        #endif
    }

    /// Start the scanning service for nearby devices
    public func startScanning() {
        #if CALIBRATION
            logger?.log(type: .receiver, " start scanning")
        #endif
        if manager != nil {
            manager?.stopScan()
            manager?.scanForPeripherals(withServices: [Default.shared.parameters.bluetooth.serviceCBUUID], options: [
                CBCentralManagerOptionShowPowerAlertKey: NSNumber(booleanLiteral: true),
            ])
            #if CALIBRATION
                logger?.log(type: .receiver, " scanning for \(Default.shared.parameters.bluetooth.serviceCBUUID.uuidString)")
            #endif
        } else {
            manager = CBCentralManager(delegate: self, queue: nil, options: [
                CBCentralManagerOptionShowPowerAlertKey: NSNumber(booleanLiteral: true),
                CBCentralManagerOptionRestoreIdentifierKey: "DP3TTracingCentralManagerIdentifier",
            ])
        }
      
        //Ineed to send myEPHID to BE
        do{
            self.crypto = try DP3TCryptoModule()
        }
        catch{
            print(error) //need to break
        }
    }

    /// Stop scanning for nearby devices
    public func stopScanning() {
        #if CALIBRATION
            logger?.log(type: .receiver, "stop scanning")
            logger?.log(type: .receiver, "going to sleep with \(pendingPeripherals) peripherals")
        #endif
        manager?.stopScan()
        manager = nil
        pendingPeripherals.removeAll()
    }
    //TEST >TO VERIFY
//    var backgroundTaskId: UIBackgroundTaskIdentifier = .invalid
//    let reconnectInterval = 15 // seconds
//
//    private func tryReconnect(_ central: CBCentralManager, to peripheral: CBPeripheral) {
//
//        DispatchQueue.main.async { // while in background mode Timer would work only being in main queue
//            self.backgroundTaskId = UIApplication.shared.beginBackgroundTask (withName: "reconnectAgain") {
//                UIApplication.shared.endBackgroundTask(self.backgroundTaskId)
//                #if CALIBRATION
//                    self.logger?.log(type: .receiver,  "> end")
//                #endif
//                self.backgroundTaskId = .invalid
//            }
//
//            NSLog("TRY RECONNECT>")
//            #if CALIBRATION
//            self.logger?.log(type: .receiver,  "TRY RECONNECT> centralManagerDidUpdateState")
//            #endif
//            self.timerForScanning?.invalidate()
//
//
//            self.timerForScanning = Timer.scheduledTimer(withTimeInterval: TimeInterval(15), repeats: false) { _ in
//                central.connect(peripheral, options: [:])
//
//                UIApplication.shared.endBackgroundTask(self.backgroundTaskId)
//                #if CALIBRATION
//                           self.logger?.log(type: .receiver,  "> end")
//                #endif
//                self.backgroundTaskId = .invalid
//            }
//        }
//    }
}

// MARK: CBCentralManagerDelegate implementation

extension BluetoothDiscoveryService: CBCentralManagerDelegate {
    func centralManagerDidUpdateState(_ central: CBCentralManager) {
        #if CALIBRATION
            logger?.log(type: .receiver, state: central.state, prefix: "centralManagerDidUpdateState")
        #endif
        switch central.state {
        case .poweredOn:
            bluetoothDelegate?.noIssues()
            #if CALIBRATION
                logger?.log(type: .receiver, " scanning for \(Default.shared.parameters.bluetooth.serviceCBUUID.uuidString)")
            #endif
            manager?.scanForPeripherals(withServices: [Default.shared.parameters.bluetooth.serviceCBUUID], options: [
                CBCentralManagerOptionShowPowerAlertKey: NSNumber(booleanLiteral: true),
            ])
            peripheralsToDiscard?.forEach { peripheral in
                self.manager?.cancelPeripheralConnection(peripheral)
            }
            peripheralsToDiscard = nil
        case .poweredOff:
            bluetoothDelegate?.deviceTurnedOff()
        case .unauthorized:
            bluetoothDelegate?.unauthorized()
        default:
            break
        }
    }

    func centralManager(_: CBCentralManager, didDiscover peripheral: CBPeripheral, advertisementData: [String: Any], rssi RSSI: NSNumber) {
        #if CALIBRATION
            logger?.log(type: .receiver, " didDiscover: \(peripheral), rssi: \(RSSI)db")
        #endif

        let txPowerlevel = advertisementData[CBAdvertisementDataTxPowerLevelKey] as? Double

        #if CALIBRATION
            if let power = txPowerlevel {
                logger?.log(type: .receiver, "found TX-Power in Advertisment data: \(power)")
            } else {
                logger?.log(type: .receiver, " TX-Power not available")
            }
        #endif

        tidyUpPendingPeripherals()

        if let serviceData = advertisementData[CBAdvertisementDataServiceDataKey] as? [CBUUID: Data],
            let data: EphID = serviceData[Default.shared.parameters.bluetooth.serviceCBUUID],
            data.count == Default.shared.parameters.crypto.keyLength {
            try? delegate?.didDiscover(data: data,
                                       TXPowerlevel: txPowerlevel,
                                       RSSI: Double(truncating: RSSI),
                                       timestamp: Date())

            #if CALIBRATION
                logger?.log(type: .receiver, "Found service data \(data.hexEncodedString)")
                let identifier = String(data: data[..<4], encoding: .utf8) ?? "Unable to decode"
            logger?.log(type: .receiver, " → ✅ Received (EphID in Advertisement: \(identifier)) from \(peripheral.identifier) at \(Date()) with rssi \(RSSI.doubleValue)")
            #endif

            //Android devices go here
          
            //TEST
            if(RSSI.intValue > -99){  //attenuation (usually 12) -RSSI <73, i need more near to send notification set  55
                  
                       if(UserDefaults.standard.object(forKey: "notifcationcreationTime")==nil){
                           let content = UNMutableNotificationContent()
                            content.title = NSLocalizedString("Attenzione", comment: "")
                            content.body = NSLocalizedString("Mantieni la distanza", comment: "")
                         
                            let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
                            let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
                            UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
                           UserDefaults.standard.set(Date(), forKey:"notifcationcreationTime")
                       }
                       if let date = UserDefaults.standard.object(forKey: "notifcationcreationTime") as? Date {
                          
                           if let diff = Calendar.current.dateComponents([.second], from: date, to: Date()).second, diff > 120 {
                   
                              //alert
                               let content = UNMutableNotificationContent()
                             content.title = NSLocalizedString("Attenzione", comment: "")
                             content.body = NSLocalizedString("Mantieni la distanza", comment: "")
                          
                             let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
                             let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
                             UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
                           UserDefaults.standard.set(Date(), forKey:"notifcationcreationTime")
                           }
                       }
                   
                   }
            
           
            
        } else {
            // Only connect if we didn't got a EphId in the Advertisement

            pendingPeripherals[peripheral] = .init()

            pendingPeripherals[peripheral]?.rssiValues[Date()] = Double(truncating: RSSI)

            pendingPeripherals[peripheral]?.TXPowerlevel = txPowerlevel

            connect(peripheral)
        }
    }

    func tidyUpPendingPeripherals() {
        // Tidy up pending peripherals (remove peripherals in "connecting" state if they are older than the threshold)
        peripheralsToDiscard = []

        for (peripheral, metaData) in pendingPeripherals {
            if let lastConnection = metaData.lastConnection,
                Date().timeIntervalSince(lastConnection) > Default.shared.parameters.bluetooth.peripheralDisposeInterval {
                peripheralsToDiscard?.append(peripheral)
            } else if Date().timeIntervalSince(metaData.discovery) > Default.shared.parameters.bluetooth.peripheralDisposeIntervalSinceDiscovery {
                peripheralsToDiscard?.append(peripheral)
            }
        }

        if let toDiscard = peripheralsToDiscard,
            toDiscard.count > 0 {
            toDiscard.forEach {
                manager?.cancelPeripheralConnection($0)
                pendingPeripherals.removeValue(forKey: $0)
            }

            #if CALIBRATION
                logger?.log(type: .receiver, "tidyUpPendingPeripherals: Disposed \(toDiscard.count) peripherals")
            #endif
        }
    }

    /// Cancel the connection only if we have retreived all data we need
    func cancelPeripheralConnectionIfNeeded(_ peripheral: CBPeripheral,sendevent: Bool) {
        guard let metaData = pendingPeripherals[peripheral] else { return }
        guard let ephID = metaData.ephID else {
            if metaData.rssiReadings < Default.shared.parameters.bluetooth.rssiValueRequirement {
                peripheral.readRSSI()
            }
            return
        }

       
        
        for (timestamp, rssi) in metaData.rssiValues {
            try? delegate?.didDiscover(data: ephID,
                                       TXPowerlevel: metaData.TXPowerlevel,
                                       RSSI: rssi,
                                       timestamp: timestamp)
            
            //saving on db so I can send in realtime to BE
            //remove if we go batch
            if(sendevent){
//                NSLog("sto per inviare")
//                 let data = try? crypto!.getCurrentEphID()
//                do{
//                    if(ODataLayer.shared != nil){
//                        try ODataLayer.shared.sendEvent(myId: ( data?.hexEncodedString) as! String, Idrecevied: ephID.hexEncodedString, RSSI:String(format: "%.0f",rssi))
//                    }
//                }
//                catch{
//                    logger?.log(type: .sender, "Error on sendevent "+error.localizedDescription)
//                }
            }
        }

        pendingPeripherals[peripheral]?.rssiValues.removeAll()

        /// only cancel connection if we have 5 rsssiValues and received the ephID
        if metaData.rssiReadings >= Default.shared.parameters.bluetooth.rssiValueRequirement {
            #if CALIBRATION
                logger?.log(type: .receiver, "cancelling connection to: \(peripheral)")
            #endif
            pendingPeripherals[peripheral]?.rssiReadings = 0
            pendingPeripherals[peripheral]?.ephID = nil
            manager?.cancelPeripheralConnection(peripheral)
        } else {
            peripheral.readRSSI()
        }
    }

    func centralManager(_: CBCentralManager, didConnect peripheral: CBPeripheral) {
        #if CALIBRATION
            logger?.log(type: .receiver, " didConnect: \(peripheral)")
        #endif
        pendingPeripherals[peripheral]?.lastConnection = Date()
        tidyUpPendingPeripherals()
        peripheral.delegate = self
        peripheral.discoverServices([Default.shared.parameters.bluetooth.serviceCBUUID])
        peripheral.readRSSI()
    }

    func centralManager(_: CBCentralManager, didDisconnectPeripheral peripheral: CBPeripheral, error: Error?) {
        if let metaData = pendingPeripherals[peripheral],
            let lastConnection = metaData.lastConnection {
            if Date().timeIntervalSince(lastConnection) > Default.shared.parameters.bluetooth.peripheralDisposeInterval {
                #if CALIBRATION
                    logger?.log(type: .receiver, " didDisconnectPeripheral dispose because last connection was \(Date().timeIntervalSince(lastConnection))seconds ago")
                #endif
                pendingPeripherals.removeValue(forKey: peripheral)
                return
            }
        }

        if let error = error {
            #if CALIBRATION
                logger?.log(type: .receiver, " didDisconnectPeripheral (unexpected): \(peripheral) with error: \(error)")
            #endif

            // self.tryReconnect(manager!, to: peripheral)
             connect(peripheral)
        } else {
            #if CALIBRATION
                logger?.log(type: .receiver, " didDisconnectPeripheral (successful): \(peripheral)")
            #endif

            // Do not re-connect to the same peripheral right away again to save battery
            //self.tryReconnect(manager!, to: peripheral)
              //TEST
            connect(peripheral, delayed: true)
        }
    }

    func centralManager(_: CBCentralManager, didFailToConnect peripheral: CBPeripheral, error: Error?) {
        #if CALIBRATION
            logger?.log(type: .receiver, " didFailToConnect: \(peripheral)")
            logger?.log(type: .receiver, " didFailToConnect error: \(error.debugDescription)")
        #endif

        if let metaData = pendingPeripherals[peripheral] {
            if let lastConnection = metaData.lastConnection,
                Date().timeIntervalSince(lastConnection) > Default.shared.parameters.bluetooth.peripheralDisposeInterval {
                #if CALIBRATION
                    logger?.log(type: .receiver, " didFailToConnect dispose because last connection was \(Date().timeIntervalSince(lastConnection))seconds ago")
                #endif
                pendingPeripherals.removeValue(forKey: peripheral)
                return
            } else if Date().timeIntervalSince(metaData.discovery) > Default.shared.parameters.bluetooth.peripheralDisposeIntervalSinceDiscovery {
                #if CALIBRATION
                    logger?.log(type: .receiver, " didFailToConnect dispose because connection never suceeded and was \(Date().timeIntervalSince(metaData.discovery))seconds ago")
                #endif
                pendingPeripherals.removeValue(forKey: peripheral)
                return
            }
        }
        
        connect(peripheral)
    }

    func connect(_ peripheral: CBPeripheral, delayed: Bool = false) {
        #if CALIBRATION
            logger?.log(type: .receiver, "reconnect to peripheral \(peripheral) \(delayed ? "delayed" : "right away")")
        #endif
        var options: [String: Any]?
        if delayed {
            options = [CBConnectPeripheralOptionStartDelayKey: NSNumber(integerLiteral: 60)]
        }
        manager?.connect(peripheral, options: options)
    }

    func centralManager(_: CBCentralManager, willRestoreState dict: [String: Any]) {
        #if CALIBRATION
            logger?.log(type: .receiver, " CentralManager#willRestoreState")
        #endif
        if let peripherals: [CBPeripheral] = dict[CBCentralManagerRestoredStatePeripheralsKey] as? [CBPeripheral] {
            peripheralsToDiscard = []

            peripherals
                .forEach {
                    let metaData = PeripheralMetaData(discovery: Date().addingTimeInterval(-Default.shared.parameters.bluetooth.peripheralStateRestorationDiscoveryOffset))
                    pendingPeripherals[$0] = metaData
                }
            #if CALIBRATION
                logger?.log(type: .receiver, "CentralManager#willRestoreState restoring peripherals \(pendingPeripherals) discarded \(peripheralsToDiscard.debugDescription) \n")
            #endif
        }
    }

    func peripheral(_ peripheral: CBPeripheral, didReadRSSI RSSI: NSNumber, error _: Error?) {
        #if CALIBRATION
            logger?.log(type: .receiver, "✅ didReadRSSI for \(peripheral) -> rssi: \(RSSI)")
            
        #endif

        pendingPeripherals[peripheral]?.rssiValues[Date()] = Double(truncating: RSSI)

        cancelPeripheralConnectionIfNeeded(peripheral,sendevent: false)
        
        
       if(RSSI.intValue > -58){  //attenuation (usually 12) -RSSI <73, i need more near to send notification set  55
       
            if(UserDefaults.standard.object(forKey: "notifcationcreationTime")==nil){
                let content = UNMutableNotificationContent()
                 content.title = NSLocalizedString("Attenzione", comment: "")
                 content.body = NSLocalizedString("Mantieni la distanza", comment: "")
              
                 let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
                 let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
                 UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
                UserDefaults.standard.set(Date(), forKey:"notifcationcreationTime")
            }
            if let date = UserDefaults.standard.object(forKey: "notifcationcreationTime") as? Date {
               
                if let diff = Calendar.current.dateComponents([.second], from: date, to: Date()).second, diff > 300 {
        
                   //alert
                    let content = UNMutableNotificationContent()
                  content.title = NSLocalizedString("Attenzione", comment: "")
                  content.body = NSLocalizedString("Mantieni la distanza", comment: "")
               
                  let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
                  let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
                  UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
                UserDefaults.standard.set(Date(), forKey:"notifcationcreationTime")
                }
            }
        
        }
        
    }
   
 
}

extension BluetoothDiscoveryService: CBPeripheralDelegate {
    func peripheral(_ peripheral: CBPeripheral, didDiscoverCharacteristicsFor service: CBService, error: Error?) {
        if let error = error {
            #if CALIBRATION
                logger?.log(type: .receiver, " didDiscoverCharacteristicsFor" + error.localizedDescription)
            #endif
            return
        }
        let cbuuid = Default.shared.parameters.bluetooth.characteristicsCBUUID
        guard let characteristic = service.characteristics?.first(where: { $0.uuid == cbuuid }) else {
            return
        }
        peripheral.readValue(for: characteristic)
        #if CALIBRATION
            logger?.log(type: .receiver, " found characteristic \(peripheral.name.debugDescription)")
        #endif
    }

    func peripheral(_ peripheral: CBPeripheral, didUpdateValueFor characteristic: CBCharacteristic, error: Error?) {
        if let error = error {
            #if CALIBRATION
            logger?.log(type: .receiver, " (identifier: \(peripheral.identifier)) didUpdateValueFor " + error.localizedDescription)
            #endif
            manager?.cancelPeripheralConnection(peripheral)
            return
        }

        guard let data = characteristic.value else {
            #if CALIBRATION
                logger?.log(type: .receiver, " → ❌ Could not read data from characteristic of \(peripheral.identifier) at \(Date())")
            #endif
            manager?.cancelPeripheralConnection(peripheral)
            return
        }

        guard data.count == Default.shared.parameters.crypto.keyLength else {
            #if CALIBRATION
                logger?.log(type: .receiver, " → ❌ Received wrong number of bytes (\(data.count) bytes) from \(peripheral.identifier) at \(Date())")
            #endif
            manager?.cancelPeripheralConnection(peripheral)
            return
        }
        #if CALIBRATION
            let identifier = String(data: data[0 ..< 4], encoding: .utf8) ?? "Unable to decode"
            logger?.log(type: .receiver, " → ✅ Received (identifier: \(identifier)) (\(data.count) bytes) from \(peripheral.identifier) at \(Date()): \(data.hexEncodedString)")
        #endif

        pendingPeripherals[peripheral]?.ephID = data

        cancelPeripheralConnectionIfNeeded(peripheral,sendevent: true)
        
       //  send event
              
       
    }

    func peripheral(_ peripheral: CBPeripheral, didDiscoverServices error: Error?) {
        #if CALIBRATION
            logger?.log(type: .receiver, " didDiscoverServices for \(peripheral.identifier)")
        #endif
        if let error = error {
            #if CALIBRATION
                logger?.log(type: .receiver, error.localizedDescription)
            #endif
            return
        }
        if let service = peripheral.services?.first(where: { $0.uuid == Default.shared.parameters.bluetooth.serviceCBUUID }) {
            peripheral.discoverCharacteristics([Default.shared.parameters.bluetooth.characteristicsCBUUID], for: service)
        } else {
            #if CALIBRATION
                logger?.log(type: .receiver, " No service found found: -> (\(peripheral.services?.description ?? "none"))")
            #endif
            manager?.cancelPeripheralConnection(peripheral)
        }
    }
}



