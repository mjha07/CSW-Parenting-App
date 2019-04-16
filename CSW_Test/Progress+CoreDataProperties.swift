//
//  Progress+CoreDataProperties.swift
//  
//
//  Created by Mayanka Jha on 4/15/19.
//
//

import Foundation
import CoreData


extension Progress {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Progress> {
        return NSFetchRequest<Progress>(entityName: "Progress")
    }

    @NSManaged public var curr_index: Int32
    @NSManaged public var project: String?
    @NSManaged public var week: String?

}
