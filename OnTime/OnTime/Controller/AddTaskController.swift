//
//  AddTaskController.swift
//  OnTime
//
//  Created by Igor Manakov on 15.02.2022.
//

import UIKit

protocol AddTaskControllerDelegate: AnyObject {
    func update(_ controller: AddTaskController,
                info: String)
}

class AddTaskController: UIViewController {

    let taskTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Что надо сделать?"
        textField.backgroundColor = .systemGray6
        
        return textField
    }()
    
    let taskTextView: UITextView = {
        let textField = UITextView()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.layer.shadowOpacity = 1
        textField.layer.shadowRadius = 4.0
        textField.layer.shadowColor = UIColor.black.cgColor
        
        return textField
    }()
    
    let importanceSegmentedControl: UISegmentedControl = {
        let segmentedControl = UISegmentedControl(items: ["1", "2", "3"])
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        segmentedControl.selectedSegmentIndex = 0
        
        
        return segmentedControl
    }()
    
    let datePicker: UIDatePicker = {
        let datePicker = UIDatePicker()
        datePicker.translatesAutoresizingMaskIntoConstraints = false
        datePicker.preferredDatePickerStyle = .wheels
        datePicker.datePickerMode = .dateAndTime
        return datePicker
    }()
    
    let stack: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        
        return stack
    }()
    
    public var sharedConstraints = [NSLayoutConstraint]()
    
    weak var delegate: AddTaskControllerDelegate?
    
    var stroka: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        setupUI()
        setupConstraints()
        
        NSLayoutConstraint.activate(sharedConstraints)
        delegate?.update(self, info: "hui")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("willappear")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("willdisappear")
    }
    
    func setupUI() {
        view.addSubview(stack)
        stack.addArrangedSubview(taskTextField)
        taskTextView.delegate = self
        //taskTextView.isScrollEnabled = false
        taskTextView.sizeToFit()
        stack.addArrangedSubview(importanceSegmentedControl)
        stack.addArrangedSubview(datePicker)
        stack.layer.cornerRadius = 10
        stack.spacing = 20
    }
    
    func setupConstraints() {
        sharedConstraints.append(contentsOf: [
            stack.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            stack.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor, multiplier: 0.6),
            stack.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            stack.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20)
        ])
    }

}

extension AddTaskController: UITextViewDelegate {
    func textViewDidChange(_ textView: UITextView) {
        print(textView.text!)
        
    }
}
