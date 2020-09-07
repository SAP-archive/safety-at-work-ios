//
// testdev
//
// Created by SAP Cloud Platform SDK for iOS Assistant application on 19/05/20
//

import SAPCommon
import SAPFioriFlows
import SAPFoundation

open class ODataOnboardingStep: OnboardingStep {
    var controllers: [String: ODataControlling] = [:]

    public func onboard(context: OnboardingContext, completionHandler: @escaping (OnboardingResult) -> Void) {
        self.configureOData(using: context, completionHandler: completionHandler)
        
    }

    public func restore(context: OnboardingContext, completionHandler: @escaping (OnboardingResult) -> Void) {
        self.configureOData(using: context, completionHandler: completionHandler)
      
    }

    public func reset(context _: OnboardingContext, completionHandler: @escaping () -> Void) {
        completionHandler()
    }

    // Read more about consumption of OData services in mobile applications: https://help.sap.com/viewer/fc1a59c210d848babfb3f758a6f55cb1/Latest/en-US/1c7d937d0c8a43f4aca7175e9051d108.html
    private func configureOData(using context: OnboardingContext, completionHandler: @escaping (OnboardingResult) -> Void) {
        var odataControllers = [String: ODataControlling]()
        let destinations = FileConfigurationProvider("AppParameters").provideConfiguration().configuration["Destinations"] as! NSDictionary

        odataControllers[destinations["safetyatworkdestination"] as! String] = firstViewController()

//        let userRoles = SAPcpmsUserRoles(sapURLSession: context.sapURLSession, settingsParameters: (context.info[.sapcpmsSettingsParameters] as! SAPcpmsSettingsParameters))
//
//        userRoles.load { userInfo, error in
//         // use userInfo struct and handle error here
//            print(userInfo?.userName)
//            //save username safe
//
//        }
        
        
        let n = Networking.init(sapUrlSession: context.sapURLSession, context: context)
        n.fecthusername()
        ODataLayer.initSharedInstance(sapUrlSession: context.sapURLSession)
        
        for (destinationId, odataController) in odataControllers {
            // Adjust this path so it can be called after authentication and returns an HTTP 200 code. This is used to validate the authentication was successful.
           
            let configurationURL = URL(string: (context.info[.sapcpmsSettingsParameters] as! SAPcpmsSettingsParameters).backendURL.appendingPathComponent(destinationId).absoluteString)!

            do {
                try odataController.configureOData(sapURLSession: context.sapURLSession, serviceRoot: configurationURL)

                self.controllers[destinationId] = odataController
                completionHandler(.success(context))
            } catch {
                completionHandler(.failed(error))
            }
        }
    }
}
