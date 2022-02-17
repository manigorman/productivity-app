//
//  ScheduleViewController.swift
//  OnTime
//
//  Created by Igor Manakov on 15.02.2022.
//

import UIKit

class ScheduleViewController: UIViewController {
    
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
    
    var data: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for i in 1...15 {
            data.append("\(i)")
        }
        
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
        //self.navigationController?.pushViewController(vc, animated: true)
        self.present(UINavigationController(rootViewController: vc), animated: true, completion: nil)
    }

    
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
    
    func createItem(name: String) {
        let newItem = TaskListItem(context: context)
        newItem.name = name
        newItem.createdAt = Date()
        
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
        item.name = newName
        do {
            try context.save()
        }
        catch {
            
        }
    }
    
    
}

class TaskCell: UITableViewCell {
    
    let image: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "house")!
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }
    
    func setup() {
        addSubview(image)
        addSubview(label)
        image.topAnchor.constraint(equalTo: topAnchor).isActive = true
        image.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        image.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        image.widthAnchor.constraint(equalTo: image.heightAnchor).isActive = true
        label.topAnchor.constraint(equalTo: topAnchor).isActive = true
        label.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        label.leadingAnchor.constraint(equalTo: image.trailingAnchor).isActive = true
        label.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
