//
//  ScheduleViewController.swift
//  OnTime
//
//  Created by Igor Manakov on 15.02.2022.
//

import UIKit
import CoreData

class ScheduleViewController: UIViewController {
    
    // Core Data context
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    public var models = [TaskListItem]()
    
    let tableView: UITableView = {
        let table = UITableView(frame: .null, style: .insetGrouped)
        //table.backgroundColor = .systemBackground
        
        table.register(TaskCell.self, forCellReuseIdentifier: "taskCellId")
        table.translatesAutoresizingMaskIntoConstraints = false
        
        return table
    }()
    
    private let searchController = UISearchController(searchResultsController: nil)
    
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getAllItems()
        
        setNavigationBar()
        setupViews()
        setConstraints()
        setupDelegate()
    }
    
    // MARK: - Setup
    
    private func setupViews() {
        view.backgroundColor = .systemBackground
        view.addSubview(tableView)
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
    
    private func setupDelegate() {
        tableView.delegate = self
        tableView.dataSource = self
        
        searchController.searchBar.delegate = self
    }
    
    private func setNavigationBar() {
        navigationItem.title = "My tasks"
        navigationItem.searchController = searchController
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(showAddTaskController))
        searchController.searchBar.placeholder = "Search"
        searchController.obscuresBackgroundDuringPresentation = false
    }
    
    // MARK: - Selectors
    
    @objc private func showAddTaskController() {
        let vc = AddTaskController()
        vc.delegate = self
        self.present(UINavigationController(rootViewController: vc), animated: true, completion: nil)
    }
    
    // MARK: - Core Data
    
    func getAllItems() {
        do {
            
            let request = TaskListItem.fetchRequest() as NSFetchRequest<TaskListItem>
            
            // Set filtering and sorting on the request
            
            let startDate = Date.now
            //let endDate = Calendar.current.date(byAdding: .weekOfYear, value: 1, to: startDate)!
            let endDate = Calendar.current.date(byAdding: .weekday, value: 1, to: startDate)!
            print(startDate, endDate)
            //let pred = NSPredicate(format: "(beginTime >= %@) AND (beginTime <= %@)", startDate as NSDate, endDate as NSDate)
            //let pred = NSPredicate(format: "taskName CONTAINS %@", "Go")
            let pred = NSPredicate(format: "(beginTime >= %@) AND (beginTime <= %@)", startDate as NSDate, endDate as NSDate)
            request.predicate = pred
            
            let sort = NSSortDescriptor(key: "beginTime", ascending: true)
            request.sortDescriptors = [sort]
            
            self.models = try context.fetch(request)
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
            //print(models[0].beginTime)
        }
        catch {
        }
    }
    
    func createItem(taskName: String, taskDescription: String, beginTime: Date, endTime: String, location: String) {
        let newItem = TaskListItem(context: context)
        newItem.taskName = taskName
        newItem.taskDescription = taskDescription
        newItem.priority = 0
        newItem.beginTime = beginTime
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

extension ScheduleViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print(searchText)
    }
}
