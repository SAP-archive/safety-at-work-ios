//
//  mainViewcontroller.swift
//  SocialDistance
//
//  Created by Perego, Massimo on 14/05/2020.
//  Copyright © 2020 SAP. All rights reserved.
//

import Foundation
import UIKit

import SQLite
import CoreLocation
import SAPOData

class mainViewcontroller: UIViewController,CLLocationManagerDelegate {
    @IBOutlet var tracciamentoCard: UIView!
    
    @IBOutlet var alertMessage: UILabel!
    @IBOutlet var alertImage: UIImageView!
    
    @IBOutlet var SegnalazioniTitle: UILabel!
    @IBOutlet var SegnalazioniDescription: UILabel!
    @IBOutlet var infectedImage: UIImageView!
    
    @IBOutlet var segnalazioneCard: UIView!
    
     @IBOutlet var phoneCallButton: UIButton!
    
    @IBOutlet var animatedImage: UIImageView!
    
    @IBOutlet var spin: UIActivityIndicatorView!
    @IBOutlet var InfoCard: UIView!
    
    @IBOutlet var versionLabel: UILabel!
    @IBOutlet var forceSync: UIButton!
    
    
    
    var backgroundTask: UIBackgroundTaskIdentifier = .invalid
   //for ibeacon
    var locationManager = CLLocationManager()
    let pulsator = Pulsator()
    // The background task manager. This is marked as Any? because it is only available as of iOS 13 and properties cannot be
    /// marked with @available without causing the whole class to be restricted also.
    private var backgroundTaskManager: Any?

    override func viewDidLoad() {
       super.viewDidLoad()
       // Do any additional setup after loading the view.
        
        
        DP3TTracing.delegate = self
        try? DP3TTracing.startTracing()
        DefaultAPP.shared.tracingMode = .active
       
        
        #if CALIBRATION
        let logsViewController = LogsViewController()
        let tabs: [UIViewController] = [
                                                     logsViewController
                                                    ]
        _ = tabs.map(UINavigationController.init(rootViewController:))
        #endif
      
   
                     
            
        
        tracciamentoCard.layer.borderWidth = 1.0
        tracciamentoCard.layer.borderColor = UIColor.init(named: "cardColor")?.cgColor
        tracciamentoCard.layer.cornerRadius = 7.0
        
        
        segnalazioneCard.layer.borderWidth = 1.0
        segnalazioneCard.layer.borderColor = UIColor.init(named: "cardColor")?.cgColor
        segnalazioneCard.layer.cornerRadius = 7.0
        
        phoneCallButton.layer.cornerRadius = 4.0
        
//        do{
//            let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
//            let documentsDirectory = paths[0]
//            var filePath = documentsDirectory.appendingPathComponent("DP3T_tracing_db").appendingPathExtension("sqlite")
//
//            var connection = try Connection(filePath.absoluteString, readonly: false)
//
//            var handshakesStorage = try HandshakesStorage(database: connection)
//
//            let yesterday = Calendar.current.date(byAdding: .day, value: -1, to: Date())
//           var han = try handshakesStorage.getAll( )
//
//            let contacts = self.contacts(from:han)
//        }
//        catch{
//
//        }
       
      
        //test ibeacon
//
//            self.locationManager = CLLocationManager.init();
        
//
//
        
        
        self.locationManager.delegate = self
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
        
        locationManager.requestAlwaysAuthorization()
        
        
        if #available(iOS 14.0, *) {
                   if locationManager != nil {
                    switch locationManager.accuracyAuthorization {
                       case .fullAccuracy:
                           print("Full Accuracy")
                       case .reducedAccuracy:
                           print("Reduced Accuracy")
                        
                       @unknown default:
                           print("Unknown Precise Location...")
                       }
                   }
               }
        
        //retrieve beacons
        let layer = ODataLayer.shared
       
            
//        let beacons = layer?.getBeaconDevices()

        //sent device data to ODATA DeviceType (only on firstonboarding)
         if !Networking.shared.getUseronboarded()
         {
            layer?.sendMyDevice()
        }
           
        
    
         self.infectedImage.isHidden = true
         self.phoneCallButton.isHidden = true
         self.SegnalazioniTitle.text = NSLocalizedString("Noreport", comment: "")
         self.SegnalazioniDescription.text =  NSLocalizedString("Nocontagion", comment: "")
        
//        layer?.IMInfected(finished: { infected in
//            if(infected){
//                print("infected")
//                
//                self.infectedImage.isHidden = false
//                self.SegnalazioniTitle.text = "Possibile contagio"
//                 self.SegnalazioniDescription.text = "Vi è il sospetto di un possibile contagio."
//                self.phoneCallButton.isHidden = false
//            }
//            
//        })
       
      
//       var beaconRegion : CLBeaconRegion!

//        for beacon in beacons{
//
//            do{
//                NSLog(beacon.deviceID!)
//               if(UUID.init(uuidString:beacon.deviceID!) != nil)
//               {
//                beaconRegion = CLBeaconRegion(uuid:UUID.init(uuidString:"A2FA7357-C8CD-4B95-98FD-9D091CE43337")!, identifier:"")
        let beaconUuid = ServiceConfiguration.getBeaconUUID()
        
        let constraint = CLBeaconIdentityConstraint(uuid: UUID.init(uuidString:beaconUuid)!)
        let beaconRegion2 = CLBeaconRegion(beaconIdentityConstraint: constraint, identifier: beaconUuid)
      //  beaconRegion2.notifyOnEntry = true
        beaconRegion2.notifyOnExit = true
        beaconRegion2.notifyEntryStateOnDisplay = true
      self.locationManager.startMonitoring(for: beaconRegion2)
        
        //     locationManager.startRangingBeacons(in: beaconRegion)
    //    locationManager.startRangingBeacons(satisfying: constraint)
//                }
//            }
//            catch{
//                NSLog("error creating beacon "+error.localizedDescription)
//            }
//        }
        

        animatedImage.layer.superlayer?.insertSublayer(pulsator, below: animatedImage.layer)

        pulsator.numPulse = 7
        pulsator.radius = 50
        pulsator.animationDuration = 5
        pulsator.backgroundColor = UIColor.init(red: 111/255.0, green: 195/255.0, blue: 250/255.0, alpha: 1.0) .cgColor
        pulsator.start()

        Networking.shared.cacheUserOnboarded(isonboarded: true)
    
        
        
        
        self.tracciamentoCard.layer.shadowColor = UIColor.black.cgColor
        self.tracciamentoCard.layer.shadowOpacity = Float(0.1)
        self.tracciamentoCard.layer.shadowOffset = CGSize(width: 0, height: -1)
        self.tracciamentoCard.layer.shadowRadius = 4
        self.tracciamentoCard.layer.masksToBounds = false
        self.tracciamentoCard.layer.shouldRasterize = true
        self.tracciamentoCard.layer.rasterizationScale = UIScreen.main.scale
        
        self.segnalazioneCard.layer.shadowColor = UIColor.black.cgColor
        self.segnalazioneCard.layer.shadowOpacity = Float(0.1)
        self.segnalazioneCard.layer.shadowOffset = CGSize(width: 0, height: -1)
        self.segnalazioneCard.layer.shadowRadius = 4
        self.segnalazioneCard.layer.masksToBounds = false
        self.segnalazioneCard.layer.shouldRasterize = true
        self.segnalazioneCard.layer.rasterizationScale = UIScreen.main.scale
        
        
        self.InfoCard.layer.shadowColor = UIColor.black.cgColor
        self.InfoCard.layer.shadowOpacity = Float(0.1)
        self.InfoCard.layer.shadowOffset = CGSize(width: 0, height: -1)
        self.InfoCard.layer.shadowRadius = 4
        self.InfoCard.layer.masksToBounds = false
        self.InfoCard.layer.shouldRasterize = true
        self.InfoCard.layer.rasterizationScale = UIScreen.main.scale
        
        
        //set version in label
        let dictionary = Bundle.main.infoDictionary!
        let version = dictionary["CFBundleShortVersionString"] as! String
        let build = dictionary["CFBundleVersion"] as! String
        self.versionLabel.text = "\(version) build(\(build))"
        
        
        //remove left navigation gesture
        self.navigationController?.interactivePopGestureRecognizer?.isEnabled = false
   }
    
    override func viewDidLayoutSubviews() {
           super.viewDidLayoutSubviews()
           view.layer.layoutIfNeeded()
           pulsator.position = animatedImage.layer.position
       }
    
    override func viewWillAppear(_ animated: Bool) {
        //check if iminfected?
        
               let layer = ODataLayer.shared
        
                self.infectedImage.isHidden = true
                self.phoneCallButton.isHidden = true
                  self.SegnalazioniTitle.text = NSLocalizedString("Noreport", comment: "")
                self.SegnalazioniTitle.textColor = UIColor.label
               
    
                self.SegnalazioniDescription.text =  NSLocalizedString("Nocontagion", comment: "")
                self.SegnalazioniDescription.font = UIFont.systemFont(ofSize: 17)
               layer?.IMInfected(finished: { infected in
                   if(infected){
               DispatchQueue.main.async {
                    self.infectedImage.isHidden = false
                    self.SegnalazioniTitle.text = NSLocalizedString("contagion", comment: "").uppercased()
                    self.SegnalazioniTitle.textColor = UIColor.white
                    self.SegnalazioniDescription.text = NSLocalizedString("symptoms", comment: "")
                    self.SegnalazioniDescription.textColor = UIColor.white
                    self.SegnalazioniDescription.font = UIFont.boldSystemFont(ofSize: 17)
                    self.phoneCallButton.isHidden = false
                
                    let gradientLayer = CAGradientLayer()
                    gradientLayer.colors = [UIColor.orange.cgColor, UIColor.red.cgColor]
                    gradientLayer.startPoint = CGPoint(x: 0.5, y: 1.0)
                    gradientLayer.endPoint = CGPoint(x: 0.5, y: 0.0)
                    gradientLayer.locations = [0, 1]
                    gradientLayer.frame =  self.segnalazioneCard.bounds
                    gradientLayer.cornerRadius = self.segnalazioneCard.layer.cornerRadius
                    self.segnalazioneCard.layer.insertSublayer(gradientLayer, at: 0)
                
                
                    }
                }
                   
               })
        
         UIApplication.shared.applicationIconBadgeNumber = 0
        
       
            if(!pulsator.isPulsating){
                pulsator.start()
            }
        
        
    }
    func locationManager(_ manager: CLLocationManager, didRangeBeacons beacons: [CLBeacon], in region: CLBeaconRegion) {

      // Find the same beacons in the table.
        if beacons.count > 0 {
//              for beacon in beacons {
//                print(beacon)
//              }

        
        let nearestBeacon = beacons.first!

            
        switch nearestBeacon.proximity {
            case .near:
            // Display information about the relevant exhibit.
                NSLog("😃 near!")
                sentIminroom(beacon: nearestBeacon)

                break
            case .immediate:
            // Display information about the relevant exhibit.
            //    NSLog("immediate")
                break
            case .far:
            // Display information about the relevant exhibit.
             //   NSLog("far")
                break
        default:
           // Dismiss exhibit information, if it is displayed.
         // NSLog("nothing")
           break
           }
        }


    }
    
    func locationManager(_ manager: CLLocationManager, didRange beacons: [CLBeacon], satisfying beaconConstraint: CLBeaconIdentityConstraint) {
            // Find the same beacons in the table.
                if beacons.count > 0 {
        //              for beacon in beacons {
        //                print(beacon)
        //              }

                
                let nearestBeacon = beacons.first!

                    
                switch nearestBeacon.proximity {
                    case .near:
                    // Display information about the relevant exhibit.
                      NSLog("😃 near2!")
                        sentIminroom(beacon: nearestBeacon)

                        break
                    case .immediate:
                    // Display information about the relevant exhibit.
                        NSLog("immediate")
                        NSLog("😃 immediate!")
                          sentIminroom(beacon: nearestBeacon)
                        break
                    case .far:
                    // Display information about the relevant exhibit.
                        NSLog("far")
                        break
                default:
                   // Dismiss exhibit information, if it is displayed.
            //      NSLog("niente")
                 
                   break
                   }
                }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailRangingFor beaconConstraint: CLBeaconIdentityConstraint, error: Error) {
        NSLog(" NO BEACONS FOUND")
    }
    
    func sentIminroom(beacon:CLBeacon){
        
        let uuid = beacon.uuid.uuidString;
        let major = beacon.major.stringValue;
        let minor = beacon.minor.stringValue;
        
        let uuidparam = uuid+"|"+major+"|"+minor;
        
        if(UserDefaults.standard.object(forKey: "iminroomcreationTime")==nil){
                do{
                    let crypto = try DP3TCryptoModule()
                    let EPHID = try crypto.getCurrentEphID()
                    let rssi = BigInteger.init(beacon.rssi)
                  
                    if(ODataLayer.shared != nil){
                        ODataLayer.shared.iminRoom(myId: EPHID.hexEncodedString, UUIDBeacon: uuidparam, RSSI:rssi )
                    }
                        UserDefaults.standard.set(Date(), forKey:"iminroomcreationTime")
                   }
                   catch{
                       print(error) //need to break
                   }
            
                }
        
        if let date = UserDefaults.standard.object(forKey: "iminroomcreationTime") as? Date {
                   
                   if let diff = Calendar.current.dateComponents([.second], from: date, to: Date()).second, diff > 60 {
                   
                      NSLog("😃 near inroom <60!")
                        //send event to BE
                    //Ineed to send myEPHID to BE
                           do{
                                let crypto = try DP3TCryptoModule()
                                let EPHID = try crypto.getCurrentEphID()
                                let rssi = BigInteger.init(beacon.rssi)
                                if(ODataLayer.shared != nil){
                                        ODataLayer.shared.iminRoom(myId: EPHID.hexEncodedString, UUIDBeacon: uuidparam, RSSI:rssi )
                                }
                           }
                           catch{
                               print(error) //need to break
                           }
                    
                    
                        UserDefaults.standard.set(Date(), forKey:"iminroomcreationTime")
                    }
                
                }
        
    }
    
    func locationManager(_ manager: CLLocationManager,
                didEnterRegion region: CLRegion) {
         NSLog("didEnter")
//        let content = UNMutableNotificationContent()
//                  content.title = "Attenzione"
//                  content.body = "SEI NELLA STANZA"
//                    content.sound = UNNotificationSound.default
//            //      let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 0, repeats: false)
//                  let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: nil)
//                  UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)

      // let beaconRegion = region as! CLBeaconRegion
       
       // manager.startRangingBeacons(satisfying: CLBeaconIdentityConstraint.init(uuid:beaconRegion.uuid))
        let beaconUuid = ServiceConfiguration.getBeaconUUID()
        
        let constraint = CLBeaconIdentityConstraint(uuid: UUID.init(uuidString:beaconUuid)!)
        let beaconRegion2 = CLBeaconRegion(beaconIdentityConstraint: constraint, identifier: beaconUuid)
    }
    
   func locationManager(_ manager: CLLocationManager, didExitRegion region: CLRegion) {

         NSLog("didExit")
//        let content = UNMutableNotificationContent()
//                  content.title = "Attenzione"
//                  content.body = "SEI fuori dalla STANZA"
//                    content.sound = UNNotificationSound.default
//                 // let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 0, repeats: false)
//                  let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: nil)
//                  UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
     let beaconRegion = region as! CLBeaconRegion
     manager.stopMonitoring(for: beaconRegion)
    }
    
    
    
    func locationManager(_ manager: CLLocationManager, didDetermineState state: CLRegionState, for region: CLRegion) {
     NSLog("Did determine state for region \(region)")
        let beaconRegion = region as? CLBeaconRegion
        
     switch state {
     case .inside:
        NSLog("inside")
        // Start ranging when inside a region.
        manager.startRangingBeacons(satisfying: beaconRegion!.beaconIdentityConstraint)
     // within the beacon’s range
     case .outside:
        NSLog("outside")
     // outside the beacons range
          manager.stopRangingBeacons(satisfying: beaconRegion!.beaconIdentityConstraint)
     case .unknown:
        NSLog("unknows");
         manager.stopRangingBeacons(satisfying: beaconRegion!.beaconIdentityConstraint)
        break
          
     // beacon’s range is unknown
     }
    }

//     func contacts(from handshakes: [HandshakeModel]) -> [Contact] {
//           let parameters = Default.shared.parameters.contactMatching
//           var groupedHandshakes = [EphID: [HandshakeModel]]()
//
//           // group handhakes by id
//           for handshake in handshakes {
//               if groupedHandshakes.keys.contains(handshake.ephID) {
//                   groupedHandshakes[handshake.ephID]?.append(handshake)
//               } else {
//                   groupedHandshakes[handshake.ephID] = [handshake]
//               }
//           }
//
//           let contacts: [Contact] = groupedHandshakes.compactMap { element -> Contact? in
//               let ephID = element.key
//               let handshakes = element.value
//
//               let attenutationValues: [(Date, Double)] = handshakes.compactMap { handshake -> (Date, Double)? in
//                   guard let rssi = handshake.RSSI else { return nil }
//
//                   let txPower = handshake.TXPowerlevel ?? parameters.defaultTxPowerLevel
//
//                   let attenuation = txPower - rssi
//
//                   return (handshake.timestamp, attenuation)
//               }
//
//               guard let firstValue = attenutationValues.first else { return nil }
//
//               let epochStart = DP3TCryptoModule.getEpochStart(timestamp: firstValue.0)
//
//               var windowLength = Int(Default.shared.parameters.crypto.secondsPerEpoch / parameters.windowDuration)
//                windowLength = 288
//               var numberOfMatchingWindows = 0
//
//               for windowIndex in 0 ..< windowLength {
//                   let start = epochStart.addingTimeInterval(Double(windowIndex) * parameters.windowDuration)
//                   let end = start.addingTimeInterval(parameters.windowDuration)
//
//                   let values = attenutationValues.filter { (timestamp, _) -> Bool in
//                       timestamp > start && timestamp <= end
//                   }.map { $0.1 }
//
//                   guard !values.isEmpty else { continue }
//
//                   let windowMean = values.reduce(0.0, +) / Double(values.count)
//
//                   if windowMean < parameters.contactAttenuationThreshold {
//                       numberOfMatchingWindows += 1
//                   }
//               }
//
//               if numberOfMatchingWindows != 0 {
//                   let timestamp = firstValue.0.timeIntervalSince1970
//                   let bucketTimestamp = timestamp - timestamp.truncatingRemainder(dividingBy: Default.shared.parameters.networking.batchLength)
//                   return Contact(identifier: nil,
//                                  ephID: ephID,
//                                  date: Date(timeIntervalSince1970: bucketTimestamp),
//                                  windowCount: numberOfMatchingWindows,
//                                  associatedKnownCase: nil)
//               }
//
//               return nil
//           }
//
//           return contacts
//       }
    
    @IBAction func switchValueDidChange(sender:UISwitch!) {
        print(sender.isOn)
        
        // change tracing manager
        
        
     if(sender.isOn){
         do{
             try DP3TTracing.startTracing()
             pulsator.start()
         }
         catch{
             NSLog("error on star tracing")
         }
     }
     else{
         DP3TTracing.stopTracing()
         pulsator.stop()
     }
        
        if(!sender.isOn)
        {
            //metto off
          
            alertMessage.text = NSLocalizedString("tracciamento disattivo", comment: "").uppercased()
            
            alertMessage.textColor = UIColor.init(named: "redsapfiori")
           
            
            animatedImage.image = UIImage.init(named: "nopulse")
        }
        else{
            //metto on
           
            alertMessage.text = NSLocalizedString("tracciamento attivo", comment: "").uppercased()
            alertMessage.textColor = UIColor.init(named: "blufiori")
           
            animatedImage.image = UIImage.init(named: "pulse")
        }
    }
    
//    func registerBackgroundTask() {
//      backgroundTask = UIApplication.shared.beginBackgroundTask { [weak self] in
//        self?.endBackgroundTask()
//      }
//      assert(backgroundTask != .invalid)
//    }
//
//    func endBackgroundTask() {
//      print("Background task ended.")
//      UIApplication.shared.endBackgroundTask(backgroundTask)
//      backgroundTask = .invalid
//    }
    
    
    @IBAction func showLog(){
      
        
//        let l = LogsViewController.init()
//        self.present(l, animated: true) {
//
//        }
        
        //for demo purpouse
//         Networking.shared.cacheUserOnboarded(isonboarded: false)
    }
    
   @IBAction func makeAPhoneCall()  {
        let phoneNumber = ServiceConfiguration.getHRphone()
        let url: NSURL = URL(string: "TEL://"+phoneNumber)! as NSURL
        UIApplication.shared.open(url as URL, options: [:], completionHandler: nil)
    }
    
    
    @IBAction func sendContactsFortesting(){
        self.spin.startAnimating();
          DispatchQueue.main.async {
            self.spin.startAnimating();
            self.forceSync.isEnabled = false
        }


        do{
            try ODataLayer.shared.sendContactBatch()

            self.removeSpinner()
        }
        catch{
            NSLog("ERROR SENDCONTACTBATCH "+error.localizedDescription)
             self.removeSpinner()
        }

//        DEMO
//     DispatchQueue.main.async {
//                      self.infectedImage.isHidden = false
//                      self.SegnalazioniTitle.text = NSLocalizedString("contagion", comment: "").uppercased()
//                      self.SegnalazioniTitle.textColor = UIColor.white
//                      self.SegnalazioniDescription.text = NSLocalizedString("symptoms", comment: "")
//                      self.SegnalazioniDescription.textColor = UIColor.white
//                      self.SegnalazioniDescription.font = UIFont.boldSystemFont(ofSize: 17)
//                      self.phoneCallButton.isHidden = false
//
//                      let gradientLayer = CAGradientLayer()
//                      gradientLayer.colors = [UIColor.orange.cgColor, UIColor.red.cgColor]
//                      gradientLayer.startPoint = CGPoint(x: 0.5, y: 1.0)
//                      gradientLayer.endPoint = CGPoint(x: 0.5, y: 0.0)
//                      gradientLayer.locations = [0, 1]
//                      gradientLayer.frame =  self.segnalazioneCard.bounds
//                      gradientLayer.cornerRadius = self.segnalazioneCard.layer.cornerRadius
//                      self.segnalazioneCard.layer.insertSublayer(gradientLayer, at: 0)
//
//
//                      }
    }
    
   
       
       func removeSpinner() {
     
       DispatchQueue.main.async {
            self.spin.stopAnimating();
            self.forceSync.isEnabled = true
        }
       }
}

extension mainViewcontroller: DP3TTracingDelegate {
    func DP3TTracingStateChanged(_ state: TracingState) {
    
    }

    func didAddLog(_ entry: LogEntry) {
        
              
    }

    func didAddHandshake(_ handshake: HandshakeModel) {
   
    }
}
