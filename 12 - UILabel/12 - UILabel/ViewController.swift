//
//  ViewController.swift
//  12 - UILabel
//
//  Created by Андрей on 06.07.2022.
//

import UIKit

class ViewController: UIViewController {

    let myLabel: UILabel = {
        let label = UILabel()
        label.text = "IOS 15 Xcode 13"
        label.font = UIFont.systemFont(ofSize: 24)
        //label.frame = CGRect(x: 0, y: 0, width: 100, height: 30)
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.adjustsFontSizeToFitWidth = true
        label.sizeToFit()
        label.textColor = .black
        label.shadowColor = .lightGray
        label.shadowOffset = CGSize(width: 0, height: 3)
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myLabel.center = self.view.center
        view.addSubview(myLabel)
    }


}

