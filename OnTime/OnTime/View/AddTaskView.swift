//
//  AddTaskView.swift
//  OnTime
//
//  Created by Igor Manakov on 16.02.2022.
//

import UIKit

class AddTackView: UIView {
    
    let taskTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Что надо сделать?"

        return textField
    }()
    
    let importanceSegmentedControl: UISegmentedControl = {
        let segmentedControl = UISegmentedControl(items: ["1", "2", "3"])
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        segmentedControl.selectedSegmentIndex = 0
        segmentedControl.selectedSegmentTintColor = .link
        
        return segmentedControl
    }()
    
    let datePicker: UIDatePicker = {
        let datePicker = UIDatePicker()
        datePicker.translatesAutoresizingMaskIntoConstraints = false
        datePicker.preferredDatePickerStyle = .wheels
        
        return datePicker
    }()
    
    let stack: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        
        return stack
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
        addSubview(stack)
        stack.addArrangedSubview(taskTextField)
        stack.addArrangedSubview(importanceSegmentedControl)
        stack.addArrangedSubview(datePicker)
    }
    
    func setupConstraints() {
        sharedConstraints.append(contentsOf: [
            stack.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            stack.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor, multiplier: 0.6),
            stack.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 20),
            stack.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -20)
        ])
    }
}
