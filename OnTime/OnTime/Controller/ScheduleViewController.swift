//
//  ScheduleViewController.swift
//  OnTime
//
//  Created by Igor Manakov on 15.02.2022.
//

import UIKit

class ScheduleViewController: UIViewController {
    
    override func loadView() {
            self.view = ScheduleView()
        }
    
    func view() -> ScheduleView {
            return self.view as! ScheduleView
        }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.barStyle = .default
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "My tasks"
        view().tableView.delegate = self
        view().tableView.dataSource = self
        view().tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        NSLayoutConstraint.activate(view().sharedConstraints)
}
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
