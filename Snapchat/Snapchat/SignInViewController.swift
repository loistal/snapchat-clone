//
//  SignInViewController.swift
//  Snapchat
//
//  Created by Lois Talagrand on 5/22/17.
//  Copyright © 2017 Lois Talagrand. All rights reserved.
//

import UIKit
import Firebase

class SignInViewController: UIViewController {

    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


    @IBAction func broTapped(_ sender: Any) {
        Auth.auth().signIn(withEmail: emailTextField.text!, password: passwordTextField.text!) { (user, error) in
            print("We tried to sign in")
            if(error != nil) {
                print("We have an error \(error)")
                Auth.auth().createUser(withEmail: self.emailTextField.text!, password: self.passwordTextField.text!) { (user, error) in
                    print("We tried to create a user")
                    if(error != nil) {
                        print("We have an error \(error)")
                    } else {
                        print("Signed up successfully")
                        self.performSegue(withIdentifier: "signInSegue", sender: nil)
                    }
                }
            } else {
                print("Signed in successfully")
                self.performSegue(withIdentifier: "signInSegue", sender: nil)
            }
        }
    }

}
