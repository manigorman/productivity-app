//
//  DetailedTaskViewController.swift
//  OnTime
//
//  Created by Igor Manakov on 21.02.2022.
//

import UIKit

protocol DetailedTaskDelegate {
    func editTask(name: String, row: Int)
}

class DetailedTaskViewController: UIViewController {

    var delegate: DetailedTaskDelegate?
    
    var task = ""
    var row = -1
    
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        
        return scrollView
    }()
    
    private let backgroundView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    private let taskNameField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .systemGray6
        textField.borderStyle = .roundedRect
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        return textField
    }()
    
    private let taskDescriptionField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .systemGray6
        textField.borderStyle = .roundedRect
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        return textField
    }()
    
    private let importanceSegmentedControl: UISegmentedControl = {
        let lowPriorityImage = UIImage(systemName: "arrow.down")?.withTintColor(.systemRed, renderingMode: .alwaysOriginal)
        let highPriorityImage = UIImage(systemName: "exclamationmark.3")?.withTintColor(.systemGreen, renderingMode: .alwaysOriginal)
        
        let segmentedControl = UISegmentedControl(items: [lowPriorityImage ?? "Low", "No", highPriorityImage ?? "High"])
        segmentedControl.selectedSegmentIndex = 0
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        
        return segmentedControl
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
    
    //MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        setupViews()
        setConstraints()
        
        taskNameField.placeholder = task
        
        // Do any additional setup after loading the view.
    }

    //MARK: - Setup
    
    private func setupViews() {
        navigationController?.navigationBar.prefersLargeTitles = false
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(handleDone))
        view.addSubview(scrollView)
        scrollView.addSubview(backgroundView)
        stack.addArrangedSubview(taskNameField)
        stack.addArrangedSubview(taskDescriptionField)
        stack.addArrangedSubview(importanceSegmentedControl)
        stack.addArrangedSubview(datePicker)
        stack.addArrangedSubview(locationField)
        backgroundView.addSubview(stack)
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        NSLayoutConstraint.activate([
            backgroundView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            backgroundView.centerYAnchor.constraint(equalTo: scrollView.centerYAnchor),
            backgroundView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            backgroundView.heightAnchor.constraint(equalTo: scrollView.heightAnchor)
        ])
        
        NSLayoutConstraint.activate([
            stack.centerXAnchor.constraint(equalTo: backgroundView.centerXAnchor),
            stack.topAnchor.constraint(equalTo: backgroundView.topAnchor, constant: 20),
            stack.leadingAnchor.constraint(equalTo: backgroundView.leadingAnchor, constant: 20),
            stack.trailingAnchor.constraint(equalTo: backgroundView.trailingAnchor, constant: -20)
        ])
    }
    
    //MARK: Selectors
    
    @objc private func handleDone() {
        self.navigationController?.popViewController(animated: true)
        delegate?.editTask(name: "Biba", row: row)
    }

}

