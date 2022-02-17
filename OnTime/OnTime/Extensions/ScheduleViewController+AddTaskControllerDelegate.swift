//
//  ScheduleViewController+AddTaskControllerDelegate.swift
//  OnTime
//
//  Created by Igor Manakov on 16.02.2022.
//

extension ScheduleViewController: AddTaskDelegate {
    func addTask(task: String) {
        self.dismiss(animated: true) {
            self.createItem(name: task)
            print(task)
            self.tableView.reloadData()
        }
    }
}
