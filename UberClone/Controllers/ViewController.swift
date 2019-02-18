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
        if emailTextField.text == "" || passwordTextField.text == "" {
            displayAlert(title: "Missing Information", message: "You must provide both a email and password")
        } else {
            if let email = emailTextField.text {
                if let password = passwordTextField.text {
                    if singUpMode {
                        // SIGN UP
                        Auth.auth().createUser(withEmail: email, password: password, completion: { (user, error) in
                            if error != nil {
                                self.displayAlert(title: "Error", message: error!.localizedDescription)
                            } else {
                                print("Sign Up Success")
                            }
                        })
                    } else {
                        // LOG IN
                        Auth.auth().signIn(withEmail: email, password: password, completion: { (user, error) in
                            if error != nil {
                                self.displayAlert(title: "Error", message: error!.localizedDescription)
                            } else {
                                print("Sign Up Success")
                            }
                        })
                    }
                }
            }
        }
    }
    
    func displayAlert(title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alertController, animated: true, completion: nil)
    }
    
    @IBAction func buttonTapped(_ sender: Any) {
        if singUpMode {
            topButton.setTitle("Log In", for: .normal)
            buttonButton.setTitle("Switch to Sing Up", for: .normal)
            riderLabel.isHidden = true
            driverLavel.isHidden = true
            riderDriverSwitch.isHidden = true
            singUpMode = false
        } else {
            topButton.setTitle("Sign Up", for: .normal)
            buttonButton.setTitle("Switch to Log In", for: .normal)
            riderLabel.isHidden = false
            driverLavel.isHidden = false
            riderDriverSwitch.isHidden = false
            singUpMode = true
        }
    }
    

}

