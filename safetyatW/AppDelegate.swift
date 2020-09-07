//
// safetyatW
//
// Created by SAP Cloud Platform SDK for iOS Assistant application on 25/05/20
//

import Foundation
import SAPCommon
import SAPFiori
import SAPFioriFlows
import SAPFoundation
import SAPOData
import UserNotifications




func initializeSDK() {
    /// Can be initialized either by:
    /// - using the discovery:
    let appVersion: String
    if let version = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String,
        let build = Bundle.main.infoDictionary?["CFBundleVersion"] as? String {
        appVersion = "\(version)(\(build))"
    } else {
        appVersion = "N/A"
    }
    try! DP3TTracing.initialize(with: .discovery("org.dpppt.demo", enviroment: .dev),
                                mode: .calibration(identifierPrefix: DefaultAPP.shared.identifierPrefix ?? "", appVersion: appVersion))
    /// - passing the url:
    // try! DP3TTracing.initialize(with: .manual(.init(appId: "org.dpppt.demo", bucketBaseUrl: URL(string: "https://demo.dpppt.org/")!, reportBaseUrl: URL(string: "https://demo.dpppt.org/")!, jwtPublicKey: nil)),
    //                            mode: .calibration(identifierPrefix: Default.shared.identifierPrefix ?? ""))
}


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, UNUserNotificationCenterDelegate  {
    var window: UIWindow?
    
//     var motionManager : CMMotionManager!
    /// Logger instance initialization
    private let logger = Logger.shared(named: "AppDelegateLogger")
    private var flowProvider = OnboardingFlowProvider()

    /// Delegate implementation of the application in a custom class
    var onboardingErrorHandler: OnboardingErrorHandler?

    /// Application controller instance for the application
    var sessionManager: OnboardingSessionManager<ApplicationOnboardingSession>!

    func application(_: UIApplication, didFinishLaunchingWithOptions _: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        
         initializeSDK()
        
        
        
        self.initializeLogUploader()
        self.initializeUsageCollection()
        // Set a FUIInfoViewController as the rootViewController, since there it is none set in the Main.storyboard
        // Also, hide potentially sensitive data of the real application screen during onboarding
        self.window = UIWindow(frame: UIScreen.main.bounds)
        
        
        
        self.window!.rootViewController = FUIInfoViewController.createInstanceFromStoryboard()

        
        
        // Read more about Logging: https://help.sap.com/viewer/fc1a59c210d848babfb3f758a6f55cb1/Latest/en-US/879aaebaa8e6401dac100ea9bb8b817d.html
        Logger.root.logLevel = .debug

        self.initializeOnboarding()

        // Customize the UI to align SAP style
        // Read more: https://help.sap.com/doc/978e4f6c968c4cc5a30f9d324aa4b1d7/Latest/en-US/Documents/Frameworks/SAPFiori/Extensions/UINavigationBar.html
        UINavigationBar.applyFioriStyle()

        
        switch DefaultAPP.shared.tracingMode {
        case .none:
            break
        case .active:
            try? DP3TTracing.startTracing()
        case .activeAdvertising:
            try? DP3TTracing.startTracing()
        case .activeReceiving:
            try? DP3TTracing.startTracing()
        }
        
      // motionManager = CMMotionManager()
        
        
        // Fetch data once an hour.
//          UIApplication.shared.setMinimumBackgroundFetchInterval(3600)

        
        
        
        return true
    }

    func applicationDidEnterBackground(_: UIApplication) {
        // Hides the application UI by presenting a splash screen, @see: ApplicationUIManager.hideApplicationScreen
        OnboardingSessionManager.shared.lock { _ in }
        
        //timer to turnon turno of at specific working time hour
        
        Timer.scheduledTimer(withTimeInterval: 60, repeats: true) { (t) in

            let timestamp = DateFormatter.localizedString(from: NSDate() as Date, dateStyle: .medium, timeStyle: .short)
            NSLog("BGTASK time: "+timestamp)
           
        }
        
      //  startAccelerometerUpdates()
        
    }
    
    
//    func startAccelerometerUpdates() {
//          let splitAngle:Double = 0.75
//          let updateTimer:TimeInterval = 0.35
//
//          motionManager?.accelerometerUpdateInterval = updateTimer
//
//          motionManager?.startAccelerometerUpdates(to: (OperationQueue.current)!, withHandler: { [weak self]
//              (acceleroMeterData, error) -> Void in
//              if error == nil {
//                  let acceleration = (acceleroMeterData?.acceleration)!
//
//                NSLog("BGTASK motiony %f", acceleration.y)
//                 NSLog("BGTASK motionz %f", acceleration.y)
////                  self?.appendYSample(sample: acceleration.y)
////                  self?.appendZSample(sample: acceleration.z)
////
////                  guard let accelerationYSum = self?.sampleAngleY.reduce(0.0, +), let accelerationZSum = self?.sampleAngleZ.reduce(0.0, +),
////                      let countY = self?.sampleAngleY.count, let countZ = self?.sampleAngleZ.count else {
////                      return
////                  }
////                  let accelerationYAvg = accelerationYSum / Double(countY)
////                  let accelerationZAvg = accelerationZSum / Double(countZ)
////
////                  if accelerationYAvg >= splitAngle || accelerationZAvg >= splitAngle {
////                      self?.showBlackscreen()
////
////                  } else {
////                      self?.dismissBlackscreen()
////                  }
//              } else {
//                  print("error : \(error!)")
//              }
//          })
//      }

//      func stopAccelerometerUpdates() {
//          motionManager?.stopAccelerometerUpdates()
//      }

    func applicationWillEnterForeground(_: UIApplication) {
        // Triggers to show the passcode screen
        OnboardingSessionManager.shared.unlock { error in
            guard let error = error else {
                return
            }
            UIApplication.shared.applicationIconBadgeNumber = 0
            self.onboardingErrorHandler?.handleUnlockingError(error)
        }
        
//        stopAccelerometerUpdates()
        
        
        //call sync backend
//      (" to analyze if dogwatch kills app on foreground")
        do{
            
            if(ODataLayer.shared != nil && Networking.shared.getUseronboarded()){
              NSLog(" ✅ call  sync on reopen")
                try ODataLayer.shared.sendContactBatch() //TEST
                NSLog(" ✅ END call  sync on reopen")
           
            }
            else{
                 NSLog("✅ odatalayer is NIL")
            }
        }
        catch{
            print(error)
            
        }
        
    }
    
    

//    func application(_: UIApplication, supportedInterfaceOrientationsFor _: UIWindow?) -> UIInterfaceOrientationMask {
//       
//        switch OnboardingFlowController.presentationState {
//        case .onboarding, .restoring:
//            return .portrait
//        default:
//            return .portrait
//        }
//    }
    
    func applicationWillTerminate(_ application: UIApplication) {
       NSLog("TERMINATED")
        
    
       }
    func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable : Any], fetchCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void) {

        if let aps = userInfo["aps"] as? NSDictionary {
            if let ca = aps["content-available"] as? Int64  {
                if(ca == 1)
                {
                     NSLog("silent remote notification")
                   //                    DP3TTracing.stopTracing()
                    //                   DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
                    //                       try? DP3TTracing.startTracing()
                    //                    }
                                        
                                        do{
                                          if(ODataLayer.shared != nil){
                                           NSLog("✅ launch batch with remote notification")
                                              try ODataLayer.shared.sendContactBatch() //TEST
                                              NSLog("✅ end batch with remote notification")
                                            
                                           }
                                                 
                                        }
                                                          
                                      catch{
                                          print(error)
                                       
                                      }
                    
                    
                }
                
            }
        }
             NSLog("recevied remote notification")
        
//        completionHandler(UIBackgroundFetchResult.newData)
            
    }
      
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
           NSLog("App opened via user selecting notification:")
       }

    func application(_ application: UIApplication, handleActionWithIdentifier identifier: String?, forRemoteNotification userInfo: [AnyHashable : Any], completionHandler: @escaping () -> Void) {
       
    }
    
    func application(_: UIApplication, performFetchWithCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void) {
        
//         do{
//                   if(ODataLayer.shared != nil){
//                    NSLog("✅ preparing performfetch batch")
//                  //     try ODataLayer.shared.sendContactBatch() //TEST
//                       NSLog("END BG fetch TASK")
//                     
//                    }
//            completionHandler(UIBackgroundFetchResult.newData)
//            }
//                   
//               catch{
//                   print(error)
//                    completionHandler(UIBackgroundFetchResult.failed)
//               }
    }
     
}

// Convenience accessor for the AppDelegate
extension AppDelegate {
    static var shared: AppDelegate {
        return (UIApplication.shared.delegate as! AppDelegate)
    }
}

// MARK: – Onboarding related functionality

// MARK: OnboardingSessionManager helper extension

extension OnboardingSessionManager {
    static var shared: OnboardingSessionManager<ApplicationOnboardingSession>! {
        return AppDelegate.shared.sessionManager
    }
}

extension AppDelegate {
    /// Setup an onboarding session instance
    func initializeOnboarding() {
        let presentationDelegate = ApplicationUIManager(window: self.window!)
        self.onboardingErrorHandler = OnboardingErrorHandler()
        self.sessionManager = OnboardingSessionManager(presentationDelegate: presentationDelegate, flowProvider: self.flowProvider, delegate: self.onboardingErrorHandler)
        
        presentationDelegate.showSplashScreenForOnboarding { _ in }

        self.onboardUser()
    }

    /// Start demo mode
    func startDemoMode() {
        let alertController = UIAlertController(
            title: LocalizedStrings.AppDelegate.startDemoModeTitle,
            message: LocalizedStrings.AppDelegate.startDemoModeMessage,
            preferredStyle: .alert
        )
        alertController.addAction(
            UIAlertAction(title: LocalizedStrings.AppDelegate.startDemoModeRestartTitle, style: .default) { _ in
                self.onboardUser()
        })

        DispatchQueue.main.async {
            guard let topViewController = ModalUIViewControllerPresenter.topPresentedViewController() else {
                fatalError("Invalid UI state")
            }
            topViewController.present(alertController, animated: true)
        }
    }

    /// Application specific code after successful onboard
    func afterOnboard() {
        guard let _ = self.sessionManager.onboardingSession else {
            fatalError("Invalid state")
        }

        self.initializeRemoteNotification()
        self.uploadLogs()
        self.uploadUsageReport()
    }

    /// Start onboarding a user
    func onboardUser() {
        self.sessionManager.open { error in
            if let error = error {
                self.onboardingErrorHandler?.handleOnboardingError(error)
                return
            }
            self.afterOnboard()
        }
    }
  
   
}

// MARK: - Remote notification handling

extension AppDelegate {
    // Read more about Remote Notifications on mobile services: https://help.sap.com/doc/978e4f6c968c4cc5a30f9d324aa4b1d7/Latest/en-US/Documents/Frameworks/SAPFoundation/Remote%20Notifications.html

    func initializeRemoteNotification() {
        // Registering for remote notifications
        UIApplication.shared.registerForRemoteNotifications()
        
        let center = UNUserNotificationCenter.current()
        center.requestAuthorization(options: [.alert, .badge, .sound]) { _, _ in
            // Enable or disable features based on authorization.
        }
        center.delegate = self
    }
    

    func uploadDeviceTokenForRemoteNotification(_ deviceToken: Data) {
        guard let session = sessionManager.onboardingSession else {
            // Onboarding not yet performed
            return
        }
        let parameters = SAPcpmsRemoteNotificationParameters(deviceType: "iOS")
        session.registerDeviceToken(deviceToken: deviceToken, withParameters: parameters) { error in
            if let error = error {
                self.logger.error("Register DeviceToken failed", error: error)
                return
            }
            self.logger.info("Register DeviceToken succeeded")
        }
    }

    // MARK: AppDelegate method implementations for remote notification handling

    func application(_: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
       
        self.uploadDeviceTokenForRemoteNotification(deviceToken)
    }

    func application(_: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: Error) {
         print("error Token: \(error)")//DEBUG
        self.logger.error("Failed to register for Remote Notification", error: error)
    }

   
    
//    // Called to let your app know which action was selected by the user for a given notification.
//    func userNotificationCenter(_: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
//     NSLog("App opened via user selecting notification: \(response.notification.request.content.body)")
//        // Here is where you want to take action to handle the notification, maybe navigate the user to a given screen.
//        completionHandler()
//    }

    // Called when a notification is delivered to a foreground app.
    func userNotificationCenter(_: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        self.logger.info("Remote Notification arrived while app was in foreground: \(notification.request.content.body)")
        // Currently we are presenting the notification alert as the application were in the background.
        // If you have handled the notification and do not want to display an alert, call the completionHandler with empty options: completionHandler([])
        completionHandler([.alert, .sound])
    }
    
  
 
    
    
    
    
  
  

}

// MARK: - Log upload initialization and handling

// Read more about Log upload: https://help.sap.com/doc/978e4f6c968c4cc5a30f9d324aa4b1d7/Latest/en-US/Documents/Frameworks/SAPFoundation/Log%20Upload.html
extension AppDelegate {
    private func initializeLogUploader() {
        do {
            // Attaches a LogUploadFileHandler instance to the root of the logging system
            try SAPcpmsLogUploader.attachToRootLogger()
        } catch {
            self.logger.error("Failed to attach to root logger.", error: error)
        }
    }

    private func uploadLogs() {
        guard let session = self.sessionManager.onboardingSession else {
            // Onboarding not yet performed
            return
        }
        // Upload logs after onboarding
        SAPcpmsLogUploader.uploadLogs(session) { error in
            if let error = error {
                self.logger.error("Error happened during log upload.", error: error)
                return
            }
            self.logger.info("Logs have been uploaded successfully.")
        }
    }
}

// MARK: - Usage collection initialization and upload

extension AppDelegate {
    private func initializeUsageCollection() {
        do {
            // Required call to configure OSlifecycle notification, specify data collection items during event triggers, and configure usage store behavior.
            try UsageBroker.shared.start()
        } catch {
            self.logger.error("Failed to initialize usage collection.", error: error)
        }
    }

    private func uploadUsageReport() {
        guard self.sessionManager.onboardingSession != nil else {
            // Onboarding not yet performed
            return
        }
        // Upload usage report after onboarding
        UsageBroker.shared.upload()
    }
}

extension UINavigationController {
    open override var preferredStatusBarStyle: UIStatusBarStyle {
        if let statusBarStyle = FUIStatusBarStyleHelper.statusBarStyle {
            return statusBarStyle
        }
        var statusBarStyle: UIStatusBarStyle = .default
        if #available(iOS 13.0, *) {
            statusBarStyle = navigationBar.barStyle == .default ? .darkContent : .darkContent
        } else {
            statusBarStyle = navigationBar.barStyle == .default ? .default : .darkContent
        }
        return statusBarStyle
    }
}
