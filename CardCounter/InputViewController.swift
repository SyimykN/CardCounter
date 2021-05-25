//
//  ViewController.swift
//  CardCounter
//
//  Created by Sema on 5/25/21.
//

import UIKit

class TableHeader: UITableViewHeaderFooterView {
    
}

class TableFooter: UITableViewHeaderFooterView {
    
}

class InputViewController: UIViewController {
    //MARK: - UI
    let stackView : UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    let stackViewBottomView : UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray3
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let leftView : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let sumTitleLabel : UILabel = {
        let label = UILabel()
        label.text = "Sum"
        label.font = UIFont.systemFont(ofSize: 15)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let sumTextField : UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .systemGray5
        textField.layer.cornerRadius = 8
        textField.translatesAutoresizingMaskIntoConstraints = false
        let paddingView: UIView = UIView(frame: CGRect(x: 0, y: 0, width: 5, height: 20))
        textField.leftView = paddingView
        textField.leftViewMode = .always
        textField.keyboardType = .numberPad
        return textField
    }()
    
    let rightView : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let cardTitleLabel : UILabel = {
        let label = UILabel()
        label.text = "Cards"
        label.font = UIFont.systemFont(ofSize: 15)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let cardTextField : UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .systemGray5
        textField.layer.cornerRadius = 8
        let paddingView: UIView = UIView(frame: CGRect(x: 0, y: 0, width: 8, height: 20))
        textField.leftView = paddingView
        textField.leftViewMode = .always
        textField.keyboardType = .numberPad
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    let tableView : UITableView = {
        let table = UITableView()
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        table.backgroundColor = .systemRed
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
    }()
    //MARK: - ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray6
        title = "Card Counter"
        view.addSubview(stackView)
        view.addSubview(stackViewBottomView)
        stackView.addArrangedSubview(leftView)
        stackView.addArrangedSubview(rightView)
        leftView.addSubview(sumTitleLabel)
        leftView.addSubview(sumTextField)
        rightView.addSubview(cardTitleLabel)
        rightView.addSubview(cardTextField)
        view.addSubview(tableView)
        tableView.dataSource = self
        
        let constraints = [
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            stackView.heightAnchor.constraint(equalToConstant: 70),
            
            sumTitleLabel.leadingAnchor.constraint(equalTo: leftView.leadingAnchor, constant: 8),
            sumTitleLabel.topAnchor.constraint(equalTo: leftView.topAnchor, constant: 4),
            cardTitleLabel.topAnchor.constraint(equalTo: rightView.topAnchor, constant: 4),
            cardTitleLabel.leadingAnchor.constraint(equalTo: rightView.leadingAnchor, constant: 8),
            
            sumTextField.topAnchor.constraint(equalTo: sumTitleLabel.bottomAnchor, constant: 8),
            sumTextField.heightAnchor.constraint(equalToConstant: 35),
            sumTextField.centerXAnchor.constraint(equalTo: leftView.centerXAnchor),
            sumTextField.leadingAnchor.constraint(equalTo: leftView.leadingAnchor, constant: 8),
            sumTextField.trailingAnchor.constraint(equalTo: leftView.trailingAnchor, constant: -8),
            
            cardTextField.topAnchor.constraint(equalTo: cardTitleLabel.bottomAnchor, constant: 8),
            cardTextField.heightAnchor.constraint(equalToConstant: 35),
            cardTextField.centerXAnchor.constraint(equalTo: rightView.centerXAnchor),
            cardTextField.leadingAnchor.constraint(equalTo: rightView.leadingAnchor, constant: 8),
            cardTextField.trailingAnchor.constraint(equalTo: rightView.trailingAnchor, constant: -8),
            
            stackViewBottomView.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 8),
            stackViewBottomView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8),
            stackViewBottomView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8),
            stackViewBottomView.heightAnchor.constraint(equalToConstant: 2),
            
            tableView.topAnchor.constraint(equalTo: stackViewBottomView.bottomAnchor, constant: 4),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ]

        NSLayoutConstraint.activate(constraints)
    }
}
extension InputViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = "some text goes here"
        return cell
    }
}
