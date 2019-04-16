//
//  CSWProjectsViewController.swift
//  CSW_Test
//
//  Created by Mayanka Jha on 2/18/19.
//  Copyright © 2019 Mayanka Jha. All rights reserved.
//

import Foundation
import UIKit

class CSWProjectsViewController: UIViewController {

    
    @IBAction func dismissPresssed(_ sender: Any) {
        let home = HomeViewController()
        self.dismiss(animated: true, completion: nil)
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        //customizeNavBar()
    }

    
}

