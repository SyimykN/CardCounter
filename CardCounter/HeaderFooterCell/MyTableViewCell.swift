//
//  MyTableViewCell.swift
//  CardCounter
//
//  Created by Sema on 5/25/21.
//

import UIKit

protocol MyTableViewCellDelegate: AnyObject {
    func textFieldDidCheck(_ cell: MyTableViewCell, textField: UITextField, value : Int, count : Int)
}

class MyTableViewCell: UITableViewCell {
    
    var newRow = false
    var indextPath = 0
    
    let stackView : UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 8
        return stackView
    }()
    
    let valueTextField : UITextField = {
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
    
    let countTextField : UITextField = {
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

   static let identifier = "MyTableViewCell"
    weak var delegate: MyTableViewCellDelegate?
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .systemGray6
        contentView.addSubview(stackView)
        stackView.addArrangedSubview(valueTextField)
        stackView.addArrangedSubview(countTextField)
        valueTextField.delegate = self
        countTextField.delegate = self
        let constraints = [
            stackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
        ]
        
        NSLayoutConstraint.activate(constraints)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
extension MyTableViewCell : UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        if let value = valueTextField.text, value != "", let count = countTextField.text, count != "" {
            delegate?.textFieldDidCheck(self, textField: textField, value: Int(value)!, count: Int(count)!)
        }else {
            print("Conditions not met in tableview cell textfields")
        }
    }
//
//    func textFieldDidBeginEditing(_ textField: UITextField) {
//        if let value = valueTextField.text, value.count == 0, let count = countTextField.text, count.count == 0 {
//            //These textfield is new
//            newRow = true
//        }else {
//            print("These textfield is old one.")
//        }
//    }
}
