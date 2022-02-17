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
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        60
    }
    
//    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//
//        let headerView = UIView()
//        headerView.backgroundColor = UIColor.lightGray
//
//        let sectionLabel = UILabel(frame: CGRect(x: 8, y: 28, width:
//                                                    tableView.bounds.size.width, height: tableView.bounds.size.height))
//        sectionLabel.font = UIFont(name: "Helvetica", size: 12)
//        sectionLabel.textColor = UIColor.black
//        sectionLabel.text = "NETWORK SETTINGS"
//        sectionLabel.sizeToFit()
//        headerView.addSubview(sectionLabel)
//
//        return headerView
//    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            //tableView.beginUpdates()
            print(models)
            self.deleteItem(item: models[indexPath.row])
            tableView.deleteRows(at: [indexPath], with: .fade)
            //tableView.endUpdates()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "taskCellId", for: indexPath) as! TaskCell
        cell.label.text = models[indexPath.row].name
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        "Do's"
    }
    
}
