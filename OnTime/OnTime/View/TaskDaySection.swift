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
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let dayInfoLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup() {
        //addSubview(image)
        addSubview(weeksDayLabel)
        addSubview(dayInfoLabel)
        
        weeksDayLabel.topAnchor.constraint(equalTo: topAnchor).isActive = true
        weeksDayLabel.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
        weeksDayLabel.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.5).isActive = true
        
        dayInfoLabel.topAnchor.constraint(equalTo: weeksDayLabel.bottomAnchor).isActive = true
        dayInfoLabel.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        dayInfoLabel.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        dayInfoLabel.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
        
    }
}
