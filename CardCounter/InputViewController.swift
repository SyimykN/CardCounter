//
//  ViewController.swift
//  CardCounter
//
//  Created by Sema on 5/25/21.
//

import UIKit

struct ValueCount {
    var value: Int?
    var count: Int?
}

//MARK: - InputViewController
class InputViewController: UIViewController {
    var numberOfRows = 1
    var myArray : [ValueCount] = []
    var indexPathsArray : [Int] = []
    var cardsToUse = 0
    var sum = 0
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
        table.register(MyTableViewCell.self, forCellReuseIdentifier: MyTableViewCell.identifier)
        table.register(TableHeader.self, forHeaderFooterViewReuseIdentifier: "header")
        table.register(TableFooter.self, forHeaderFooterViewReuseIdentifier: "footer")
        table.translatesAutoresizingMaskIntoConstraints = false
        table.backgroundColor = .systemGray6
        table.separatorStyle = .none
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
        tableView.delegate = self
        cardTextField.delegate = self
        sumTextField.delegate = self
        
        let constraints = [
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            stackView.heightAnchor.constraint(equalToConstant: 70),
            
            sumTitleLabel.leadingAnchor.constraint(equalTo: leftView.leadingAnchor, constant: 8),
            sumTitleLabel.topAnchor.constraint(equalTo: leftView.topAnchor, constant: 4),
            cardTitleLabel.topAnchor.constraint(equalTo: rightView.topAnchor, constant: 4),
            //            cardTitleLabel.leadingAnchor.constraint(equalTo: rightView.leadingAnchor, constant: 8),
            
            sumTextField.topAnchor.constraint(equalTo: sumTitleLabel.bottomAnchor, constant: 8),
            sumTextField.heightAnchor.constraint(equalToConstant: 35),
            sumTextField.centerXAnchor.constraint(equalTo: leftView.centerXAnchor),
            sumTextField.leadingAnchor.constraint(equalTo: leftView.leadingAnchor, constant: 8),
            //            sumTextField.trailingAnchor.constraint(equalTo: leftView.trailingAnchor, constant: -8),
            
            cardTextField.topAnchor.constraint(equalTo: cardTitleLabel.bottomAnchor, constant: 8),
            cardTextField.heightAnchor.constraint(equalToConstant: 35),
            //            cardTextField.centerXAnchor.constraint(equalTo: rightView.centerXAnchor),
            cardTextField.leadingAnchor.constraint(equalTo: rightView.leadingAnchor),
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
extension InputViewController : UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return numberOfRows
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MyTableViewCell.identifier, for: indexPath) as! MyTableViewCell
        cell.delegate = self
        return cell
    }
    //footer
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let footer = tableView.dequeueReusableHeaderFooterView(withIdentifier: "footer") as! TableFooter
        footer.delegate = self
        return footer
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 46
    }
    //header
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: "header")
        return header
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 30
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 52
    }
}

extension InputViewController: MyTableViewCellDelegate {
    func textFieldDidCheck(_ cell: MyTableViewCell, textField: UITextField, value: Int, count: Int) {
        guard let indexpath = tableView.indexPath(for: cell) else { return }
        if !indexPathsArray.contains(indexpath.row) {
            indexPathsArray.append(indexpath.row)
            numberOfRows += 1
            let newValueCount = ValueCount(value: value, count: count)
            myArray.append(newValueCount)
        }else {
            myArray[indexpath.row].value = value
            myArray[indexpath.row].count = count
        }
        self.tableView.reloadData()
    }
}

extension InputViewController: TableFooterDelegate {    
    func didTapButton(sender: UIButton) {
        if let  cards = cardTextField.text, cards != "", let sum = sumTextField.text, sum != "" {
            self.cardsToUse = Int(cards)!
            self.sum = Int(sum)!
            let vc = ResultViewController()
            var valuesTimesCountArray : [Int] = []
            for item in myArray {
                let multipliedValue = item.value! * item.count!
                valuesTimesCountArray.append(multipliedValue)
            }
            let sumOfValues = valuesTimesCountArray.reduce(0, +)
            
            if sumOfValues < Int(sum)! {
                vc.footerText = "Amount of money in all your cards is not enough to get \(sum)$"
            }else{
                let res = findCombinations(array: myArray)
                //here LOOPS THROUGH ITEMS of ARRAY INSIDE ARRAY -> [[Int]] and finds if there array with desired cards(cardsToUse)
                var arrayWithDesiredNumCards : [[Int]] = []
                for array in res{
                    if array.count == cardsToUse{
                        arrayWithDesiredNumCards.append(array)
                    }
                }
                //here LOOPS THROUGH ITEMS of ARRAY INSIDE ARRAY -> [[Int]] and finds if theres array with less than desired cards(cardsToUse)
                var arrayWithLessThanDesiredNumCards : [[Int]] = []
                for array in res{
                    if array.count < cardsToUse{
                        arrayWithLessThanDesiredNumCards.append(array)
                    }
                }
                //sending results to result vc depending if he find with desired num of cards or not
                if arrayWithDesiredNumCards.isEmpty {
                    //sends simple array if combinations want found with desired num of cards
                    vc.array = arrayWithLessThanDesiredNumCards
                }else {
                    //sends sorted result with combinations containing desired num of cards
                    vc.arrayWithDesiredNum = arrayWithDesiredNumCards
                }
                //second sum to send initial sum
                vc.secondSum = Int(sum)!
                //sum that can be changed if combinations wasnt found for give sum
                vc.sum = self.sum
                vc.desiredNumCards = cardsToUse
            }
            navigationController?.pushViewController(vc, animated: true)
        }else {
            if sumTextField.text == nil || sumTextField.text == ""{
                sumTextField.layer.borderWidth = 1
                sumTextField.layer.borderColor = UIColor.red.cgColor
                sumTextField.placeholder = "Please fill in"
            }else {
                cardTextField.placeholder = "Please Fill in"
                cardTextField.layer.borderWidth = 1
                cardTextField.layer.borderColor = UIColor.red.cgColor
            }
        }
    }
}

extension InputViewController : UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.layer.borderWidth = 0
        textField.layer.borderColor = UIColor.clear.cgColor
    }
}
//MARK: - Make new array and give to algorithm
extension InputViewController{
    func findCombinations(array : [ValueCount]) -> [[Int]] {
        //make array of Ints from value repeating count times
        var arrayOfCards: [Int] = []
        for item in array{
            let tempArray = [Int](repeating: item.value!, count: item.count!)
            var j = 0
            for i in tempArray{
                if item.value! * (j+1) >= sum {
                    arrayOfCards.append(i)
                    break
                }
                j += 1
                arrayOfCards.append(i)
            }
        }
        //call subset
        var resultArray = [[Int]]()
        let newArray = subsetNumbers(array: arrayOfCards, target: sum, subsetArray: [],result: &resultArray)
        // FIXME: fix me here
        //executes if result is empty because cant make a sum from given numbers
        while resultArray.isEmpty {
            sum += 1
            resultArray = subsetNumbers(array: arrayOfCards, target: sum, subsetArray: [], result: &resultArray)
        }
        return resultArray
    }
}
//MARK: - subsetNumbers algorithm
//holds actual algorithm
extension InputViewController {
    func sum(array : [Int]) -> Int{
        var sum = 0
        array.forEach { (item) in
            sum = item + sum
        }
        return sum
    }
    func subsetNumbers(array :[Int], target : Int, subsetArray: [Int],result : inout [[Int]]) -> [[Int]]{
        let s = sum(array: subsetArray)
        if(s == target){
            result.append(subsetArray)
        }
        for i in 0..<array.count{
            let n = array[i]
            let remaning = Array(array[(i+1)..<array.count])
            subsetNumbers(array: remaning, target: target, subsetArray: subsetArray + [n], result: &result)
        }
        return result
    }
}
