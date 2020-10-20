//
//  ODataLayer.swift
//  safetyAtworks
//
//  Created by Perego, Massimo on 21/05/2020.
//  Copyright © 2020 SAP. All rights reserved.
//

import Foundation
import UIKit
import SAPCommon
import SAPFiori
import SAPFioriFlows
import SAPFoundation
import SAPOData
import SQLite


class ODataLayer{
    
// var v2: V2<OnlineODataProvider>!
private var sapUrlSession: SAPURLSession!
    
    private var myEHPIDsent: String = ""

    
           public weak var logger: LoggingDelegate?
     
    
    init(sapUrlSession: SAPURLSession) {
        self.sapUrlSession = sapUrlSession

    }
    
    public static private(set) var shared: ODataLayer!
    
    public static func initSharedInstance(sapUrlSession: SAPURLSession) {
        let factory = ODataLayer(sapUrlSession: sapUrlSession)
        shared = factory
    }
    
    private init() {
        
    }
    
    
//func sendEvent(myId:String,Idrecevied:String,RSSI:String) throws {
//    
//     let settingsParameters = SAPcpmsSettingsParameters(backendURL: ServiceConfiguration.getHostUrl(), applicationID: ServiceConfiguration.getScpAppId())
//    
//    let destinations = FileConfigurationProvider("AppParameters").provideConfiguration().configuration["Destinations"] as! NSDictionary
//        let destination = (destinations["safetyatworkdestination"] as? String)!
//    
//    let configurationURL = URL(string: settingsParameters.backendURL.appendingPathComponent("safetyatworkdestination").absoluteString)!
//        
//    
//       let odataProvider = OnlineODataProvider(serviceName: "V2", serviceRoot: configurationURL, sapURLSession: sapUrlSession)
//    odataProvider.serviceOptions.checkVersion = false
//   
//    let v2 = V2(provider: odataProvider)
//    
//    
//    let event = EventSetType()
//    event.createdAt = LocalDateTime.now()
//    event.sourceEID = myId
//    event.targetIED = Idrecevied
//    event.distance = BigInteger(RSSI)
//    
//    print(myId)
//    print(Idrecevied)
//     print(RSSI)
//    
//    do {
//       
//        try v2.createEntity(event)
//        NSLog("sent event")
//        
//       
//    }
//    catch{
//        NSLog(error.localizedDescription)
//        throw error
//       
//    }
//    
//}
    
    
    
    ///     let batch = RequestBatch()
    ///     let changes = ChangeSet()
    ///     changes.createEntity(supplier4)
    ///     changes.updateEntity(supplier3)
    ///     changes.deleteEntity(supplier2)
    ///     changes.createEntity(product2)
    ///     changes.createLink(from: product2, property: Product.supplier, to: supplier4)
    ///     changes.updateLink(from: product2, property: Product.supplier, to: supplier3)
    ///     changes.deleteLink(from: product2, property: Product.supplier, to: supplier3)
    ///     let query = DataQuery().from(NorthwindServiceMetadata.EntitySets.suppliers)
    ///     batch.addChanges(changes)
    ///     batch.addQuery(query)
    ///     try service.processBatch(batch)
    
//    func sendEventBatch() throws{
//        let settingsParameters = SAPcpmsSettingsParameters(backendURL: ServiceConfiguration.getHostUrl(), applicationID: ServiceConfiguration.getScpAppId())
//
//           let destinations = FileConfigurationProvider("AppParameters").provideConfiguration().configuration["Destinations"] as! NSDictionary
////        let destination = (destinations["safetyatworkdestination"] as? String)!
//
//        let configurationURL = URL(string: settingsParameters.backendURL.appendingPathComponent("safetyatworkdestination").absoluteString)!
//
//
//         let odataProvider = OnlineODataProvider(serviceName: "V2", serviceRoot: configurationURL, sapURLSession: sapUrlSession)
//           odataProvider.serviceOptions.checkVersion = false
//            odataProvider.traceRequests = true
//            odataProvider.traceWithData = true
//            odataProvider.prettyTracing = true
//           var v2 = V2(provider: odataProvider)
//
//
//
//
//
//        do{
//           var crypto = try DP3TCryptoModule()
//           let data = try? crypto.getCurrentEphID()
//
//            //gethandshake olderthan fixed timestamp and send to BE
//            let nowTimestamp = Date().timeIntervalSince1970
//            var lastBatch: TimeInterval!
//            var storedLastBatch = Default.shared.lastLoadedBatchReleaseTime
//            if (!(storedLastBatch == nil)){
//                storedLastBatch = Date().addingTimeInterval(-TimeInterval.day)
//            }
//            let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
//             let documentsDirectory = paths[0]
//             var filePath = documentsDirectory.appendingPathComponent("DP3T_tracing_db").appendingPathExtension("sqlite")
//
//             var connection = try Connection(filePath.absoluteString, readonly: false)
//
//             var handshakesStorage = try HandshakesStorage(database: connection)
//
//
//            let handshakes = try handshakesStorage.getAll(newerThan: storedLastBatch!)
//
//                 let batch = RequestBatch()
//                 let changes = ChangeSet()
////            /     changes.createEntity(supplier4)
////            /     changes.updateEntity(supplier3)
////            /     changes.deleteEntity(supplier2)
////            /     changes.createEntity(product2)
////            /     changes.createLink(from: product2, property: Product.supplier, to: supplier4)
////            /     changes.updateLink(from: product2, property: Product.supplier, to: supplier3)
////            /     changes.deleteLink(from: product2, property: Product.supplier, to: supplier3)
////            /     let query = DataQuery().from(NorthwindServiceMetadata.EntitySets.suppliers)
////            /     batch.addChanges(changes)
////            /     batch.addQuery(query)
////            /     try service.processBatch(batch)
//
//
//
//
//            for h in handshakes{
//               let event = EventSetType()
//                event.createdAt = LocalDateTime.from(utc: h.timestamp)
//                event.sourceEID = data?.hexEncodedString
//                event.targetIED = h.ephID.hexEncodedString
//                event.distance = BigInteger(String(format: "%.0f",h.RSSI!))
//
//
//                changes.createEntity(event)
//
//            }
//
//            batch.addChanges(changes)
//
//            do {
//
//               // try self.v2.createEntity(event)
//                try v2.processBatch(batch)
//                NSLog("evento inviato")
//
//                Default.shared.lastLoadedBatchReleaseTime = Date()
//
//            }
//            catch{
//                NSLog(error.localizedDescription)
//                throw error
//
//            }
//
//        }catch{
//            NSLog(error.localizedDescription)
//            throw error
//
//        }
//    }
    
    
    func sendContactBatch() throws{
    
//     let settingsParameters = SAPcpmsSettingsParameters(backendURL: ServiceConfiguration.getHostUrl(), applicationID: ServiceConfiguration.getScpAppId())
                
//                   let destinations = FileConfigurationProvider("AppParameters").provideConfiguration().configuration["Destinations"] as! NSDictionary
        //        let destination = (destinations["safetyatworkdestination"] as? String)!
                   
//                let configurationURL = URL(string: settingsParameters.backendURL.appendingPathComponent("safetyatworkdestination").absoluteString)!
                       
                   
//                 let odataProvider = OnlineODataProvider(serviceName: "V2", serviceRoot: configurationURL, sapURLSession: sapUrlSession)
//                   odataProvider.serviceOptions.checkVersion = false
                   
//                var v2 = V2(provider: odataProvider)
                
                
                do{
                    let crypto = try DP3TCryptoModule()
                   let data = try? crypto.getCurrentEphID()
                
                    //gethandshake olderthan fixed timestamp and send to BE
//                    let nowTimestamp = Date().timeIntervalSince1970
//                    var lastBatch: TimeInterval!
                    
                    
                 //   var storedLastBatch = Default.shared.lastLoadedBatchReleaseTime
                    
//                   var storedLastBatch =  UserDefaults.standard.object(forKey: "lastLoadedBatchReleaseTime") as? Date
//                    let timestamp = DateFormatter.localizedString(from: storedLastBatch!, dateStyle: .medium, timeStyle: .short)
//                    NSLog("✅ BGTASK storedLastBatch: "+timestamp)
             
            
//              if(UserDefaults.standard.object(forKey: "lastEPHIDsbatchTime")==nil){
//
//                //send day ephemerals
                let date = Date()
                let cal = Calendar(identifier: .gregorian)
                let newDate = cal.startOfDay(for: date)
//                        do {
//                            let todayephsIDs =  try crypto.getEphIDsForToday() as [EphID]//get today ephsid
//
//
//                            for ephid in todayephsIDs{
//                                let myephID = EphemeralIDSetType()
//                                myephID.createdAt = LocalDateTime.from(utc: newDate)
//                                myephID.eid = ephid.hexEncodedString
//                                myephID.deviceID = UserDefaults.standard.object(forKey: Networking.usernameKey) as! String
//
//                                    print(myephID.eid)
//                                  print(myephID.deviceID)
//
//
//                                    try  v2.createEntity(myephID)
//                                    NSLog(" ✅ sent ephemeral")
//
//                                }
//                            }
//                            catch{
//                                NSLog("❌ send my ephemeral error: \(error)")
//
//                            }
//
//
//                    UserDefaults.standard.set(newDate, forKey:"lastEPHIDsbatchTime")
//
//                }
//              else{
//                //check if today already sent ephID
//                 if let storedephemeralIDsBatch = UserDefaults.standard.object(forKey: "lastEPHIDsbatchTime") as? Date {
//
//                    let date = Date()
//                    let cal = Calendar(identifier: .gregorian)
//                    let newDate = cal.startOfDay(for: date)
//
//                    if let diff = Calendar.current.dateComponents([.day], from: storedephemeralIDsBatch, to: newDate).day, diff >= 0 {
//                        //difference 1 day i must send new ephemeralids
//                        do {
//                             NSLog("✅ preparing ephemeral batch")
//
////                            let batch = RequestBatch()
////                            let changes = ChangeSet()
//
//                          var todayephsIDs =  try crypto.getEphIDsForToday() as [EphID]//get today ephsid
//                            var aday = DayDate.init()
//                           //TO TEST
////                            for _ in 1..<diff{
////
////                                aday = aday.getPrevious()
////                                let adayephsIDs = try crypto.getEphIDsForToday(day: aday) as [EphID]//get today ephsid
////
////                                todayephsIDs.append(contentsOf: adayephsIDs)
////                            }
//                            //
//                          for ephid in todayephsIDs{
//                              let myephID = EphemeralIDSetType()
//                              myephID.createdAt = LocalDateTime.from(utc: newDate)
//                              myephID.eid = ephid.hexEncodedString
//                              myephID.deviceID = UserDefaults.standard.object(forKey: Networking.usernameKey) as! String
//
//                            NSLog(myephID.eid ?? " ")
//                            NSLog(myephID.deviceID ?? " ")
//
//                           // changes.createEntity(myephID)
//                                  try  v2.createEntity(myephID)
//                                   NSLog("✅ sent ephemeral")
//
//                              }
//
//
//                        //    batch.addChanges(changes)
//
//                          //    try self.v2.processBatch(batch)
//
//                             UserDefaults.standard.set(newDate, forKey:"lastEPHIDsbatchTime")
//                          }
//                          catch{
//                              NSLog("❌ send my ephemeral error: \(error)")
//                              //ephemeral id already present in DB
//                          }
//
//
//
//
//                    }
//
//                }
//
//                }
                    
    
                    sendEphemeralQueue { (isOk) in
                        if(isOk){
                           UserDefaults.standard.set(newDate, forKey:"lastEPHIDsbatchTime")
                           #if BACKEND_NOTIF
                            let center = UNUserNotificationCenter.current()
                            let content = UNMutableNotificationContent()
                                                                                content.title = DP3TBackgroundTaskManager.taskIdentifier
                                                                                content.body = "inviati epehermal!!: \(Date().description)"
                                                                                content.sound = UNNotificationSound.default
                                                                                let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 1, repeats: false)
                                                                                let requestq = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
                                                                                center.add(requestq)
                            #endif
                        }
                        else{
                             #if CALIBRATION
                            let center = UNUserNotificationCenter.current()
                            let content = UNMutableNotificationContent()
                                                                                content.title = DP3TBackgroundTaskManager.taskIdentifier
                                                                                content.body = "non inviati epehermal!!: \(Date().description)"
                                                                                content.sound = UNNotificationSound.default
                                                                                let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 1, repeats: false)
                                                                                let requestq = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
                                                                                center.add(requestq)
                            #endif
                        }
                    }
                    
                    
     //END send ephemeral
            if(UserDefaults.standard.object(forKey: "lastLoadedBatchReleaseTime")==nil){
                            
                            
        //                    if (!(storedLastBatch == nil)){
                                //if it's the first time, put yesterday date
                             //   storedLastBatch = Date().addingTimeInterval(-TimeInterval.day)
                            
                             UserDefaults.standard.set(Date().addingTimeInterval(-TimeInterval.day), forKey:"lastLoadedBatchReleaseTime")
        //                    }
                    }
                    
    if let storedLastBatch = UserDefaults.standard.object(forKey: "lastLoadedBatchReleaseTime") as? Date {
                    //DB CONNECTION
                    let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
                     let documentsDirectory = paths[0]
        let filePath = documentsDirectory.appendingPathComponent("DP3T_tracing_db").appendingPathExtension("sqlite")
                    
        let connection = try Connection(filePath.absoluteString, readonly: false)
                    
        let handshakesStorage = try HandshakesStorage(database: connection)
                    
                    //GET HANDSAHKES
            let handshakes = try handshakesStorage.getAll(newerThan: storedLastBatch)
                    
                    NSLog("✅ BGTASK NEW HANDSHAKE: %d",handshakes.count)
        #if BACKEND_NOTIF
        let center = UNUserNotificationCenter.current()
                         let content = UNMutableNotificationContent()
                         content.title = DP3TBackgroundTaskManager.taskIdentifier
                         content.body = "BGTASK NEW HANDSHAKE: \(Date().description)"
                         content.sound = UNNotificationSound.default
                         let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 1, repeats: false)
                         let requestq = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
                         center.add(requestq)
        #endif
                    let contacts = self.createContacts(from: handshakes)
                    
                    
//                    let batch = RequestBatch()
//                    let changes = ChangeSet()
                  
                    if(contacts.count>0){
                        
                        //use queue method
                        
                        sendEventQueue(sourceEHPID: data!.hexEncodedString, eventArray: contacts) { (imported) in
                            print(imported)
                            if(imported){
                                 UserDefaults.standard.set(Date(), forKey:"lastLoadedBatchReleaseTime")
                                #if BACKEND_NOTIF
                                let center = UNUserNotificationCenter.current()
                                let content = UNMutableNotificationContent()
                                                                                    content.title = DP3TBackgroundTaskManager.taskIdentifier
                                                                                    content.body = " inviati contatti!!: \(Date().description)"
                                                                                    content.sound = UNNotificationSound.default
                                                                                    let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 1, repeats: false)
                                                                                    let requestq = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
                                                                                    center.add(requestq)
                                #endif
                            }
                            else{
                                 #if BACKEND_NOTIF
                                let center = UNUserNotificationCenter.current()
                                let content = UNMutableNotificationContent()
                                                                                    content.title = DP3TBackgroundTaskManager.taskIdentifier
                                                                                    content.body = "non inviati contatti!!: \(Date().description)"
                                                                                    content.sound = UNNotificationSound.default
                                                                                    let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 1, repeats: false)
                                                                                    let requestq = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
                                                                                    center.add(requestq)
                                #endif
                            }
                        }
                        
                        
//                        for c in contacts{
//                           let event = EventSetType()
//
//
//
//                            event.createdAt = LocalDateTime.from(utc: c.date)
//                            event.sourceEID = data?.hexEncodedString
//                            event.targetIED = c.ephID.hexEncodedString
//
//                            event.distance = BigInteger(c.windowCount) //
//
//
//                            NSLog("✅ sourceEID: \(data?.hexEncodedString ?? "")")
//                            NSLog("✅ targetIED:  \(c.ephID.hexEncodedString)")
//                            NSLog("✅ distance: \(c.windowCount)")
//
//                            logger?.log(type: .backgroundTask, "✅ sourceEID: \(data?.hexEncodedString ?? "")")
//                             logger?.log(type: .backgroundTask, "✅ targetIED:  \(c.ephID.hexEncodedString)")
//                             logger?.log(type: .backgroundTask, "✅ distance: \(c.windowCount)")
//
////                            changes.createEntity(event)
//
//                            do {
//
//
//                                try v2.createEntity(event)
////                              try self.v2.processBatch(batch)
//                                NSLog("✅ evento inviato")
//                                logger?.log(type: .backgroundTask, "✅ evento inviato")
//
//
//                                let nowTimestamp = Date().timeIntervalSince1970
//                                let lastBatch = Date(timeIntervalSince1970: nowTimestamp)
//
//                             //   Default.shared.lastLoadedBatchReleaseTime = Date()
//
//                            UserDefaults.standard.set(Date(), forKey:"lastLoadedBatchReleaseTime")
//
//                            }
//                            catch{
//                                NSLog("❌ "+error.localizedDescription)
//                                throw error
//
//                            }
//
//
//                        }
                   
                    
//                        batch.addChanges(changes)
                       
                      
                    }
            }
                }catch{
                    NSLog("❌ "+error.localizedDescription)
                    throw error
                   
                }
        
        
        //check if there is a possible contagion
        
        self.IMInfected(finished: { infected in
                if(infected){
                    let center = UNUserNotificationCenter.current()
                    let content = UNMutableNotificationContent()
                   content.title = NSLocalizedString("Attenzione", comment: "")
                   content.body = NSLocalizedString("alertInfected", comment: "")
                   content.sound = UNNotificationSound.default
                   let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 1, repeats: false)
                   let requestq = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
                  center.add(requestq)
                    
            }
            
        })
        
}
    
    
    
    func createContacts(from handshakes: [HandshakeModel]) -> [Contact] {
        let parameters = Default.shared.parameters.contactMatching
        var groupedHandshakes = [EphID: [HandshakeModel]]()

        // group handhakes by id
        for handshake in handshakes {
            if groupedHandshakes.keys.contains(handshake.ephID) {
                groupedHandshakes[handshake.ephID]?.append(handshake)
            } else {
                groupedHandshakes[handshake.ephID] = [handshake]
            }
        }

        let contacts: [Contact] = groupedHandshakes.compactMap { element -> Contact? in
            let ephID = element.key
            let handshakes = element.value

            let attenutationValues: [(Date, Double)] = handshakes.compactMap { handshake -> (Date, Double)? in
                guard let rssi = handshake.RSSI else { return nil }

                let txPower = handshake.TXPowerlevel ?? parameters.defaultTxPowerLevel

                let attenuation = txPower - rssi

                return (handshake.timestamp, attenuation)
            }

            guard let firstValue = attenutationValues.first else { return nil }

            let epochStart = DP3TCryptoModule.getEpochStart(timestamp: firstValue.0)

            let windowLength = Int(Default.shared.parameters.crypto.secondsPerEpoch / parameters.windowDuration)
       
            NSLog("windowlenght %f",windowLength)
            var numberOfMatchingWindows = 0

            for windowIndex in 0 ..< windowLength {
                let start = epochStart.addingTimeInterval(Double(windowIndex) * parameters.windowDuration)
                let end = start.addingTimeInterval(parameters.windowDuration)

                let values = attenutationValues.filter { (timestamp, _) -> Bool in
                    timestamp > start && timestamp <= end
                }.map { $0.1 }

                guard !values.isEmpty else { continue }

                let windowMean = values.reduce(0.0, +) / Double(values.count)

                if windowMean < parameters.contactAttenuationThreshold {
                    numberOfMatchingWindows += 1
                }
            }

            if numberOfMatchingWindows != 0 {
                 NSLog("create contact")
                let timestamp = firstValue.0.timeIntervalSince1970
              //  let bucketTimestamp = timestamp - timestamp.truncatingRemainder(dividingBy: Default.shared.parameters.networking.batchLength)
                let bucketTimestamp = timestamp
                
                 NSLog("✅ contact numberOfMatchingWindows: \(numberOfMatchingWindows)")
                logger?.log(type: .backgroundTask, "✅ contact numberOfMatchingWindows: \(numberOfMatchingWindows)")
                return Contact(identifier: nil,
                               ephID: ephID,
                               date: Date(timeIntervalSince1970: bucketTimestamp),
                               windowCount: numberOfMatchingWindows,
                               associatedKnownCase: nil)
            }

            return nil
        }

        return contacts
    }
    
    

func getBeaconDevices() -> [DeviceSetType]{
    //chiamata Odata
//        let destinations = FileConfigurationProvider("AppParameters").provideConfiguration().configuration["Destinations"] as! NSDictionary
//               let destination = (destinations["safetyatworkdestination"] as? String)!
              
        let settingsParameters = SAPcpmsSettingsParameters(backendURL: ServiceConfiguration.getHostUrl(), applicationID: ServiceConfiguration.getScpAppId())

        let configurationURL = URL(string: settingsParameters.backendURL.appendingPathComponent("safetyatworkdestination").absoluteString)!
        
        let odataProvider = OnlineODataProvider(serviceName: "V2", serviceRoot: configurationURL, sapURLSession: sapUrlSession)
        //remove in production
        odataProvider.serviceOptions.checkVersion = false
        let v2 = V2(provider: odataProvider)
        
        
        
        do {
            let query = DataQuery()
                .filter(
                    DeviceSetType.type_ == "BEACON")
            
            
            let devices = try v2.fetchDeviceSet(matching: query, headers: nil, options: nil)
            
            if( devices.count>0){
                //                    for i in 0 ..< devices!.count{
                //                        print(devices?[i].deviceID)
                //                         print(devices?[i].type_)
                //                    }
                
                return devices
            }
            else
            {
                return [DeviceSetType].init()
            }
        }
        catch{
            NSLog(error.localizedDescription)
            NSLog("erroreeee")
            return [DeviceSetType].init()
        }
    
        
    }
    
//    func sendMyEphemeral(ephemeralID:String){
        
        
//        if( ephemeralID != myEHPIDsent){
//         let settingsParameters = SAPcpmsSettingsParameters(backendURL: ServiceConfiguration.getHostUrl(), applicationID: ServiceConfiguration.getScpAppId())
//
//        let destinations = FileConfigurationProvider("AppParameters").provideConfiguration().configuration["Destinations"] as! NSDictionary
//            let destination = (destinations["safetyatworkdestination"] as? String)!
//
//        let configurationURL = URL(string: settingsParameters.backendURL.appendingPathComponent("safetyatworkdestination").absoluteString)!
//
//          let odataProvider = OnlineODataProvider(serviceName: "V2", serviceRoot: configurationURL, sapURLSession: sapUrlSession)
//       //remove in production
//            odataProvider.serviceOptions.checkVersion = false
//        var v2 = V2(provider: odataProvider)
//
//        let myephID = EphemeralIDSetType()
//        myephID.createdAt = LocalDateTime.now()
//        myephID.eid = ephemeralID
//        myephID.deviceID = UserDefaults.standard.object(forKey: Networking.usernameKey) as! String
//
//        print(ephemeralID)
//          print(myephID.deviceID)
//
//        do {
//            NSLog("send my ephemeral \(ephemeralID)")
//            try  v2.createEntity(myephID)
//            NSLog("sent")
//            myEHPIDsent = ephemeralID
//        }
//        catch{
//            NSLog("send my ephemeral error: \(error)")
//
//        }
//        }
//        else{
//            NSLog("Already SENT this ephID")
//        }
//    }
    
    func sendMyDevice(){
           
           
        let settingsParameters = SAPcpmsSettingsParameters(backendURL: ServiceConfiguration.getHostUrl(), applicationID: ServiceConfiguration.getScpAppId())
        
//        let destinations = FileConfigurationProvider("AppParameters").provideConfiguration().configuration["Destinations"] as! NSDictionary
        //               let destination = (destinations["safetyatworkdestination"] as? String)!
        
        let configurationURL = URL(string: settingsParameters.backendURL.appendingPathComponent("safetyatworkdestination").absoluteString)!
        
        let odataProvider = OnlineODataProvider(serviceName: "V2", serviceRoot: configurationURL, sapURLSession: sapUrlSession)
        //remove in production
        odataProvider.serviceOptions.checkVersion = false
        let v2 = V2(provider: odataProvider)
        
        
        
        
        
        let mydevice = DeviceSetType()
        mydevice.type_ = "USER"
        mydevice.description = UserDefaults.standard.object(forKey: Networking.usernameDescriptionKey) as? String
        mydevice.deviceID = UserDefaults.standard.object(forKey: Networking.usernameKey) as? String
        
        mydevice.createdAt = LocalDateTime.now()
        mydevice.updatedAt = LocalDateTime.now()
        mydevice.createdBy = ""
        mydevice.updatedBy = ""
        mydevice.ownedBy = DeviceSetType.init()
        mydevice.ownedByID = ""
        mydevice.major = ""
        mydevice.minor = ""
        mydevice.capacity = 0
        
        
        
        do {
            NSLog("send my mydevice \(mydevice)")
            try  v2.createEntity(mydevice)
            NSLog("sent")
            
        }
        catch{
            NSLog("send my mydevice error: \(error)")
            
        }
                      
          
            
            
          
        
       }
    
    
    func iminRoom(myId:String,UUIDBeacon:String,RSSI:BigInteger){
           
        let settingsParameters = SAPcpmsSettingsParameters(backendURL: ServiceConfiguration.getHostUrl(), applicationID: ServiceConfiguration.getScpAppId())
        
//        let destinations = FileConfigurationProvider("AppParameters").provideConfiguration().configuration["Destinations"] as! NSDictionary
        //            let destination = (destinations["safetyatworkdestination"] as? String)!
        
        let configurationURL = URL(string: settingsParameters.backendURL.appendingPathComponent("safetyatworkdestination").absoluteString)!
        
        let odataProvider = OnlineODataProvider(serviceName: "V2", serviceRoot: configurationURL, sapURLSession: sapUrlSession)
        odataProvider.serviceOptions.checkVersion = false
      //  let v2 = V2(provider: odataProvider)
        
        let event = EventSetType()
        event.createdAt = LocalDateTime.now()
        event.sourceEID = myId
        event.targetIED = UUIDBeacon
        event.distance = RSSI
   
       
        
        
        
        do {
           // try v2.createEntity(event)
            
            sendinRoomQueue(sourceEHPID: myId, BeaconUUID: UUIDBeacon, distance: RSSI.toString()) { (success) in
                NSLog("😃 created inroom!")
            }
           
            
        }
        catch{
            NSLog(error.localizedDescription)
        }
           
       }
    
    func sendinRoomQueue(sourceEHPID:String,BeaconUUID:String,distance:String,finished: @escaping((_ isSuccess: Bool)->Void)) {
        let settingsParameters = SAPcpmsSettingsParameters(backendURL: ServiceConfiguration.getHostUrl(), applicationID: ServiceConfiguration.getScpAppId())
        
        let configurationURL = URL(string: settingsParameters.backendURL.appendingPathComponent("xsjsFunctions").absoluteString)!
        let center = UNUserNotificationCenter.current()
        print(configurationURL.absoluteString)
        //                let username = UserDefaults.standard.object(forKey: Networking.usernameKey) as! String
        var request = URLRequest(url: configurationURL)
        request.httpMethod = "POST"
        
        var array = Array<Any>.init()
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let convertedDate = formatter.string(from: Date.init())
        
        let dictionary = ["CreatedAt":convertedDate,
                          "Distance":distance,
                          "SourceEID":sourceEHPID,
                          "TargetIED":BeaconUUID] as [String : Any]
        array.append(dictionary)
        
        let json: [String: Any] = [
            "function": "importEvents",
            "payload":[
                "events":
                array    ]
        ]
            
            
            
            let jsonData = try? JSONSerialization.data(withJSONObject:json)
            request.httpBody = jsonData //try? JSONSerialization.data(withJSONObject: data, options: [])
            //            request.setValue("Basic \(base64LoginString)", forHTTPHeaderField: "Authorization")
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
            
            let session = sapUrlSession
     
            let task = session!.dataTask(with: request as URLRequest, completionHandler: {(data, response, error) in
                //  print(response!)
                do {
                    NSLog("✅ inviato json")
                    NSLog("❌  errorev: \(String(describing: error?.localizedDescription))")
                  
                    
                    if(data != nil){
                        let dataString = String(data: data!, encoding: .utf8)
                        //non è json
                        NSLog("✅ \(String(describing: dataString))")
                        
                        let json = try JSONSerialization.jsonObject(with: data!) as! NSDictionary
                        if(json.allKeys[0] as! String == "error"){
                            let meet = json.value(forKey: "error") as! NSDictionary
                            
                            let errormessage=meet.value(forKey: "message")
                            NSLog(errormessage as! String)
                            finished(false)
                        }
                            
                        else{
                            if(json.allKeys.count>0){
                                let meet = json.value(forKey: "value") as! NSDictionary
                                let numbersIn = meet["countImportedEvents"] as! Int
                                NSLog("countImportedEvents \(numbersIn)")
                                finished(true)
                            }
                            else
                                
                            {
                                finished(false)
                            }
                        }
                        
                        
                        
                        
                    }
                    
                } catch {
                    print(error)
                     NSLog("❌  error1: \(error.localizedDescription)")
                }
            })
            
            task.resume()
    }

    func sendEventQueue(sourceEHPID:String,eventArray:[Contact],finished: @escaping((_ isSuccess: Bool)->Void)) {
                    
   
        let settingsParameters = SAPcpmsSettingsParameters(backendURL: ServiceConfiguration.getHostUrl(), applicationID: ServiceConfiguration.getScpAppId())
        
        let configurationURL = URL(string: settingsParameters.backendURL.appendingPathComponent("xsjsFunctions").absoluteString)!
        let center = UNUserNotificationCenter.current()
        print(configurationURL.absoluteString)
        //                let username = UserDefaults.standard.object(forKey: Networking.usernameKey) as! String
        var request = URLRequest(url: configurationURL)
        request.httpMethod = "POST"
        
        //                let dict = ["CreatedAt":"2020-06-12 15:19:48",
        //                            "Distance":3333,
        //                            "SourceEID":"87 e8 2b 04 80 c4 d9 ae 1f 3e c5 28 76 bd 42 8a ",
        //                            "TargetIED":"61 b7 aa e9 f3 94 87 b5 a8 13 86 85 32 d8 b4 17 "] as [String : Any]
        //
        //                let dict2 = ["CreatedAt":"2020-06-12 15:19:48",
        //                           "Distance":3333,
        //                           "SourceEID":"87 e8 2b 04 80 c4 d9 ae 1f 3e c5 28 76 bd 42 8a ",
        //                           "TargetIED":"61 b7 aa e9 f3 94 87 b5 a8 13 86 85 32 d8 b4 17 "] as [String : Any]
        //
        
        //                event.createdAt = LocalDateTime.from(utc: c.date)
        //                event.sourceEID = data?.hexEncodedString
        //                event.targetIED = c.ephID.hexEncodedString
        //                event.distance = BigInteger(c.windowCount)
        
        var array = Array<Any>.init()
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        
        
        
        for c in eventArray {
            
            let convertedDate = formatter.string(from: c.date)
            
            let dictionary = ["CreatedAt":convertedDate,
                              "Distance":c.windowCount,
                              "SourceEID":sourceEHPID,
                              "TargetIED":c.ephID.hexEncodedString] as [String : Any]
            
            NSLog("✅ sourceEID: \(sourceEHPID)")
            NSLog("✅ targetIED:  \(c.ephID.hexEncodedString)")
            NSLog("✅ distance: \(c.windowCount)")
            array.append(dictionary)
        }
        
        let json: [String: Any] = [
            "function": "importEvents",
            "payload":[
                "events":
                array
                //                            ["CreatedAt":"2020-06-12 15:19:47",
                //                            "Distance":333,
                //                            "SourceEID":"87 e8 2b 04 80 c4 d9 ae 1f 3e c5 28 76 bd 42 8a ",
                //                            "TargetIED":"61 b7 aa e9 f3 94 87 b5 a8 13 86 85 32 d8 b4 17 "
                //                            ],
                //                            [
                //                            "CreatedAt":"2020-06-12 14:19:47",
                //                            "Distance":333,
                //                            "SourceEID":"88 e8 2b 04 80 c4 d9 ae 1f 3e c5 28 76 bd 42 8a ",
                //                            "TargetIED":"68 b7 aa e9 f3 94 87 b5 a8 13 86 85 32 d8 b4 17 "
                //                            ]
                
            ]
        ]
        //            let string = "{\"function\":\"checkInfection\",\"payload\":{\"deviceId\":\"\(username)\"}}"
        //            let json2 = string.data(using: .utf8)!
        //            print(string)
        //            let data = Data(string.utf8)
        //
        //
        //            let body = try? JSONSerialization.jsonObject(with: json2, options: []) as? [String: Any]
        //             print(body)
        NSLog("✅ ready to send json")
       
         #if BACKEND_NOTIF
        let content = UNMutableNotificationContent()
        content.title = DP3TBackgroundTaskManager.taskIdentifier
        content.body = "ready to send json: \(Date().description)"
        content.sound = UNNotificationSound.default
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 1, repeats: false)
        let requestq = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
        center.add(requestq)
        #endif
        
        let jsonData = try? JSONSerialization.data(withJSONObject:json)
        request.httpBody = jsonData //try? JSONSerialization.data(withJSONObject: data, options: [])
        //            request.setValue("Basic \(base64LoginString)", forHTTPHeaderField: "Authorization")
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let session = sapUrlSession
 
        let task = session!.dataTask(with: request as URLRequest, completionHandler: {(data, response, error) in
            //  print(response!)
            do {
                NSLog("✅ inviato json")
                NSLog("❌  errorev: \(String(describing: error?.localizedDescription))")
                #if BACKEND_NOTIF
                let content = UNMutableNotificationContent()
                content.title = DP3TBackgroundTaskManager.taskIdentifier
                content.body = "inviato json: \(Date().description)"
                content.sound = UNNotificationSound.default
                let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 1, repeats: false)
                let requestq = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
                center.add(requestq)
                #endif
                
                if(data != nil){
                    let dataString = String(data: data!, encoding: .utf8)
                    //non è json
                    NSLog("✅ \(String(describing: dataString))")
                     #if BACKEND_NOTIF
                    let content = UNMutableNotificationContent()
                    content.title = DP3TBackgroundTaskManager.taskIdentifier
                    content.body = "inviato json  2 \(String(describing: dataString))"
                    content.sound = UNNotificationSound.default
                    let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 1, repeats: false)
                    let requestq = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
                    center.add(requestq)
                    #endif
                    let json = try JSONSerialization.jsonObject(with: data!) as! NSDictionary
                    if(json.allKeys[0] as! String == "error"){
                        let meet = json.value(forKey: "error") as! NSDictionary
                        
                        let errormessage=meet.value(forKey: "message")
                        NSLog(errormessage as! String)
                        finished(false)
                    }
                        
                    else{
                        if(json.allKeys.count>0){
                            let meet = json.value(forKey: "value") as! NSDictionary
                            let numbersIn = meet["countImportedEvents"] as! Int
                            NSLog("countImportedEvents \(numbersIn)")
                            finished(numbersIn == eventArray.count)
                        }
                        else
                            
                        {
                            finished(false)
                        }
                    }
                    
                    
                    
                    
                }
                
            } catch {
                print(error)
                 NSLog("❌  error1: \(error.localizedDescription)")
            }
        })
        
        task.resume()
        
    }
    
    func sendEphemeralQueue(finished: @escaping((_ isSuccess: Bool)->Void)) {
                        
       
        let settingsParameters = SAPcpmsSettingsParameters(backendURL: ServiceConfiguration.getHostUrl(), applicationID: ServiceConfiguration.getScpAppId())
        
        let configurationURL = URL(string: settingsParameters.backendURL.appendingPathComponent("xsjsFunctions").absoluteString)!
        
        print(configurationURL.absoluteString)
        //                    let username = UserDefaults.standard.object(forKey: Networking.usernameKey) as! String
        var request = URLRequest(url: configurationURL)
        request.httpMethod = "POST"
        
        
        
        var array = Array<Any>.init()
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        
        /*
         {
         "function": "insertEIDs",
         "payload" : {
         "EIDs": [
         {"CreatedAt":"2020-06-11T16:20:50Z", "EID":"80 e8 2b 04 80 c4 d9 ae 1f 3e c5 28 76 bd 42 8b ","DeviceI":"roberto.urban@sap.com"},
         {"CreatedAt":"2020-06-11T16:20:50Z", "EID":null,"DeviceID":"roberto.urban@sap.com"}
         ]
         }
         }
         */
         #if BACKEND_NOTIF
        let center = UNUserNotificationCenter.current()
        let content = UNMutableNotificationContent()
        content.title = DP3TBackgroundTaskManager.taskIdentifier
        content.body = "send ephemeral at \(Date().description)"
        content.sound = UNNotificationSound.default
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 1, repeats: false)
        let requestq = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
        center.add(requestq)
        #endif
        if(UserDefaults.standard.object(forKey: "lastEPHIDsbatchTime")==nil){
            
            let beforeyesterday = Calendar.current.date(byAdding: .day, value: -2, to: Date())
            UserDefaults.standard.set(beforeyesterday, forKey:"lastEPHIDsbatchTime")
            
            
        }
        
        //check if today already sent ephID
        if let storedephemeralIDsBatch = UserDefaults.standard.object(forKey: "lastEPHIDsbatchTime") as? Date {
            
            let date = Date()
            let cal = Calendar(identifier: .gregorian)
            let newDate = cal.startOfDay(for: date)
            
            if let diff = Calendar.current.dateComponents([.day], from: storedephemeralIDsBatch, to: newDate).day, diff >= 1 {
                
                do {
                    let crypto = try DP3TCryptoModule()
                    //                                    let data = try? crypto.getCurrentEphID()
                    
                    var todayephsIDs =  try crypto.getEphIDsForToday() as [EphID]//get today ephsid
                    
                    var day = DayDate.init()
                    if(diff>1){
                        //more than one day to send
                        for _ in 1 ... diff{
                            day = day.getPrevious()
                            let anotherdayephsIDs = try crypto.getEphIDsForToday(day: day) as [EphID]
                            
                            todayephsIDs.append(contentsOf: anotherdayephsIDs)
                            
                            
                        }
                        
                    }
                    
                    for ephid in todayephsIDs{
                        
                        
                        let convertedDate = formatter.string(from: Date())
                        
                        let dictionary = ["CreatedAt":convertedDate,
                                          "EID":ephid.hexEncodedString,
                                          "DeviceID":UserDefaults.standard.object(forKey: Networking.usernameKey) as! String ] as [String : Any]
                        array.append(dictionary)
                        
                        
                        
                        NSLog(" ✅ sent ephemeral")
                        
                    }
                }
                catch{
                    NSLog("❌ send my ephemeral error: \(error)")
                    
                }
                
                
                if(array.count>0){
                    let json: [String: Any] = [
                        "function": "insertEIDs",
                        "payload":[
                            "EIDs":
                            array
                            
                        ]
                    ]
                    
                    #if BACKEND_NOTIF
                    let content = UNMutableNotificationContent()
                    content.title = DP3TBackgroundTaskManager.taskIdentifier
                    content.body = "ready to send json eph at \(Date().description)"
                    content.sound = UNNotificationSound.default
                    let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 1, repeats: false)
                    let requestq = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
                    center.add(requestq)
                    #endif
                    
                    NSLog("✅ ready to send json eph")
                    let jsonData = try? JSONSerialization.data(withJSONObject:json)
                    request.httpBody = jsonData //try? JSONSerialization.data(withJSONObject: data, options: [])
                    //            request.setValue("Basic \(base64LoginString)", forHTTPHeaderField: "Authorization")
                    request.addValue("application/json", forHTTPHeaderField: "Content-Type")
                    
                    let session = sapUrlSession
                    
                    
                    
                    
                    let task = session!.dataTask(with: request as URLRequest, completionHandler: {(data, response, error) in
                        //  print(response!)
                        do {
                            NSLog("✅ inviato json EPHID")
                            NSLog("❌  error: \(String(describing: error?.localizedDescription))")
                            
                            #if BACKEND_NOTIF
                            let content = UNMutableNotificationContent()
                            content.title = DP3TBackgroundTaskManager.taskIdentifier
                            content.body = "inviato json EPHID \(Date().description) ❌  error: \(String(describing: error?.localizedDescription))"
                            content.sound = UNNotificationSound.default
                            let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 1, repeats: false)
                            let requestq = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
                            center.add(requestq)
                            #endif
                            if(data != nil){
                                let dataString = String(data: data!, encoding: .utf8)
                                //non è json
                                NSLog("✅ \(String(describing: dataString))")
                                
                                #if BACKEND_NOTIF
                                let content = UNMutableNotificationContent()
                                content.title = DP3TBackgroundTaskManager.taskIdentifier
                                content.body = "inviato json EPHID 2 \(String(describing: dataString))"
                                content.sound = UNNotificationSound.default
                                let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 1, repeats: false)
                                let requestq = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
                                center.add(requestq)
                                #endif
                                let json = try JSONSerialization.jsonObject(with: data!) as! NSDictionary
                                
                                if(json.allKeys[0] as! String == "error"){
                                    let meet = json.value(forKey: "error") as! NSDictionary
                                    
                                    let errormessage=meet.value(forKey: "message")
                                    NSLog(errormessage as! String)
                                    #if BACKEND_NOTIF
                                                                   let content = UNMutableNotificationContent()
                                                                   content.title = DP3TBackgroundTaskManager.taskIdentifier
                                                                   content.body = "inviato json EPHID 2 errormessage \(String(describing: errormessage))"
                                                                   content.sound = UNNotificationSound.default
                                                                   let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 1, repeats: false)
                                                                   let requestq = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
                                                                   center.add(requestq)
                                    #endif
                                    
                                    
                                    
                                    finished(false)
                                }
                                else{
                                    let meet = json.value(forKey: "value") as! NSDictionary
                                    if(meet.allKeys.count>0)
                                        
                                    {
                                        let numbersIn = meet["countImportedEvents"] as! Int
                                        print("countImportedEvents \(numbersIn)")
                                        //                                        UserDefaults.standard.set(newDate, forKey:"lastEPHIDsbatchTime")
                                        let skippedRecords = meet["skippedRecords"] as! NSArray
                                        let skipNumber = skippedRecords.count
                                    #if BACKEND_NOTIF
                                     let content = UNMutableNotificationContent()
                                     content.title = DP3TBackgroundTaskManager.taskIdentifier
                                     content.body = "inviato json EPHID 2 countImportedEvents \(String(describing: numbersIn))"
                                     content.sound = UNNotificationSound.default
                                     let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 1, repeats: false)
                                     let requestq = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
                                     center.add(requestq)
                                     #endif
                                        //FIX sum of imported + already imported must be == total
                                        finished(numbersIn+skipNumber == array.count)
                                    }
                                    else
                                        
                                    {
                                        finished(false)
                                    }
                                }
                                
                                
                            }
                            
                        } catch {
                            print(error)
                            NSLog("❌  error: \(error.localizedDescription)")
                        }
                    })
                    
                    task.resume()
                    
                }
                
            }
            
        }

        
}
    
    func IMInfected(finished: @escaping((_ isSuccess: Bool)->Void)) {
                
         
            let settingsParameters = SAPcpmsSettingsParameters(backendURL: ServiceConfiguration.getHostUrl(), applicationID: ServiceConfiguration.getScpAppId())
            
            let configurationURL = URL(string: settingsParameters.backendURL.appendingPathComponent("xsjsFunctions").absoluteString)!
            
            print(configurationURL.absoluteString)
            let username = UserDefaults.standard.object(forKey: Networking.usernameKey) as! String
            var request = URLRequest(url: configurationURL)
                request.httpMethod = "POST"
             let json: [String: Any] = [
                "function": "checkInfection",
                 "payload": [
                    "deviceId":username
                ]
            ]
//            let string = "{\"function\":\"checkInfection\",\"payload\":{\"deviceId\":\"\(username)\"}}"
//            let json2 = string.data(using: .utf8)!
//            print(string)
//            let data = Data(string.utf8)
//
//
//            let body = try? JSONSerialization.jsonObject(with: json2, options: []) as? [String: Any]
//             print(body)
           
            let jsonData = try? JSONSerialization.data(withJSONObject:json)
            request.httpBody = jsonData //try? JSONSerialization.data(withJSONObject: data, options: [])
    //            request.setValue("Basic \(base64LoginString)", forHTTPHeaderField: "Authorization")
                request.addValue("application/json", forHTTPHeaderField: "Content-Type")
                
                let session = sapUrlSession
            
          
            
            
        let task = session!.dataTask(with: request as URLRequest, completionHandler: {(data, response, error) in
                  //  print(response!)
                    do {
                        if(data != nil){
                        let dataString = String(data: data!, encoding: .utf8)
                       //non è json
                            print(dataString ??  "")
                            let json = try JSONSerialization.jsonObject(with: data!) as! NSDictionary
                            
                           if(json.allKeys[0] as! String == "error"){
                                let meet = json.value(forKey: "error") as! NSDictionary
                                
                                let errormessage=meet.value(forKey: "message")
                                NSLog(errormessage as! String)
                                finished(false)
                            }
                            else{
                                let meet = json.value(forKey: "value") as! NSDictionary
                                let infected = meet["meetInfected"] as! Bool
                               
                                finished(infected)
                            }
                            
                        }
                        
                    } catch {
                        print(error)
                      
                    }
                })
                
                task.resume()
                
            }
}
