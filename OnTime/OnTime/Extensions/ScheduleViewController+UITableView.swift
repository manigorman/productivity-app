//
//  ScheduleViewController+UITableView.swift
//  OnTime
//
//  Created by Igor Manakov on 15.02.2022.
//

import UIKit

extension ScheduleViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        4
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
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "taskCellId", for: indexPath) as! TaskCell
        cell.textLabel?.text = "fsf"
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        "Do's"
    }
    
}
