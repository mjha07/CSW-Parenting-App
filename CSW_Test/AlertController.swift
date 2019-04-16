//
//  AlertController.swift
//  CSW_Test
//
//  Created by Mayanka Jha on 3/4/19.
//  Copyright © 2019 Mayanka Jha. All rights reserved.
//

import Foundation
import UIKit

class AlertController {
    static func showAlert(_ inViewController: UIViewController, title: String, message: String) {
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        
        alert.addAction(action)
        inViewController.present(alert, animated: true, completion: nil)
    }
}
