//
//  AddTaskController.swift
//  OnTime
//
//  Created by Igor Manakov on 15.02.2022.
//

import UIKit

protocol AddTaskDelegate {
    func addTask(taskName: String, taskDescription: String, beginTime: String, endTime: String, location: String)
}

class AddTaskController: UIViewController {

    var delegate: AddTaskDelegate?
    
    let taskNameField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Что надо сделать?"
        textField.backgroundColor = .systemGray6
        
        return textField
    }()
    
    let taskDescriptionView: UITextView = {
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
        //datePicker.locale = .current
        return datePicker
    }()
    
    let locationField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Где?"
        textField.backgroundColor = .systemGray6
        
        return textField
    }()
    
    let stack: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.distribution = .fillEqually
        
        return stack
    }()
    
    public var sharedConstraints = [NSLayoutConstraint]()
    
    var stroka: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(handleDone))
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(handleCancel))
        setupUI()
        setupConstraints()
        
        NSLayoutConstraint.activate(sharedConstraints)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("willappear")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("willdisappear")
    }
    
    // MARK: - Selectors
    
    @objc func handleDone() {
        guard let taskName = taskNameField.text, taskNameField.hasText else {
            print("Handle error here...")
            return
        }
        delegate?.addTask(taskName: taskName, taskDescription: taskDescriptionView.text, beginTime: "10:00", endTime: "11:30", location: locationField.text!)
    }
    
    @objc func handleCancel() {
        self.dismiss(animated: true, completion: nil)
    }
    
    func setupUI() {
        view.addSubview(stack)
        
        stack.addArrangedSubview(taskNameField)
        taskNameField.becomeFirstResponder()
        //taskNameField.delegate = self
        taskNameField.sizeToFit()
        
        stack.addArrangedSubview(taskDescriptionView)
        stack.addArrangedSubview(importanceSegmentedControl)
        stack.addArrangedSubview(datePicker)
        stack.addArrangedSubview(locationField)
        stack.layer.cornerRadius = 10
        stack.spacing = 20
    }
    
    func setupConstraints() {
        sharedConstraints.append(contentsOf: [
            stack.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stack.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stack.widthAnchor.constraint(equalToConstant: view.frame.width - 64),
            stack.heightAnchor.constraint(equalToConstant: view.frame.height - 40)
        ])
    }

}

extension AddTaskController: UITextViewDelegate {
    func textViewDidChange(_ textView: UITextView) {
        print(textView.text!)
        
    }
}
