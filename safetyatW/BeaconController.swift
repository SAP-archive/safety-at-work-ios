//
//  BeaconController.swift
//  SocialDistance
//
//  Created by Perego, Massimo on 19/05/2020.
//  Copyright © 2020 SAP. All rights reserved.
//

import Foundation
import UIKit
import CoreBluetooth

class BeaconController: UIViewController {

        @IBOutlet var tunrOnBeaconButton: UIButton!
    
override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
      self.tunrOnBeaconButton.layer.cornerRadius = 5.0
}

@IBAction  func pressButton(){
    UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) {  granted, error in
               
                   if error != nil {
                   // Handle the error here.
               }
                 DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                          let newViewController = storyBoard.instantiateViewController(withIdentifier: "mainViewcontroller") as! mainViewcontroller
                           self.navigationController?.pushViewController(newViewController, animated: true)
                }
        
        
}
}

}
