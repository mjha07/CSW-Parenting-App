//
//  EmailVerificationViewController.swift
//  CSW_Test
//
//  Created by Mayanka Jha on 3/4/19.
//  Copyright © 2019 Mayanka Jha. All rights reserved.
//

import UIKit
import CoreData
import Firebase
import FirebaseDatabase

class EmailVerificationViewController: UIViewController {

    @IBOutlet weak var schoolNameTF: UITextField!
    @IBOutlet weak var teacherFirstNameTF: UITextField!
    @IBOutlet weak var teacherLastNameTF: UITextField!

    var ref: DatabaseReference!
    
    @IBAction func LoginPressed(_ sender: Any) {
        
        guard let school = schoolNameTF.text,
            school != "",
            let teacherFirstName = teacherFirstNameTF.text,
            teacherFirstName != "",
            let teacherLastName = teacherLastNameTF.text,
            teacherLastName != ""
            else{
                AlertController.showAlert(self, title: "Missing Info", message: "Please fill out all fields")
                return
        }
        guard let uid = Auth.auth().currentUser?.uid else { return}
        guard let email = Auth.auth().currentUser?.email else { return }
        saveFirebaseDatabase(uid: uid, email: email, school: school, teacherFirstName: teacherFirstName, teacherLastName: teacherLastName)
        self.performSegue(withIdentifier: "additionalInfoToLogin", sender: self)
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        ref = Database.database().reference()
    }

    func saveFirebaseDatabase(uid: String, email: String, school: String, teacherFirstName: String, teacherLastName: String) {
        
        self.ref?.child("UserInfo").child(uid).setValue(["email": email, "school": school, "teacherFirstName": teacherFirstName, "teacherLastName": teacherLastName])

    }

}
