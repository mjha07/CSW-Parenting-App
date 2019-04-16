//
//  DeliveredNotificationsViewController.swift
//  CSW_Test
//
//  Created by Mayanka Jha on 4/10/19.
//  Copyright © 2019 Mayanka Jha. All rights reserved.
//

import UIKit
import UserNotifications

class DeliveredNotificationsViewController: UIViewController {

    @IBOutlet weak var Notification1: UILabel!
    @IBOutlet weak var Notification2: UILabel!
    @IBOutlet weak var Notification3: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        UNUserNotificationCenter.current().getDeliveredNotifications(completionHandler: {deliveredNotifications -> () in
            for notification in deliveredNotifications{
                notification_array.append(notification.request.content.body)
            }
        })
        if notification_array.isEmpty {
            self.Notification1.text = "No notifications delivered yet"
            self.Notification2.text = "No notifications delivered yet"
            self.Notification3.text = "No notifications delivered yet"
        }
        else {
            let range = notification_array.index(notification_array.endIndex, offsetBy: -3) ..< notification_array.endIndex
            let arraySlice = notification_array[range]
            let temp = Array(arraySlice)
            self.Notification1.text = temp[0]
            self.Notification2.text = temp[1]
            self.Notification3.text = temp[2]
        }
    }
}
