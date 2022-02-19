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
        //textField.backgroundColor = .systemGray6
        textField.borderStyle = .roundedRect
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        return textField
    }()
    
    private let taskNameRequiredLabel: UILabel = {
        let label = UILabel()
        label.text = "Required field"
        label.font = UIFont.systemFont(ofSize: 16)
        
        return label
    }()
    
    private let taskDescriptionField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "А конкретнее?"
        //textField.backgroundColor = .systemGray6
        textField.borderStyle = .roundedRect
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        return textField
    }()
    
    private let importanceLabel: UILabel = {
        let label = UILabel()
        label.text = "Importance"
        label.font = UIFont.systemFont(ofSize: 16)
        
        return label
    }()
    
    private let label: UILabel = {
        let label = UILabel()
        label.text = "Importance"
        label.font = UIFont.systemFont(ofSize: 16)
        
        return label
    }()
    
    private let label2: UILabel = {
        let label = UILabel()
        label.text = "Importance"
        label.font = UIFont.systemFont(ofSize: 16)
        
        return label
    }()
    
    private let importanceSegmentedControl: UISegmentedControl = {
        let lowPriorityImage = UIImage(systemName: "arrow.down")?.withTintColor(.systemRed, renderingMode: .alwaysOriginal)
        let highPriorityImage = UIImage(systemName: "exclamationmark.3")?.withTintColor(.systemGreen, renderingMode: .alwaysOriginal)
        
        let segmentedControl = UISegmentedControl(items: [lowPriorityImage ?? "Low", "No", highPriorityImage ?? "High"])
        segmentedControl.selectedSegmentIndex = 0
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        
        return segmentedControl
    }()
    
    private let importanceStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.distribution = .fillEqually
        //stack.spacing = 10
        stack.translatesAutoresizingMaskIntoConstraints = false
        
        return stack
    }()
    
    private let datePicker: UIDatePicker = {
        let datePicker = UIDatePicker()
        datePicker.preferredDatePickerStyle = .compact
        datePicker.datePickerMode = .dateAndTime
        
        datePicker.translatesAutoresizingMaskIntoConstraints = false
        
        return datePicker
    }()
    
    private let locationField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Где?"
        //textField.backgroundColor = .systemGray6
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
        
        //taskNameField.becomeFirstResponder()
        setupViews()
        setConstraints()
        setupDelegate()
        registerKeyboardNotification()
    }
    
    deinit {
        removeKeyboardNotification()
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
        stack.addArrangedSubview(taskNameRequiredLabel)
        stack.addArrangedSubview(taskDescriptionField)
        importanceStack.addArrangedSubview(importanceLabel)
        importanceStack.addArrangedSubview(importanceSegmentedControl)
        stack.addArrangedSubview(importanceStack)
        stack.addArrangedSubview(datePicker)
        stack.addArrangedSubview(locationField)
        
        stack.addArrangedSubview(label)
        stack.addArrangedSubview(label2)
        
        backgroundView.addSubview(stack)
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            scrollView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0)
        ])
        
        NSLayoutConstraint.activate([
            backgroundView.centerYAnchor.constraint(equalTo: scrollView.centerYAnchor),
            backgroundView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            backgroundView.heightAnchor.constraint(equalTo: scrollView.heightAnchor),
            backgroundView.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
        ])
        
        NSLayoutConstraint.activate([
            stack.centerXAnchor.constraint(equalTo: backgroundView.centerXAnchor),
            stack.centerYAnchor.constraint(equalTo: backgroundView.centerYAnchor),
            stack.leadingAnchor.constraint(equalTo: backgroundView.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            stack.trailingAnchor.constraint(equalTo: backgroundView.safeAreaLayoutGuide.trailingAnchor, constant: -20)
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
            alertTaskHandleError()
            return
        }
        taskNameField.resignFirstResponder()
        taskDescriptionField.resignFirstResponder()
        locationField.resignFirstResponder()
        delegate?.addTask(taskName: taskName, taskDescription: taskDescriptionField.text!, beginTime: datePicker.date, endTime: "11:30", location: locationField.text!)
    }
    
    private func alertTaskHandleError() {
        let alert = UIAlertController(title: "Add task error", message: "Please enter all required information to create a new task.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        //DispatchQueue.main.async {
        self.taskNameRequiredLabel.textColor = .red
        //}
        present(alert, animated: true)
    }
    
    @objc private func handleCancel() {
        self.dismiss(animated: true, completion: nil)
    }
    
    // MARK: - Keyboard Observers
    
    private func registerKeyboardNotification() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    private func removeKeyboardNotification() {
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc private func keyboardWillShow(notification: Notification) {
        let userInfo = notification.userInfo
        let keyboardHeight = (userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
        scrollView.contentOffset = CGPoint(x: 0, y: keyboardHeight.height / 2)
    }
    
    @objc private func keyboardWillHide(notification: Notification) {
        scrollView.contentOffset = .zero
    }
}

extension AddTaskController: UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        return true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == taskNameField {
            taskDescriptionField.becomeFirstResponder()
        }
        else if textField == taskDescriptionField {
            locationField.becomeFirstResponder()
        }
        else if textField == locationField {
            handleDone()
        }
        
        return true
    }
}
