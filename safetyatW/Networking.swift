//
//  Networking.swift
//  safetyAtworks
//
//  Created by Perego, Massimo on 20/05/2020.
//  Copyright © 2020 SAP. All rights reserved.
//

import Foundation
import UIKit
import SAPCommon
import SAPFiori
import SAPFioriFlows
import SAPFoundation
import SAPOData


class Networking{
     var v2: V2<OnlineODataProvider>!
    public static let usernameKey = "username"
    public static let onboardedKey = "onboarded"
    public static let usernameDescriptionKey = "usernameDescription"
    
     private var sapUrlSession: SAPURLSession
     private var context: OnboardingContext
     
    static let shared = Networking(sapUrlSession:SAPURLSession.init() , context: OnboardingContext.init())
    
    
     public enum UserRepositoryException: Error {
         case UserNameIsNotAvailableException
     }
     
    init(sapUrlSession: SAPURLSession,context:OnboardingContext){
         self.sapUrlSession = sapUrlSession
        self.context = context
       // UserDefaults.standard.set(false, forKey: Networking.onboardedKey)
    
     }
    
   
    
    private func cacheUserName(userName: String) {
        UserDefaults.standard.set(userName, forKey: Networking.usernameKey)
    }
    
    private func getUserName()->String {
        UserDefaults.standard.object(forKey: Networking.usernameKey) as! String
    }
    
    public func cacheUserOnboarded(isonboarded: Bool) {
           UserDefaults.standard.set(isonboarded, forKey: Networking.onboardedKey)
       }
       
    public func getUseronboarded()->Bool {
        
        if(UserDefaults.standard.object(forKey: Networking.onboardedKey) != nil){
          return UserDefaults.standard.object(forKey: Networking.onboardedKey) as! Bool
       }
    
            return false
        
        
    }
    
    
    private func cacheUserNameDescription(userName: String) {
        UserDefaults.standard.set(userName, forKey: Networking.usernameDescriptionKey)
    }
    
    private func getUsernameDescription()->String {
        UserDefaults.standard.object(forKey: Networking.usernameDescriptionKey) as! String
    }
    
    
  func  fecthusername() {
        
        //let context = OnboardingSessionManager.shared.onboardingSession?.onboardingContext()
    
    let userRoles = SAPcpmsUserRoles(sapURLSession: self.sapUrlSession
                , settingsParameters: (context.info[.sapcpmsSettingsParameters] as! SAPcpmsSettingsParameters))
               
               userRoles.load { userInfo, error in
                // use userInfo struct and handle error here
                  
                    var descriptionUser=""
                    let firstname = userInfo?.givenName
                    let lastname = userInfo?.familyName
                    
                         
                         descriptionUser += firstname ?? " "
                         descriptionUser += " "
                          descriptionUser += lastname  ?? " "
                
                   //save username safe
                  self.cacheUserName(userName: userInfo!.userName)
                 self.cacheUserNameDescription(userName: descriptionUser)
               }
        
//    let settingsParameters = SAPcpmsSettingsParameters(backendURL: ServiceConfiguration.getHostUrl(), applicationID: ServiceConfiguration.getScpAppId())
//
//      var userRoles2 =   SAPcpmsUserRoles(sapURLSession: sapUrlSession, settingsParameters: settingsParameters)
//
//    userRoles2.load { userInfo, error in
//     // use userInfo struct and handle error here
//        print(userInfo?.userName)
//        //save username safe
//
//    }
//
//
//    userRoles = SAPcpmsUserRoles(sapURLSession: context.sapURLSession
//    , settingsParameters: (context.info[.sapcpmsSettingsParameters] as! SAPcpmsSettingsParameters))
//
//                  userRoles.load { userInfo, error in
//                   // use userInfo struct and handle error here
//                      print(userInfo?.userName)
//                      //save username safe
//
//
//                  }
    }
    
//func getDevices(){
//    //chiamata Odata
//        let destinations = FileConfigurationProvider("AppParameters").provideConfiguration().configuration["Destinations"] as! NSDictionary
////               let destination = (destinations["safetyatworkdestination"] as? String)!
//
////        let settingsParameters = SAPcpmsSettingsParameters(backendURL: ServiceConfiguration.getHostUrl(), applicationID: ServiceConfiguration.getScpAppId())
//
////       let odataController = OnboardingSessionManager.shared.onboardingSession?.odataControllers[destinations["safetyatworkdestination"] as! String] as? firstviewcontroller
////
////              self.v2 = odataController?.v2
////
//
//
//    let configurationURL = URL(string: (context.info[.sapcpmsSettingsParameters] as! SAPcpmsSettingsParameters).backendURL.appendingPathComponent("safetyatworkdestination").absoluteString)!
//
//    let odataProvider = OnlineODataProvider(serviceName: "V2", serviceRoot: configurationURL, sapURLSession: context.sapURLSession)
//               // Disables version validation of the backend OData service
//               #warning("Should only be used in demo and test applications")
//               odataProvider.serviceOptions.checkVersion = false
//              self.v2 = V2(provider: odataProvider)
//               // To update entity force to use X-HTTP-Method header
//           //    self.v2.provider.networkOptions.tunneledMethods.append("MERGE")
//
//
//
//        do {
//            let query = DataQuery()
//            .filter(
//                 DeviceSetType.type_ == "BEACON")
//
//
//                   let devices = try  self.v2.fetchDeviceSet(matching: query, headers: nil, options: nil)
//
////            for i in 0 ..< devices!.count{
////                print(devices?[i].deviceID)
////                 print(devices?[i].type_)
////            }
//
//                }
//                catch{
//                    NSLog(error.localizedDescription)
//                    NSLog("erroreeee")
//                }
//
//
//    }
    
//    func sendEvent(){
//
//         let settingsParameters = SAPcpmsSettingsParameters(backendURL: ServiceConfiguration.getHostUrl(), applicationID: ServiceConfiguration.getScpAppId())
//
////        let destinations = FileConfigurationProvider("AppParameters").provideConfiguration().configuration["Destinations"] as! NSDictionary
////            let destination = (destinations["safetyatworkdestination"] as? String)!
//
//        let configurationURL = URL(string: settingsParameters.backendURL.appendingPathComponent("safetyatworkdestination").absoluteString)!
//
//           let odataProvider = OnlineODataProvider(serviceName: "V2", serviceRoot: configurationURL, sapURLSession: context.sapURLSession)
//        self.v2 = V2(provider: odataProvider)
//
//        let event = EventSetType()
//        event.createdAt = LocalDateTime.now()
//        event.sourceEID = "pipposource"
//        event.targetIED = "pippotarget"
//        event.distance = BigInteger("-58")
//
//        do {
//            try? self.v2.createEntity(event)
//
//        }
//        catch{
//               NSLog(error.localizedDescription)
//        }
//
//    }
}
