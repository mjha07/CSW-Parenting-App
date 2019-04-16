//
//  NewUserViewController.swift
//  CSW_Test
//
//  Created by Mayanka Jha on 2/17/19.
//  Copyright © 2019 Mayanka Jha. All rights reserved.
//

import Foundation
import UIKit
import Firebase

class NewUserViewController: UIViewController {
    
    
    @IBOutlet var usernameTF: UITextField!
    @IBOutlet var emailTF: UITextField!
    @IBOutlet var passwordTF: UITextField!
    @IBOutlet var confirmPasswordTF: UITextField!
    
    func isvalidPassword(password: String) -> Bool
    {
        let regularExpression = "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[$@$!%*?&])[A-Za-z\\d$@$!%*?&]{8,}"
        let passwordValidation = NSPredicate.init(format: "SELF MATCHES %@", regularExpression)
        return passwordValidation.evaluate(with: password)
    }
    
    func isValidEmail(email:String) -> Bool {
        
        let firstpart = "[A-Z0-9a-z]([A-Z0-9a-z._%+-]{0,30}[A-Z0-9a-z])?"
        let serverpart = "([A-Z0-9a-z]([A-Z0-9a-z-]{0,30}[A-Z0-9a-z])?\\.){1,5}"
        let emailRegEx = firstpart + "@" + serverpart + "[A-Za-z]{2,8}"
        //let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailValidation = NSPredicate.init(format:"SELF MATCHES %@", emailRegEx)
        return emailValidation.evaluate(with: email)
    }
    
    @IBAction func newUserSignUpPressed(_ sender: Any) {
        guard let username = usernameTF.text,
            username != "",
            let email = emailTF.text,
            email != "",
            let password = passwordTF.text,
            password != "",
            let confirmPass = confirmPasswordTF.text,
            confirmPass != ""
            else{
                AlertController.showAlert(self, title: "Missing Info", message: "Please fill out all fields")
                return
        }
        //print(Auth.auth().)
        if confirmPass != password {
            AlertController.showAlert(self, title: "Passwords don't match", message: "Please re enter password")
            return
        }
        //let validPass = isvalidPassword(password: password)
        guard let validPass:Bool = isvalidPassword(password: password),
            validPass == true
            else{
                
                AlertController.showAlert(self, title: "Inavlid Password", message: "Password must contain atleast 8 characters, 1 uppercase letter and 1 number")
                return
        }
        guard let validEmail:Bool = isValidEmail(email: email),
            validEmail == true
            else{
                
                AlertController.showAlert(self, title: "Inavlid Email Address", message: "Email address must be valid")
                return
        }
        Auth.auth().createUser(withEmail: email, password: password, completion: { (user, error) in
            
            guard error == nil else {
                print("There is an error")
                AlertController.showAlert(self, title: "Error Occured", message: error!.localizedDescription)
                return
            }
            //self.performSegue(withIdentifier: "newUserBackToLoginSegue", sender: self)
            guard let user = user else {
                return
            }
            print(user.user.email ?? "Missing Email")
            print(user.user.uid)
            
            let changeRequest = user.user.createProfileChangeRequest()
            changeRequest.displayName = username
            changeRequest.commitChanges(completion: { (error) in
                guard error == nil else {
                    
                    AlertController.showAlert(self, title: "Error Occured", message: error!.localizedDescription)
                    return
                    
                }
                self.performSegue(withIdentifier: "newUsertoVerificationSegue", sender: self)
            })
        })
    }
    
    @IBAction func backtoLoginPressed(_ sender: Any)
    {
        //print("Go back to Login Page")
        self.performSegue(withIdentifier: "newUserToLoginSegue", sender: self)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
}
