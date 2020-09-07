//
//  BluetoohOnboardingViewcontroller.swift
//  SocialDistance
//
//  Created by Perego, Massimo on 12/05/2020.
//  Copyright © 2020 SAP. All rights reserved.
//

import Foundation
import UIKit
import CoreBluetooth

class BluetoohOnboardingViewcontroller: UIViewController,CBCentralManagerDelegate {
    @IBOutlet var tunrOnBTButton: UIButton!
    
    func centralManagerDidUpdateState(_ central: CBCentralManager) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
         let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
         let newViewController = storyBoard.instantiateViewController(withIdentifier: "pushOnboardingcontroller") as! pushOnboardingcontroller
            self.navigationController?.pushViewController(newViewController, animated: true)
        }
    }
    
 private var central: CBCentralManager?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.tunrOnBTButton.layer.cornerRadius = 5.0
    }


@IBAction  func pressButton()  {
        self.central = CBCentralManager(delegate: self, queue: .main)
    
    }
    
}


