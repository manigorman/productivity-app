//
//  AddTaskController.swift
//  OnTime
//
//  Created by Igor Manakov on 15.02.2022.
//

import UIKit

protocol AddTaskDelegate {
    func addTask(taskName: String, taskDescription: String, beginTime: Date, endTime: String, location: String)
}

class AddTaskController: UIViewController {

    var delegate: AddTaskDelegate?
    
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
       
        return scrollView
    }()
    
    private let backgroundView: UIView = {
        let view = UIView()
        //view.backgroundColor = .systemBackground
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    private let taskNameField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Что надо сделать?"
        textField.backgroundColor = .systemGray6
        textField.borderStyle = .roundedRect
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        return textField
    }()
    
    private let taskDescriptionField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "А конкретнее?"
        textField.backgroundColor = .systemGray6
        textField.borderStyle = .roundedRect
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        return textField
    }()
    
    private let importanceSegmentedControl: UISegmentedControl = {
        let segmentedControl = UISegmentedControl(items: ["1", "2", "3"])
        segmentedControl.selectedSegmentIndex = 0
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        
        return segmentedControl
    }()
    
    private let datePicker: UIDatePicker = {
        let datePicker = UIDatePicker()
        datePicker.preferredDatePickerStyle = .automatic
        datePicker.datePickerMode = .dateAndTime
        datePicker.translatesAutoresizingMaskIntoConstraints = false
        
        return datePicker
    }()
    
    private let locationField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Где?"
        textField.backgroundColor = .systemGray6
        textField.borderStyle = .roundedRect
        
        return textField
    }()
    
    private let stack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 10
        stack.distribution = .fillEqually
        stack.translatesAutoresizingMaskIntoConstraints = false

        return stack
    }()
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        taskNameField.becomeFirstResponder()
        setupViews()
        setupConstraints()
        setupDelegate()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("willappear")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("willdisappear")
    }
    
    // MARK: - Setup
    
    private func setupViews() {
        view.backgroundColor = .systemBackground
        title = "New Task"
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(handleDone))
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(handleCancel))
        
        view.addSubview(scrollView)
        scrollView.addSubview(backgroundView)
        
        stack.addArrangedSubview(taskNameField)
        stack.addArrangedSubview(taskDescriptionField)
        stack.addArrangedSubview(importanceSegmentedControl)
        stack.addArrangedSubview(datePicker)
        stack.addArrangedSubview(locationField)
        
        backgroundView.addSubview(stack)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
                   scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
                   scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
                   scrollView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
                   scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0)
               ])
               
               NSLayoutConstraint.activate([
                   backgroundView.centerYAnchor.constraint(equalTo: scrollView.centerYAnchor),
                   backgroundView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
                   backgroundView.heightAnchor.constraint(equalTo: view.heightAnchor),
                   backgroundView.widthAnchor.constraint(equalTo: view.widthAnchor)
               ])
               
               NSLayoutConstraint.activate([
                   stack.centerXAnchor.constraint(equalTo: backgroundView.centerXAnchor),
                   stack.centerYAnchor.constraint(equalTo: backgroundView.centerYAnchor),
                   stack.leadingAnchor.constraint(equalTo: backgroundView.leadingAnchor, constant: 20),
                   stack.trailingAnchor.constraint(equalTo: backgroundView.trailingAnchor, constant: -20)
               ])
    }
    
    private func setupDelegate() {
        taskNameField.delegate = self
        locationField.delegate = self
        taskDescriptionField.delegate = self
    }
    
    // MARK: - Selectors
    
    @objc private func handleDone() {
        guard let taskName = taskNameField.text, taskNameField.hasText else {
            print("Handle error here...")
            return
        }
        delegate?.addTask(taskName: taskName, taskDescription: taskDescriptionField.text!, beginTime: datePicker.date, endTime: "11:30", location: locationField.text!)
    }
    
    @objc private func handleCancel() {
        self.dismiss(animated: true, completion: nil)
    }
}

extension AddTaskController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        return true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        //taskNameField.resignFirstResponder()
        taskDescriptionField.resignFirstResponder()
        locationField.resignFirstResponder()
        
        return true
    }
}
