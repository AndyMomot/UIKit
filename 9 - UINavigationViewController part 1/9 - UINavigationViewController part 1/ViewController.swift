//
//  ViewController.swift
//  9 - UINavigationViewController part 1
//
//  Created by Андрей on 02.07.2022.
//

import UIKit

class ViewController: UIViewController {

    let nextScreenButton: UIButton = {
        let button = UIButton()
        button.setTitle("Перейти", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.setTitle("Ви впевені?", for: .highlighted)
        button.setTitleColor(.red, for: .highlighted)
        button.titleLabel!.font = UIFont(name: "AppleSDGothicNeo-Thin" , size: 25)
        button.tintColor = .black
        button.layer.borderWidth = 2
        button.layer.borderColor = UIColor.black.cgColor
        button.addTarget(self, action: #selector(goToNextScreen(paramertSender:)), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .yellow
        self.navigationItem.title = "Home"
        nextScreenButton.frame = CGRect(x: 0, y: 0, width: 200, height: 50)
        nextScreenButton.center = view.center
        view.addSubview(nextScreenButton)
        
    }
    
    @objc
    func goToNextScreen(paramertSender: Any) {
        let secondVC = SecondViewController()
        self.navigationController?.pushViewController(secondVC, animated: true)
    }


}

