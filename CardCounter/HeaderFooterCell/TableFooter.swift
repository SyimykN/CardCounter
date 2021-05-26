//
//  TableFooter.swift
//  CardCounter
//
//  Created by Sema on 5/25/21.
//

import UIKit

protocol TableFooterDelegate : AnyObject {
    func didTapButton(sender : UIButton)
}

class TableFooter: UITableViewHeaderFooterView {
    static let identifier = "TableFooter"
    weak var delegate : TableFooterDelegate?
    let button : UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemGray
        button.layer.cornerRadius = 12
        button.setTitle("Submit", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(btnTapped(sender:)), for: .touchUpInside)
        return button
    }()
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        contentView.addSubview(button)
        contentView.backgroundColor = .systemGray6
        let constraints = [
            button.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            button.heightAnchor.constraint(equalToConstant: 30),
            button.widthAnchor.constraint(equalToConstant: 120),
        ]
        
        NSLayoutConstraint.activate(constraints)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func btnTapped(sender: UIButton) {
        delegate?.didTapButton(sender: sender)
    }
}
