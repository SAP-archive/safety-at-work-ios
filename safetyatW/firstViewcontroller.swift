//
//  firstViewcontroller.swift
//  safetyatW
//
//  Created by Perego, Massimo on 25/05/2020.
//  Copyright © 2020 SAP. All rights reserved.
//

import Foundation
import UIKit

import SAPCommon
import SAPFiori
import SAPFioriFlows
import SAPFoundation
import SAPOData


class firstViewController : UIViewController,ODataControlling{
    
     var v2: V2<OnlineODataProvider>!
   // let locationManager = CLLocationManager()
//       var beaconRegion: CLBeaconRegion!
    
    override func viewDidLoad() {
        
         
        
        
       
         DP3TTracing.delegate = self
        try? DP3TTracing.startTracing()
        DefaultAPP.shared.tracingMode = .active
        
 //START decomment only if you want to show Logsviewcontroller
//         var logsViewController = LogsViewController()
//         var tabs: [UIViewController] = [
//                                               logsViewController
//                                              ]
//            tabs.map(UINavigationController.init(rootViewController:))

 //END
//            locationManager.delegate = self
//
//               if CLLocationManager.authorizationStatus() != .authorizedAlways {
//                    locationManager.requestAlwaysAuthorization()
//               } else {
//               // already authorized
//               }
               
           
          
//               beaconRegion = CLBeaconRegion(uuid: UUID(uuidString: "A2FA7357-C8CD-4B95-98FD-9D091CE43337")!, identifier: "")
                   
//           if CLLocationManager.authorizationStatus() != .authorizedAlways {
//               locationManager.requestAlwaysAuthorization()
//           } else {
//               locationManager.startMonitoring(for: beaconRegion)
//           }

        let destinations = FileConfigurationProvider("AppParameters").provideConfiguration().configuration["Destinations"] as! NSDictionary
        
        let odataController = OnboardingSessionManager.shared.onboardingSession?.odataControllers[destinations["safetyatworkdestination"] as! String] as? firstViewController
                
              self.v2 = odataController?.v2
        
    }
    
    @IBAction func showLog(){
        let l = LogsViewController.init()
        
        
        
        self.present(l, animated: true) {
            
        }
    }
    
//    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
//        switch status {
//        case .authorizedAlways:
//            if !locationManager.monitoredRegions.contains(beaconRegion) {
//                locationManager.startMonitoring(for: beaconRegion)
//            }
//        case .authorizedWhenInUse:
//            if !locationManager.monitoredRegions.contains(beaconRegion) {
//                locationManager.startMonitoring(for: beaconRegion)
//            }
//        default:
//            print("authorisation not granted")
//        }
//    }

//    func locationManager(_ manager: CLLocationManager, didDetermineState state: CLRegionState, for region: CLRegion) {
//        print("Did determine state for region \(region)")
//        if state == .inside {
//            locationManager.startRangingBeacons(in: beaconRegion)
//
//        } else {
//
//        }
//
//
//    }
//
//    func locationManager(_ manager: CLLocationManager, didEnterRegion region: CLRegion) {
//         print("didEnter")
//        locationManager.startRangingBeacons(in: beaconRegion)
//
//
//    }

//    func locationManager(_ manager: CLLocationManager, didExitRegion region: CLRegion) {
//
//         print("didExit")
//        locationManager.stopRangingBeacons(in: beaconRegion)
//
//
//    }
    
//    func locationManager(_ manager: CLLocationManager, didRangeBeacons beacons: [CLBeacon], in region: CLBeaconRegion) {
//
//        // Find the same beacons in the table.
//
//        for beacon in beacons {
//          print(beacon)
//        }
//
//          if beacons.count > 0 {
//          let nearestBeacon = beacons.first!
//          let major = CLBeaconMajorValue(nearestBeacon.major)
//          let minor = CLBeaconMinorValue(nearestBeacon.minor)
//
//          switch nearestBeacon.proximity {
//          case .near:
//              // Display information about the relevant exhibit.
//             NSLog("near1")
//              break
//                  case .immediate:
//                             // Display information about the relevant exhibit.
//                            NSLog("immediate1")
//                             break
//              case .far:
//                                       // Display information about the relevant exhibit.
//                                      NSLog("far1")
//                                       break
//          default:
//             // Dismiss exhibit information, if it is displayed.
//            NSLog("niente")
//             break
//             }
//          }
//
//
//      }
//
    public func configureOData(sapURLSession: SAPURLSession, serviceRoot: URL) throws {
           let odataProvider = OnlineODataProvider(serviceName: "V2", serviceRoot: serviceRoot, sapURLSession: sapURLSession)
           // Disables version validation of the backend OData service
         
           odataProvider.serviceOptions.checkVersion = false
           self.v2 = V2(provider: odataProvider)
           // To update entity force to use X-HTTP-Method header
           self.v2.provider.networkOptions.tunneledMethods.append("MERGE")
           
           
       }
}


extension firstViewController: DP3TTracingDelegate {
    func DP3TTracingStateChanged(_ state: TracingState) {
    
    }

    func didAddLog(_ entry: LogEntry) {
        
              
    }

    func didAddHandshake(_ handshake: HandshakeModel) {
   
    }
}

extension Data {
    var hexEncodedString: String {
        return map { String(format: "%02hhx ", $0) }.joined()
    }

    var DP3THeadIndentifier: String? {
        let head = prefix(4)
        guard let identifier = String(data: head, encoding: .utf8) else {
            return nil
        }
        return identifier
    }
}
