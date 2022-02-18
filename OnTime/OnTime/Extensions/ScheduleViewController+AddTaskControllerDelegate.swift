//
//  ScheduleViewController+AddTaskControllerDelegate.swift
//  OnTime
//
//  Created by Igor Manakov on 16.02.2022.
//

extension ScheduleViewController: AddTaskDelegate {
    func addTask(taskName: String, taskDescription: String, beginTime: String, endTime: String, location: String) {
        self.dismiss(animated: true) {
            self.createItem(taskName: taskName, taskDescription: taskDescription, beginTime: beginTime, endTime: endTime, location: location)
            self.tableView.reloadData()
        }
    }
}
