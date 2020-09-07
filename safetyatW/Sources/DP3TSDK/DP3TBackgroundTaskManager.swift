/*
 * Created by Ubique Innovation AG
 * https://www.ubique.ch
 * Copyright (c) 2020. All rights reserved.
 * modified by
 */

import BackgroundTasks
import Foundation
import UIKit.UIApplication

private class SyncOperation: Operation {
    override func main() {
       
//        DP3TTracing.sync { result in
//            switch result {
//            case .failure:
//                self.cancel()
//            default:
//                break
//            }
//        }
        NSLog("✅ LAUNCH BG TASK")
          //leggo i contatti degli ultimi 15 minuti e li invio
        do{
        #if BACKEND_NOTIF
            let center = UNUserNotificationCenter.current()
            let content = UNMutableNotificationContent()
            content.title = DP3TBackgroundTaskManager.taskIdentifier
            content.body = "Task got triggered at \(Date().description)"
            content.sound = UNNotificationSound.default
            let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 1, repeats: false)
            let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
            center.add(request)
        #endif
            if(ODataLayer.shared != nil){
             
                try ODataLayer.shared.sendContactBatch() //TEST
                NSLog(" ✅ END BG TASK")
           
            }
            else{
                   #if BACKEND_NOTIF
                 let center = UNUserNotificationCenter.current()
                                let content = UNMutableNotificationContent()
                                content.title = DP3TBackgroundTaskManager.taskIdentifier
                                content.body = "BG TASK is NIL \(Date().description)"
                                content.sound = UNNotificationSound.default
                                let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 1, repeats: false)
                                let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
                                center.add(request)
                   #endif
                                 NSLog("✅ BG TASK is NIL")
            }
        }
        catch{
            print(error)
             self.cancel()
        }
        
      
        
        
        
    }
}

/// Background task registration should only happen once per run
/// If the SDK gets destroyed and initialized again this would cause a crash
private var didRegisterBackgroundTask: Bool = false

@available(iOS 13.0, *)
class DP3TBackgroundTaskManager {
    static let taskIdentifier: String = "org.dpppt.synctask"

    static let syncInterval: TimeInterval = 2 * .minute

    /// A logger for debugging
    #if CALIBRATION
        public weak var logger: LoggingDelegate?
    #endif

    init() {
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(didEnterBackground),
                                               name: UIApplication.didEnterBackgroundNotification,
                                               object: nil)
    }

    deinit {
        NotificationCenter.default.removeObserver(self,
                                                  name: UIApplication.didEnterBackgroundNotification,
                                                  object: nil)
    }

    /// Register a background task
    func register() {
        guard !didRegisterBackgroundTask else { return }
        didRegisterBackgroundTask = true
        #if CALIBRATION
            logger?.log(type: .backgroundTask, "DP3TBackgroundTaskManager.register")
        #endif
        BGTaskScheduler.shared.register(forTaskWithIdentifier: DP3TBackgroundTaskManager.taskIdentifier, using: .global()) { task in
            self.handleBackgroundTask(task)
        }
        
        
//        BGTaskScheduler.shared.register(forTaskWithIdentifier: "com.sap.refreshtask", using: .global()) { task in
//            self.handleBackgroundTask(task)
//        }
        
        
    }

    private func handleBackgroundTask(_ task: BGTask) {
        #if CALIBRATION
            logger?.log(type: .backgroundTask, "DP3TBackgroundTaskManager.handleBackgroundTask")
        #endif

        scheduleBackgroundTask()

        let queue = OperationQueue()
        queue.maxConcurrentOperationCount = 1

        queue.addOperation(SyncOperation())

        task.expirationHandler = {
            queue.cancelAllOperations()
        }

    
       
        let lastOperation = queue.operations.last
        lastOperation?.completionBlock = {
            task.setTaskCompleted(success: !(lastOperation?.isCancelled ?? false))
        }
    }

    private func scheduleBackgroundTask() {
        let syncTask = BGAppRefreshTaskRequest(identifier: DP3TBackgroundTaskManager.taskIdentifier)
        syncTask.earliestBeginDate = Date(timeIntervalSinceNow: DP3TBackgroundTaskManager.syncInterval)
        #if CALIBRATION
            logger?.log(type: .backgroundTask, "DP3TBackgroundTaskManager.scheduleBackgroundTask earliestBeginDate: \(syncTask.earliestBeginDate!)")
        #endif
        
        
        
//
//        let syncTask = BGProcessingTaskRequest(identifier: DP3TBackgroundTaskManager.taskIdentifier)
//        syncTask.requiresNetworkConnectivity = true
      
        do {
//            try BGTaskScheduler.shared.submit(syncTask)         //more long task
            try BGTaskScheduler.shared.submit(syncTask) //refreshtask
        } catch {
            #if CALIBRATION
                logger?.log(type: .backgroundTask, "Unable to submit task: \(error.localizedDescription)")
            #endif
        }
    }

    @objc
    private func didEnterBackground() {
        scheduleBackgroundTask()
    }
}
