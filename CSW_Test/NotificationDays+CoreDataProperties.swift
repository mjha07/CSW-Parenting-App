//
//  NotificationDays+CoreDataProperties.swift
//  
//
//  Created by Mayanka Jha on 4/15/19.
//
//

import Foundation
import CoreData


extension NotificationDays {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<NotificationDays> {
        return NSFetchRequest<NotificationDays>(entityName: "NotificationDays")
    }

    @NSManaged public var day1: String?
    @NSManaged public var day2: String?
    @NSManaged public var day3: String?

}
