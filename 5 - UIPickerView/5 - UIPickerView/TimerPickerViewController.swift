//
//  TimerPickerViewController.swift
//  5 - UIPickerView
//
//  Created by Андрей on 28.06.2022.
//

import UIKit

class TimerPickerViewController: UIViewController {

    let datePicker = UIDatePicker()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        datePicker.center = view.center
        datePicker.datePickerMode = .countDownTimer
        datePicker.countDownDuration = 2*60
        
        view.addSubview(datePicker)
    }

}
