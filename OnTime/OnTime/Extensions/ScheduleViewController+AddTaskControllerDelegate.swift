//
//  ScheduleViewController+AddTaskControllerDelegate.swift
//  OnTime
//
//  Created by Igor Manakov on 16.02.2022.
//

import Foundation

extension ScheduleViewController: AddTaskDelegate {
    func addTask(taskName: String, taskDescription: String, beginTime: Date, endTime: String, location: String) {
        self.dismiss(animated: true) {
            self.createItem(taskName: taskName, taskDescription: taskDescription, beginTime: beginTime, endTime: endTime, location: location)
            self.tableView.reloadData()
        }
    }
}

extension ScheduleViewController: DetailedTaskDelegate {
    func editTask(name: String, row: Int) {
//        self.dismiss(animated: true) {
            print(name)
//            self.models[row].taskDescription = item.taskDescription
//            self.updateItem(item: item)
            self.tableView.reloadData()
//        }
    }
}
