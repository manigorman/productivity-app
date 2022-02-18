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
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    let endTimeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    let taskNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    let taskDescriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    let locationLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    // MARK: - Init
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup
    
    private func setup() {
        addSubview(beginTimeLabel)
        addSubview(endTimeLabel)
        addSubview(taskNameLabel)
        addSubview(taskDescriptionLabel)
        addSubview(locationLabel)
        
        beginTimeLabel.topAnchor.constraint(equalTo: topAnchor).isActive = true
        beginTimeLabel.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.2).isActive = true
        beginTimeLabel.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        beginTimeLabel.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.5).isActive = true
        
        endTimeLabel.topAnchor.constraint(equalTo: beginTimeLabel.bottomAnchor).isActive = true
        endTimeLabel.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        endTimeLabel.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        endTimeLabel.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.2).isActive = true
        
        taskNameLabel.topAnchor.constraint(equalTo: topAnchor).isActive = true
        taskNameLabel.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.4).isActive = true
        taskNameLabel.leadingAnchor.constraint(equalTo: beginTimeLabel.trailingAnchor).isActive = true
        taskNameLabel.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        
        taskDescriptionLabel.topAnchor.constraint(equalTo: taskNameLabel.bottomAnchor).isActive = true
        taskDescriptionLabel.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.4).isActive = true
        taskDescriptionLabel.leadingAnchor.constraint(equalTo: endTimeLabel.trailingAnchor).isActive = true
        taskDescriptionLabel.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        
        locationLabel.topAnchor.constraint(equalTo: taskDescriptionLabel.bottomAnchor).isActive = true
        locationLabel.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        locationLabel.leadingAnchor.constraint(equalTo: endTimeLabel.trailingAnchor).isActive = true
        locationLabel.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
    }
}
