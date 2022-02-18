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
        label.textAlignment = .right
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    let endTimeLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .right
        label.font = UIFont.systemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    let taskNameLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    let taskDescriptionLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.numberOfLines = 0
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
        addSubview(beginTimeLabel)
        addSubview(endTimeLabel)
        addSubview(taskNameLabel)
        addSubview(taskDescriptionLabel)
        addSubview(locationLabel)
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            beginTimeLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            beginTimeLabel.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.2),
            beginTimeLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            beginTimeLabel.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.5)])
        
        NSLayoutConstraint.activate([
        endTimeLabel.topAnchor.constraint(equalTo: beginTimeLabel.bottomAnchor),
        endTimeLabel.bottomAnchor.constraint(equalTo: bottomAnchor),
        endTimeLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
        endTimeLabel.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.2)])
        
        NSLayoutConstraint.activate([
        taskNameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10),
        taskNameLabel.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.4),
        taskNameLabel.leadingAnchor.constraint(equalTo: beginTimeLabel.trailingAnchor, constant: 10),
        taskNameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10)])
        
        NSLayoutConstraint.activate([
        taskDescriptionLabel.topAnchor.constraint(equalTo: taskNameLabel.bottomAnchor),
        taskDescriptionLabel.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.4),
        taskDescriptionLabel.leadingAnchor.constraint(equalTo: endTimeLabel.trailingAnchor, constant: 10),
        taskDescriptionLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10)])
        
        NSLayoutConstraint.activate([
        locationLabel.topAnchor.constraint(equalTo: taskDescriptionLabel.bottomAnchor),
        locationLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
        locationLabel.leadingAnchor.constraint(equalTo: endTimeLabel.trailingAnchor, constant: 10),
        locationLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10)])
    }
}
