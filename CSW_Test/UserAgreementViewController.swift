//
//  UserAgreementViewController.swift
//  CSW_Test
//
//  Created by Mayanka Jha on 4/1/19.
//  Copyright © 2019 Mayanka Jha. All rights reserved.
//

import UIKit

class UserAgreementViewController: UIViewController {

    @IBAction func acceptButtonPressed(_ sender: Any) {
        //self.performSegue(withIdentifier: "userAgreementToHome", sender: self)
        self.performSegue(withIdentifier: "userAgreementToRegister", sender: self)
    }
    override func viewDidLoad() {

        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

}
