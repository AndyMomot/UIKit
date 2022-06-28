//
//  ViewController.swift
//  5 - UIPickerView
//
//  Created by Андрей on 28.06.2022.
//

import UIKit

class PickeViewController: UIViewController {

    let picker = UIPickerView()
    let data = ["Andrey", "Ruslan", "Mariana"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        picker.center = view.center
        picker.layer.borderWidth = 1
        picker.layer.borderColor = UIColor.black.cgColor
        
        picker.dataSource = self
        picker.delegate = self
        view.addSubview(picker)
        
        
    }


}

extension PickeViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        data.count
    }
    
}

extension PickeViewController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return data[row]
    }
}
