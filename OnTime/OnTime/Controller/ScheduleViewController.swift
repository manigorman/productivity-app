//
//  ScheduleViewController.swift
//  OnTime
//
//  Created by Igor Manakov on 15.02.2022.
//

import UIKit

class ScheduleViewController: UIViewController {
    
    // Core Data context
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    public var sharedConstraints = [NSLayoutConstraint]()
    
    public var models = [TaskListItem]()
    
    let tableView: UITableView = {
        let table = UITableView(frame: .null, style: .insetGrouped)
        //table.separatorStyle = .none
        //table.backgroundColor = .systemBackground
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
    }()
    
    let taskCell = TaskCell()
    
    // Life-cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        getAllItems()
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "My tasks"
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(showAddTaskController))
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(TaskCell.self, forCellReuseIdentifier: "taskCellId")
        
        setupUI()
        setupConstraints()
        
        NSLayoutConstraint.activate(sharedConstraints)
    }    
    
    // Interface
    func setupUI() {
        view.addSubview(tableView)
    }
    
    func setupConstraints() {
        sharedConstraints.append(contentsOf: [
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
        ])
    }
    
    @objc func showAddTaskController() {
        let vc = AddTaskController()
        vc.delegate = self
        self.present(UINavigationController(rootViewController: vc), animated: true, completion: nil)
    }
    
    // Working with Core Data
    func getAllItems() {
        do {
            models = try context.fetch(TaskListItem.fetchRequest())
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
        catch {
        }
    }
    
    func createItem(taskName: String, taskDescription: String, beginTime: String, endTime: String, location: String) {
        let newItem = TaskListItem(context: context)
        newItem.taskName = taskName
        newItem.taskDescription = taskDescription
        newItem.priority = 0
        //newItem.beginTime = .now
        //newItem.endTime = .now
        //newItem.location =
        
        do {
            try context.save()
            getAllItems()
        }
        catch {
            
        }
    }
    
    func deleteItem(item: TaskListItem) {
        context.delete(item)
        
        do {
            try context.save()
            getAllItems()
        }
        catch {
            
        }
    }
    
    func updateItem(item: TaskListItem, newName: String) {
        item.taskName = newName
        do {
            try context.save()
        }
        catch {
            
        }
    }
}
