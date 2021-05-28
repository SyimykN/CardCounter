//
//  ResultViewController.swift
//  CardCounter
//
//  Created by Sema on 5/25/21.
//

import UIKit

class ResultViewController: UIViewController {
    //MARK: - Var and Lets
    var array : [[Int]] = []
    var arrayWithDesiredNum : [[Int]] = []
    var arrayOfValueAndCount : [ValueCount] = []
//    var indexPath = 2
    var footerText = ""
    var sum = 0
    var desiredNumCards = 0
    var secondSum = 0
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
        print("array is \(array)")
        print("arrayWithDesiredNum is \(arrayWithDesiredNum)")
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
        if array.isEmpty {
            let set = arrayWithDesiredNum.removeDuplicates()
            return set.count
        }else {
            let set = array.removeDuplicates()
            return set.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier:  ResultTableViewCell.identifier, for: indexPath) as! ResultTableViewCell
        if array.isEmpty {
            let set = arrayWithDesiredNum.removeDuplicates()
            let stringArray = set[indexPath.row].map { String($0) }
            let stringRepresentation = stringArray.joined(separator: ",")
            cell.resultLabel.text = "Use \(stringRepresentation) cards."
        }else {
            //unique arrays
            let set = array.removeDuplicates()
            let stringArray = set[indexPath.row].map { String($0) }
            let stringRepresentation = stringArray.joined(separator: ",")
            cell.resultLabel.text = "Use \(stringRepresentation) cards."
        }
        return cell
    }
    //footer
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let footer = tableView.dequeueReusableHeaderFooterView(withIdentifier: "footer") as! ResultTableViewFooter
        if array.isEmpty && arrayWithDesiredNum.isEmpty {
            footer.resultLabel.text = "Amount of money in all your cards is not enough."
            return footer
        } else if array.isEmpty {
            footer.resultLabel.text = "\(sum)$ using \(desiredNumCards) cards"
            return footer
        } else {
            if sum != secondSum {
                footer.resultLabel.text = "You cant get \(secondSum), the nearest sum is \(sum)$."
                return footer
            }
            
            footer.resultLabel.text = "You cant make \(sum)$ with \(desiredNumCards) cards"
            return footer
        }
    }
}

//to make unique array
extension Array where Element:Equatable {
    func removeDuplicates() -> [Element] {
        var result = [Element]()
        for value in self {
            if result.contains(value) == false {
                result.append(value)
            }
        }
        return result
    }
}
