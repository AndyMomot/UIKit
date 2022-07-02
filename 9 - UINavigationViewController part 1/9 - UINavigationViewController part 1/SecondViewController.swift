//
//  SecondViewController.swift
//  9 - UINavigationViewController part 1
//
//  Created by Андрей on 02.07.2022.
//

import UIKit

class SecondViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .green
        self.title  = "Second VC"
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.perform(#selector(goBack), with: nil, afterDelay: 3.0)
    }
    
    @objc func goBack() {
//        self.navigationController?.popViewController(animated: true)
        // Получаем текущий масив контроллеров
        var curentControllerArray = self.navigationController?.viewControllers
        
        //Удаляем последний контроллер
        curentControllerArray?.removeLast()
        
        // Присваеваэм
        if let newController = curentControllerArray {
            self.navigationController?.viewControllers = newController
        }
    }
    
}
