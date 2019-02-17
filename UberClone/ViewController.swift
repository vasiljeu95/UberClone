//
//  ViewController.swift
//  UberClone
//
//  Created by Stepan Vasiljeu on 1/18/19.
//  Copyright © 2019 Stepan Vasiljeu. All rights reserved.
//

import UIKit
import FirebaseAuth

class ViewController: UIViewController {

    @IBOutlet weak var riderLabel: UILabel!
    @IBOutlet weak var driverLavel: UILabel!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var riderDriverSwitch: UISwitch!
    @IBOutlet weak var topButton: UIButton!
    @IBOutlet weak var buttonButton: UIButton!
    
    var singUpMode = true
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func topTapped(_ sender: Any) {
    }
    @IBAction func buttonTapped(_ sender: Any) {
        if singUpMode {
            topButton.setTitle("Log In", for: .normal)
            buttonButton.setTitle("Switch to Sing Up", for: .normal)
        } else {
            
        }
    }
    

}

