//
//  ResetPasswordViewController.swift
//  CSW_Test
//
//  Created by Mayanka Jha on 3/4/19.
//  Copyright © 2019 Mayanka Jha. All rights reserved.
//

import UIKit
import Firebase

class ResetPasswordViewController: UIViewController {
    
    @IBOutlet var emailTF: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func resetPasswordPressed(_ sender: Any) {
        
        guard let email = emailTF.text,
        email != ""
        else{
            AlertController.showAlert(self, title: "Missing Email Address", message: "Please enter email address")
            return
        }
        
        Auth.auth().sendPasswordReset(withEmail: self.emailTF.text!) { (error) in
            
            var title = ""
            var message = ""
            
            if error != nil{
                title = "Error Occured"
                message = (error?.localizedDescription)!
            }else {
                title = "Success"
                message = "Password reset email sent. Please check your mailbox!"
            }
            
            AlertController.showAlert(self, title: title, message: message)
            
        }
    }
    
    @IBAction func backtoLoginPressed(_ sender: Any) {
     
        self.performSegue(withIdentifier: "resettoLogin", sender: self)
    }
    
    
}
