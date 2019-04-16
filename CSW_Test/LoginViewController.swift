//
//  ViewController.swift
//  CSW_Test
//
//  Created by Mayanka Jha on 2/17/19.
//  Copyright © 2019 Mayanka Jha. All rights reserved.
//

import UIKit
import Firebase

class LoginViewController: UIViewController {
    @IBOutlet var emailTF: UITextField!
    @IBOutlet var passwordTF: UITextField!
    
    @IBAction func loginButtonPressed(_ sender: Any)
    {
        //print("Button Pressed!")
        guard let email = emailTF.text,
        email != "",
        let password = passwordTF.text,
        password != ""
            else {
                AlertController.showAlert(self, title: "Mising Info", message: "Please enter all the fields")
                return
        }
        Auth.auth().signIn(withEmail: email, password: password) { (user, error) in
            guard error == nil else{
                AlertController.showAlert(self, title: "Error Occured", message: error!.localizedDescription)
                return
            }
            guard let user = user else{
                return
            }
            print(user.user.email ?? "Missing email")
            print(user.user.displayName ?? "Missing displayName")
            print(user.user.uid)
            //self.performSegue(withIdentifier: "goHomeSegue", sender: self)
            let sb = UIStoryboard(name: "Main", bundle: nil)
            let controller = sb.instantiateViewController(withIdentifier: "FrontNavController")
            self.revealViewController().setFront(controller, animated: true)
            //revealViewController().setFront(controller, animated: true)
            
        }
    }
    
    /*@IBAction func newUserRegisterPressed(_ sender: Any) {
        print("New User Registration Pressed")
        //self.performSegue(withIdentifier: "newUserSegue", sender: self)
        self.performSegue(withIdentifier: "mainPageToUserAgreement", sender: self)
    }*/
    
    @IBAction func forgotPasswordPressed(_ sender: Any) {
        self.performSegue(withIdentifier: "logintoReset", sender: self)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


}

