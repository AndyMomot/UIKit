//
//  ViewController.swift
//  4 - UISwitch
//
//  Created by Андрей on 27.06.2022.
//

import UIKit

class ViewController: UIViewController {

    let mySwitch = UISwitch()
    let mySwitch2 = UISwitch()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createSwitch()
        createSwitch2()
    }

    func createSwitch() {
        // switch created
        self.mySwitch.frame = CGRect(x: 100, y: 100, width: 0, height: 0)
        view.addSubview(mySwitch)
        
        // switch turn on
        self.mySwitch.setOn(true, animated: true)
        
        // chek
        if self.mySwitch.isOn {
            print("on")
        } else {
            print("off")
        }
        
        self.mySwitch.addTarget(self, action: #selector(switchChanged(parametrTarget:)), for: .valueChanged)
    }

    @objc func switchChanged(parametrTarget: UISwitch) {
        print("parametrTarget - ", parametrTarget)
        
        if parametrTarget.isOn {
            print("on")
        } else {
            print("off")
        }
    }
    
    func createSwitch2() {
        mySwitch2.frame = CGRect.zero
        mySwitch2.center = view.center
        view.addSubview(mySwitch2)
        mySwitch2.setOn(true, animated: true)
        
        mySwitch2.layer.borderWidth = 1
        mySwitch2.layer.borderColor = UIColor.black.cgColor
        mySwitch2.backgroundColor = .gray
        
        mySwitch2.addTarget(self, action: #selector(switchTwoChanged(parametrTarget:)), for: .valueChanged)
        
    }
    
    @objc func switchTwoChanged(parametrTarget: UISwitch) {
        let colors: [UIColor] = [.red, .blue, .black, .white, .cyan]
        let color = colors.shuffled().first!
        let rundomeY = Double.random(in: 0..<view.frame.size.height - parametrTarget.frame.size.height)
        let rundomeX = Double.random(in: 0..<view.frame.size.width - parametrTarget.frame.size.width)
        
        func changeLocation() {
            parametrTarget.frame = CGRect(x: rundomeX, y: rundomeY, width: 0, height: 0)
        }
        
        if parametrTarget.isOn {
            UIView.animate(withDuration: 0.3) {
                parametrTarget.thumbTintColor = .black
                parametrTarget.onTintColor = .red
                parametrTarget.layer.borderColor = UIColor.black.cgColor
                changeLocation()
                self.view.backgroundColor = .white
            }
            
        } else {
            UIView.animate(withDuration: 0.3) {
                parametrTarget.thumbTintColor = colors.shuffled().last!
                parametrTarget.layer.borderColor = UIColor.white.cgColor
                changeLocation()
                self.view.backgroundColor = color
                //SystemRandomNumberGenerato
            }
            
        }
        
        
        
    }
}

