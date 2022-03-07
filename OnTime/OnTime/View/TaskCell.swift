//
//  TaskCell.swift
//  OnTime
//
//  Created by Igor Manakov on 18.02.2022.
//

import UIKit
class TaskCell: UITableViewCell {
    
    let beginTimeLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    let endTimeLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    let taskNameLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        label.numberOfLines = 1
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    let taskDescriptionLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.numberOfLines = 2
        label.font = UIFont.systemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    let locationLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 13)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    let timeStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 5
        stack.alignment = .trailing
        stack.distribution = .fillEqually
        stack.translatesAutoresizingMaskIntoConstraints = false
        
        return stack
    }()
    
    let taskInfoStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 5
        stack.alignment = .leading
        stack.distribution = .fill
        stack.translatesAutoresizingMaskIntoConstraints = false
        
        return stack
    }()
    
    // MARK: - Init
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup
    
    private func setupViews() {
        addSubview(timeStack)
        addSubview(taskInfoStack)
        timeStack.addArrangedSubview(beginTimeLabel)
        timeStack.addArrangedSubview(endTimeLabel)
        taskInfoStack.addArrangedSubview(taskNameLabel)
        taskInfoStack.addArrangedSubview(taskDescriptionLabel)
        taskInfoStack.addArrangedSubview(locationLabel)
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            timeStack.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            timeStack.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            timeStack.widthAnchor.constraint(greaterThanOrEqualToConstant: 60),
            timeStack.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
//            timeStack.heightAnchor.constraint(equalToConstant: 150),
            
            taskInfoStack.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            taskInfoStack.leadingAnchor.constraint(equalTo: timeStack.trailingAnchor, constant: 10),
            taskInfoStack.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            taskInfoStack.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10)
        ])
    }
}
