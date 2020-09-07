//
//  ViewController.swift
//  SocialDistance
//
//  Created by Perego, Massimo on 11/05/2020.
//  Copyright © 2020 SAP. All rights reserved.
//

import UIKit
import SAPOData
import SAPFoundation
import SAPFiori
import SAPFioriFlows
import SAPCommon

class ViewController: UIViewController {

    @IBOutlet var nextButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
       
    }

    override func viewWillAppear(_ animated: Bool) {
        
        self.nextButton.layer.cornerRadius = 5.0
        
        
         if Networking.shared.getUseronboarded()  {
                
            self.view.isHidden = true
                DispatchQueue.main.asyncAfter(deadline: .now() ) {
                                      let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                                        let newViewController = storyBoard.instantiateViewController(withIdentifier: "mainViewcontroller") as! mainViewcontroller
                                         self.navigationController?.pushViewController(newViewController, animated: false)
                              }
               }
    }
}

