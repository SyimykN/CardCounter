//
//  ResultViewController.swift
//  CardCounter
//
//  Created by Sema on 5/25/21.
//

import UIKit

class ResultViewController: UIViewController {
    var sum = 0
    var numOfCards = 0
    var arrayOfValueAndCount : [ValueCount] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemGray6
        title = "Result"
        print("Sum is \(sum)")
        print("numOfCards is \(numOfCards)")
        print("arrayOfValueAndCount is \(arrayOfValueAndCount)")
    }
}

