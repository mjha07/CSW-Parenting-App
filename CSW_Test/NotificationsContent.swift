//
//  NotificationsContent.swift
//  CSW_Test
//
//  Created by Mayanka Jha on 3/11/19.
//  Copyright © 2019 Mayanka Jha. All rights reserved.
//

import Foundation
import UIKit
import CoreData

var userProgress:[String: String] = ["default": "0,P1,W1"]

class notificationContent {
    
    var notificationContentDict: [String : [String]] = ["P1 W1": ["This is message1", "This is message2", "This is message3"], "P1 W2": ["This is message1 for week 2", "This is message2 for week2", "This is message3 for week 2"]]
    
    var noOfNotificationList: [String] = ["P1 W1", "P1 W2"]
    
    func returnNotificationContent(curr_index: Int, message: Int) -> String {
        
        let projectAndWeek = noOfNotificationList[curr_index]
        
        //Finding the message for given project and week
        let content = notificationContentDict[projectAndWeek]?[message]
        return content ?? "No content found"
        
    }
    
    func getIndex(project: String, week: String) -> Int {
        
        let finalIndex = project+" "+week
        let curr_index = noOfNotificationList.firstIndex(of: finalIndex)
        return curr_index ?? 0
        
    }
    
    func saveProgress(curr_index: Int) {
        
        //get project and week from the current index value
        print("I am saving data")
        let projectAndWeek = noOfNotificationList[curr_index]
        let result = projectAndWeek.split(separator: " ")

        /*userProgress["curr_index"] = String(curr_index)
        userProgress["Project"] = String(result[0])
        userProgress["Week"] = String(result[1])*/

        guard let progresses = try! PersistentService.context.fetch(Progress.fetchRequest()) as? [Progress] else { return }
        for progress in progresses {
            PersistentService.context.delete(progress)
        }
        do {
            PersistentService.saveContext()
        } catch {
            print("Error Occured")
        }
        let new_progress = Progress(context: PersistentService.context)
        new_progress.project = String(result[0])
        new_progress.week = String(result[1])
        new_progress.curr_index = Int32(curr_index)
        PersistentService.saveContext()
        
    }
    
    func getProgress() -> (String, String, Int) {
        
        var current_project = ""
        var current_index = ""
        var current_week = ""
        
        guard let progresses = try! PersistentService.context.fetch(Progress.fetchRequest()) as? [Progress] else { return ("no project", "week 0", 0) }
        print(progresses)
        print("trying to fetch")
        if (progresses.count == 0) {
            
            print("No project")
            current_project = "P1"
            current_week = "W1"
            current_index = "0"
            
        } else {
            for record in progresses {
                print("I am here!")
                //let project = record.value(forKey: "project")
                current_project = (record.value(forKey: "project") as! String)
                current_week = (record.value(forKey: "week") as! String)
                current_index = (record.value(forKey: "curr_index") as! String)
                //print(String(project!))
                
            }
        }
        return (current_project, current_week, Int(current_index)!)
    }
    
}
