//
//  MenuTableViewController.swift
//  CSW_Test
//
//  Created by Mayanka Jha on 3/11/19.
//  Copyright © 2019 Mayanka Jha. All rights reserved.
//

import UIKit
import Firebase

class MenuTableViewController: UITableViewController {

    @IBAction func AboutUSPressed(_ sender: Any) {
        self.performSegue(withIdentifier: "menuToAboutUs", sender: self)
    }
    
    @IBAction func LogoutPressed(_ sender: Any) {
        do {
            try Auth.auth().signOut()
            performSegue(withIdentifier: "logOutSegue", sender: nil)
        } catch {
            print(error)
        }
    }
    @IBAction func NotificationsPressed(_sender: Any) {
        self.performSegue(withIdentifier: "menutoNotifications", sender: self)
    }
    /* @IBAction func logoutPressed(_ sender: Any) {
     do {
     try Auth.auth().signOut()
     performSegue(withIdentifier: "logOutSegue", sender: nil)
     } catch {
     print(error)
     }
     } */
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }


}
