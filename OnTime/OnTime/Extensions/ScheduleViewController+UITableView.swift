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
        4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = "fsf"
        return cell
        
    }
    
    
}
