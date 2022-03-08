//
//  SearchTaskViewController.swift
//  OnTime
//
//  Created by Igor Manakov on 08.03.2022.
//

import UIKit

class SearchTaskViewController: UIViewController {
    
    public var tasks: [String] = ["помыться", "побриться", "поесть", "покакать"]
    
    public let searchTaskTableView: UITableView = {
        let table = UITableView()
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupDelegate()
    }
    
    //MARK: - Setup
    
    private func setupViews() {
        view.backgroundColor = .systemBackground
        view.addSubview(searchTaskTableView)
    }
    
    private func setConstraints() {
        
    }
    
    private func setupDelegate() {
        searchTaskTableView.delegate = self
        searchTaskTableView.dataSource = self
    }
    
    override func viewDidLayoutSubviews() {
        searchTaskTableView.frame = view.bounds
    }
    
}

extension SearchTaskViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = tasks[indexPath.row]
        
        return cell
    }
}
