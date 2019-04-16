//
//  NotificationSettingViewController.swift
//  CSW_Test
//
//  Created by Mayanka Jha on 3/4/19.
//  Copyright © 2019 Mayanka Jha. All rights reserved.
//

import UIKit
import CoreData
import UserNotifications

var timer: Timer?

class NotificationSettingViewController: UIViewController {

    @IBOutlet weak var Day3TF: UITextField!
    @IBOutlet weak var Day2TF: UITextField!
    @IBOutlet weak var Day1TF: UITextField!
    @IBOutlet var ProjectTF: UITextField!
    @IBOutlet var WeekTF: UITextField!
    //var final_week = Int()
    
    @IBAction func saveNotificationPressed(_ sender: Any) {
        
        guard let project = ProjectTF.text,
            project != "",
            let week = WeekTF.text,
            week != "",
            let day1 = Day1TF.text,
            day1 != "",
            let day2 = Day2TF.text,
            day2 != "",
            let day3 = Day3TF.text,
            day3 != ""
            else{
                AlertController.showAlert(self, title: "Missing Info", message: "Please fill out all fields")
                return
        }
        
        let curr_index = notificationContent().getIndex(project: ProjectTF.text!, week: WeekTF.text!)
        //print(index)
        notificationContent().saveProgress(curr_index:curr_index)
        
        let content1 = UNMutableNotificationContent()
        content1.title = "Hey, I am a notification 1"
        content1.sound = UNNotificationSound.default
        //content.badge = 1
        content1.body = notificationContent().returnNotificationContent(curr_index: curr_index, message: 0)
        print(content1.body)
        setNotification(content: content1, identifier: "Notification1", weekday: 2, hour: 9, minute: 00)
        
        let content2 = UNMutableNotificationContent()
        content2.title = "I am notification 2"
        content2.body = notificationContent().returnNotificationContent(curr_index: curr_index, message: 1)
        print(content2.body)
        setNotification(content: content2, identifier: "Notification2", weekday: 4, hour: 9, minute: 00)
        
        let content3 = UNMutableNotificationContent()
        content3.title = "I am notification 2"
        content3.body = notificationContent().returnNotificationContent(curr_index: curr_index, message: 2)
        print(content3.body)
        setNotification(content: content3, identifier: "Notification3", weekday: 6, hour: 9, minute: 00)

        //Setting the timer to update index every Sunday at 11:00 pm
        let components = DateComponents(hour: 23, minute: 0, weekday: 1)
        let date = Calendar.current.date(from: components)!
        let timer = Timer(fireAt: date, interval: 1, target: self, selector: #selector(updateIndex), userInfo: nil, repeats: true)
        
    }

    @IBAction func dismissPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //let center = UNUserNotificationCenter.current()
        //center.requestAuthorization(options: [.alert, .sound, .badge]) { (granted, error) in}
    }
    
    @objc func updateIndex() {
        
        //check the current index saved in coreData
        var curr_index = notificationContent().getProgress().2

        if (curr_index  > 8){
            //stop all the scheduled notification
            UNUserNotificationCenter.current().removeAllPendingNotificationRequests()
        
            //stop the timer
            timer?.invalidate()
        } else {
            curr_index = curr_index + 1
            notificationContent().saveProgress(curr_index:curr_index)
        }
    }

}

func setNotification(content: UNMutableNotificationContent, identifier: String, weekday: Int, hour: Int, minute: Int){
    
    var dateComponents = DateComponents()
    dateComponents.calendar = Calendar.current
    dateComponents.weekday = weekday //Monday = 2
    dateComponents.hour  = hour
    dateComponents.minute = minute
    
    let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)
    
    //let uuidstring = UUID().uuidString
    let request = UNNotificationRequest(identifier: identifier, content: content, trigger: trigger)
    
    let center = UNUserNotificationCenter.current()
    center.add(request) { (error) in
        //check error parameter and handle any errors
    }
}



