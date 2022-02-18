//
//  TaskListItem+CoreDataProperties.swift
//  OnTime
//
//  Created by Igor Manakov on 18.02.2022.
//
//

import Foundation
import CoreData
import CoreLocation


extension TaskListItem {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<TaskListItem> {
        return NSFetchRequest<TaskListItem>(entityName: "TaskListItem")
    }

    @NSManaged public var taskName: String?
    @NSManaged public var taskDescription: String?
    @NSManaged public var beginTime: Date?
    @NSManaged public var endTime: Date?
    @NSManaged public var priority: Int16
    @NSManaged public var location: CLLocation?

}

extension TaskListItem : Identifiable {

}
