//
//  ResultTableViewCell.swift
//  CardCounter
//
//  Created by Sema on 5/26/21.
//

import UIKit

class ResultTableViewCell: UITableViewCell {
    static let identifier = "ResultTableViewCell"
    
    var resultLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 1
        label.textAlignment = .center
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .systemGray6
        contentView.addSubview(resultLabel)

        let constraints = [
            resultLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12),
            resultLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -12),
            resultLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            resultLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
        ]
        
        NSLayoutConstraint.activate(constraints)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
