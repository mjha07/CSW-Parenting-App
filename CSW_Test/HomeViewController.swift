//
//  HomeViewController.swift
//  CSW_Test
//
//  Created by Mayanka Jha on 2/17/19.
//  Copyright © 2019 Mayanka Jha. All rights reserved.
//

import Foundation
import UIKit
import Firebase
import CoreData
//import FirebaseAuthDataResultCallBack


class HomeViewController: UIViewController {
    
   
    @IBOutlet var Welcome: UILabel!
    @IBOutlet var menuButton: UIBarButtonItem!
    @IBOutlet var alertButton: UIBarButtonItem!
    
    @IBOutlet weak var ProjectText: UILabel!
    
    @IBAction func projectPressed(_ sender: Any) {
        self.performSegue(withIdentifier: "homeToProject", sender: self)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        guard let username = Auth.auth().currentUser?.displayName else { return}
        Welcome.text = "Welcome \(username)!"

        let current_progress = notificationContent().getProgress()
        let project = String(current_progress.0)
        ProjectText.text = "Your child is currently working on the class project \(project)!"
        
        sideMenus()
        //customizeNavBar()
    }
    
    /*override func viewWillAppear(_ animated: Bool) {
        
        let alwaysFirstLaunch = FirstLaunch.alwaysFirst()
        if alwaysFirstLaunch.isFirstLaunch {
            print("Alright!, let's see if this works")
            let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let newViewController = storyBoard.instantiateViewController(withIdentifier: "UserAgreementViewController") as! UserAgreementViewController
            self.present(newViewController, animated: true, completion: nil)
        }
    }*/
    
    func sideMenus() {
        
        if revealViewController() != nil {
            menuButton.target = revealViewController()
            menuButton.action = #selector(SWRevealViewController.revealToggle(_:))
            revealViewController().rearViewRevealWidth = 275
            revealViewController().rightViewRevealWidth = self.view.frame.width - 100
            
            alertButton.target  = revealViewController()
            alertButton.action = #selector(SWRevealViewController.rightRevealToggle(_:))
            
            
            view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
    }
    
    func customizeNavBar() {
        navigationController?.navigationBar.barStyle = .black
        navigationController?.navigationBar.tintColor = UIColor(displayP3Red: 255/255, green: 255/255, blue: 255/255, alpha: 1)
        navigationController?.navigationBar.barTintColor = UIColor(displayP3Red: 21/255, green: 172/255, blue: 152/255, alpha: 1)
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        //navigationController?.navigationBar.setBackgroundImage(image,forBarMetrics: .Default)
    }
}

/*func isAppAlreadyLaunchedOnce() -> Bool{
    let defaults = UserDefaults.standard
    let wasLaunchedBefore: Bool
    
    if defaults.string(forKey: "isAppAlreadyLaunchedOnce") != nil{
        print("App already launched")
        return true
    } else {
        defaults.set(true, forKey: "isAppAlreadyLaunchedOnce")
        print("App launched first time")
        //Show your tutorial.
        return false
    }
}*/

final class FirstLaunch {
    
    let wasLaunchedBefore: Bool
    var isFirstLaunch: Bool {
        return !wasLaunchedBefore
    }
    
    init(getWasLaunchedBefore: () -> Bool,
         setWasLaunchedBefore: (Bool) -> ()) {
        let wasLaunchedBefore = getWasLaunchedBefore()
        self.wasLaunchedBefore = wasLaunchedBefore
        if !wasLaunchedBefore {
            setWasLaunchedBefore(true)
        }
    }
    
    convenience init(userDefaults: UserDefaults, key: String) {
        self.init(getWasLaunchedBefore: { userDefaults.bool(forKey: key) },
                  setWasLaunchedBefore: { userDefaults.set($0, forKey: key) })
    }
    
}

extension FirstLaunch {
    
    static func alwaysFirst() -> FirstLaunch {
        return FirstLaunch(getWasLaunchedBefore: { return false }, setWasLaunchedBefore: { _ in })
    }
    
}
