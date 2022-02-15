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
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(showAddTaskController))
        //navigationItem.rightBarButtonItem?.tintColor = .black
        
        view().tableView.delegate = self
        view().tableView.dataSource = self
        view().tableView.register(TaskCell.self, forCellReuseIdentifier: "taskCellId")
        NSLayoutConstraint.activate(view().sharedConstraints)
}
    
    
    @objc func showAddTaskController() {
        let vc = AddTaskController()
        self.navigationController?.pushViewController(vc, animated: true)
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

class TaskCell: UITableViewCell {
    
    let cellView: UIView = {
        let view = UIView()
        //view.backgroundColor = .link
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle,reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }
    
    func setup() {
        addSubview(cellView)
        cellView.topAnchor.constraint(equalTo: topAnchor, constant: 4).isActive = true
        cellView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -4).isActive = true
        cellView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8).isActive = true
        cellView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
