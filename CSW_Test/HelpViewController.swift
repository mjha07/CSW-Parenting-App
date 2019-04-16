//
//  HelpViewController.swift
//  CSW_Test
//
//  Created by Mayanka Jha on 4/13/19.
//  Copyright © 2019 Mayanka Jha. All rights reserved.
//

import UIKit
import MessageUI

class HelpViewController: UIViewController, MFMailComposeViewControllerDelegate {

    @IBOutlet weak var NameTF: UITextField!
    @IBOutlet weak var EmailTF: UITextField!
    @IBOutlet weak var SubjectTF: UITextField!
    @IBOutlet weak var BodyTF: UITextField!
    
    @IBAction func backButtonPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func sendEmailButtonPressed(_ sender: Any) {
        
        guard let name = NameTF.text,
            name != "",
            let email = EmailTF.text,
            email != "",
            let subject = SubjectTF.text,
            subject != "",
            let body = BodyTF.text,
            body != ""
            else {
                AlertController.showAlert(self, title: "Mising Info", message: "Please enter all the fields")
                return
        }
        
        let mailComposeViewController = configureMailController()
        if MFMailComposeViewController.canSendMail() {
            self.present(mailComposeViewController, animated: true, completion: nil)
        } else {
            showMailError()
        }
        
    }
    func configureMailController() -> MFMailComposeViewController {
        let mailcomposerVC = MFMailComposeViewController()
        mailcomposerVC.mailComposeDelegate = self
        
        mailcomposerVC.setToRecipients([EmailTF.text!])
        mailcomposerVC.setSubject(SubjectTF.text!)
        mailcomposerVC.setMessageBody(BodyTF.text!, isHTML: false)

        return mailcomposerVC
    }
    
    func showMailError() {
        let sendMailErrorAlert = UIAlertController(title: "Could not send email", message: "Your device could not send email to us.", preferredStyle: .alert)
        let dismiss = UIAlertAction(title: "Ok", style: .default, handler: nil)
        sendMailErrorAlert.addAction(dismiss)
        self.present(sendMailErrorAlert, animated: true, completion: nil)
        
    }
    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

}
