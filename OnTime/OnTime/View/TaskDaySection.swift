//
//  TaskDaySection.swift
//  OnTime
//
//  Created by Igor Manakov on 18.02.2022.
//

import Foundation
import UIKit

class TaskDaySection: UIView {
    
    let weeksDayLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 30, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let dayInfoLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup
    
    func setupViews() {
        //addSubview(image)
        addSubview(weeksDayLabel)
        addSubview(dayInfoLabel)
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            weeksDayLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            weeksDayLabel.widthAnchor.constraint(equalTo: widthAnchor),
            weeksDayLabel.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.5)
        ])
        
        NSLayoutConstraint.activate([
            dayInfoLabel.topAnchor.constraint(equalTo: weeksDayLabel.bottomAnchor, constant: 5),
            dayInfoLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
            dayInfoLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            dayInfoLabel.widthAnchor.constraint(equalTo: widthAnchor)
        ])
    }
}
