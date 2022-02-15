//
//  ScheduleView.swift
//  OnTime
//
//  Created by Igor Manakov on 15.02.2022.
//

import UIKit

class ScheduleView: UIView {
    
    let tableView: UITableView = {
        let table = UITableView()
        table.separatorStyle = .none
        table.allowsSelection = false
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
    }()
    
    public var sharedConstraints = [NSLayoutConstraint]()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .systemBackground
        setupUI()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI() {
        addSubview(tableView)
    }
    
    func setupConstraints() {
        sharedConstraints.append(contentsOf: [
            tableView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor)
        ])
    }
}
