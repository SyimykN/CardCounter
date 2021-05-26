//
//  ResultViewController.swift
//  CardCounter
//
//  Created by Sema on 5/25/21.
//

import UIKit

class ResultViewController: UIViewController {
    //MARK: - Var and Lets
//    var sum = 0
//    var numOfCards = 0
    var arrayOfValueAndCount : [ValueCount] = []
//    var indexPath = 2
    var footerText = ""
    //MARK: - UI
    let tableView : UITableView = {
        let table = UITableView()
        table.register(ResultTableViewCell.self, forCellReuseIdentifier: ResultTableViewCell.identifier)
        table.register(ResultTableViewFooter.self, forHeaderFooterViewReuseIdentifier: "footer")
        table.translatesAutoresizingMaskIntoConstraints = false
        table.backgroundColor = .systemGray6
        table.separatorStyle = .none
        return table
    }()
    //MARK: - ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray6
        view.addSubview(tableView)
        tableView.dataSource = self
        tableView.delegate = self
        title = "Result"
//        print(arrayOfValueAndCount)
        let constraints = [
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ]
        
        NSLayoutConstraint.activate(constraints)
    }
}
extension ResultViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayOfValueAndCount.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier:  ResultTableViewCell.identifier, for: indexPath) as! ResultTableViewCell
        cell.resultLabel.text = "Use \(arrayOfValueAndCount[indexPath.row].count!) cards with \(arrayOfValueAndCount[indexPath.row].value!)$"
        return cell
    }
    //footer
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let footer = tableView.dequeueReusableHeaderFooterView(withIdentifier: "footer") as! ResultTableViewFooter
        footer.resultLabel.text = footerText
        return footer
    }
}
