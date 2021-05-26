//
//  ResultTableViewFooter.swift
//  CardCounter
//
//  Created by Sema on 5/26/21.
//

import UIKit

class ResultTableViewFooter: UITableViewHeaderFooterView {
    static let identifier  = "ResultTableViewFooter"
    
    var resultLabel : UILabel = {
        let label = UILabel()
//        label.text = "Theres not enough money in your cards!"
        label.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.textAlignment = .center
        label.layer.borderColor = UIColor.darkGray.cgColor
        label.layer.borderWidth = 1
        label.layer.cornerRadius = 4
        return label
    }()
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        contentView.addSubview(resultLabel)
        contentView.backgroundColor = .systemGray6
        let constraints = [
            resultLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            resultLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 4),
            resultLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -4),
            resultLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            resultLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
        ]
        
        NSLayoutConstraint.activate(constraints)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
