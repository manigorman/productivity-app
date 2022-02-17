//
//  TaskListItem+CoreDataProperties.swift
//  OnTime
//
//  Created by Igor Manakov on 17.02.2022.
//
//

import Foundation
import CoreData


extension TaskListItem {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<TaskListItem> {
        return NSFetchRequest<TaskListItem>(entityName: "TaskListItem")
    }

    @NSManaged public var name: String?
    @NSManaged public var createdAt: Date?

}

extension TaskListItem : Identifiable {

}
