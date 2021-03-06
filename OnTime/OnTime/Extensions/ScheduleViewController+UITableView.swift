//
//  ScheduleViewController+UITableView.swift
//  OnTime
//
//  Created by Igor Manakov on 15.02.2022.
//

import UIKit

extension ScheduleViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        models.count
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let headerView = TaskDaySection(frame: CGRect(x: 8, y: 28, width: tableView.bounds.size.width, height: tableView.bounds.size.height))
        headerView.weeksDayLabel.text = "Friday"
        headerView.dayInfoLabel.text = "18 February, \(self.models.count) tasks"
        return headerView
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        true
    }
    
    //    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
    //        if editingStyle == .delete {
    //            //tableView.beginUpdates()
    //            print(models)
    //            self.deleteItem(item: models[indexPath.row])
    //            tableView.deleteRows(at: [indexPath], with: .automatic)
    //            //tableView.endUpdates()
    //        }
    //    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete") { action, view, completionHandler in
            let taskToRemove = self.models[indexPath.row]
            self.context.delete(taskToRemove)
            do {
                try self.context.save()
            }
            catch {
            }
            self.getAllItems()
        }
        let editAction = UIContextualAction(style: .normal, title: "Edit") { action, view, completionHandler in
        }
        editAction.backgroundColor = .systemGreen
        
        return UISwipeActionsConfiguration(actions: [deleteAction, editAction])
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "taskCellId", for: indexPath) as! TaskCell
        cell.taskNameLabel.text = models[indexPath.row].taskName
        cell.taskDescriptionLabel.text = models[indexPath.row].taskDescription
        let timeFormatter = DateFormatter()
        timeFormatter.timeStyle = DateFormatter.Style.short
        let strDate = timeFormatter.string(from: models[indexPath.row].beginTime ?? .now)
        cell.beginTimeLabel.text = strDate
        cell.endTimeLabel.text = "11:30"
        
        let attributedString = NSMutableAttributedString(string: "")
        let imageAttachment = NSTextAttachment()
        imageAttachment.image = UIImage(systemName: "location.north.fill")!.withTintColor(.link, renderingMode: .alwaysOriginal)
        attributedString.append(NSAttributedString(attachment: imageAttachment))
        attributedString.append(NSAttributedString(" Chelyabinsk, Sovetskaya, 65"))
        cell.locationLabel.attributedText = attributedString
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailedTaskViewController = DetailedTaskViewController()
        detailedTaskViewController.task = self.models[indexPath.row].taskName!
        detailedTaskViewController.row = indexPath.row
        navigationController?.pushViewController(detailedTaskViewController, animated: true)
        //self.present(rootViewController: detailedTaskViewController, animated: true, completion: nil)
    }
}
