//
//  DataPickerViewController.swift
//  5 - UIPickerView
//
//  Created by Андрей on 28.06.2022.
//

import UIKit

class DatePickerViewController: UIViewController {

    let datePicker = UIDatePicker()
    var count = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        datePicker.center = view.center
        datePicker.layer.borderWidth = 1
        datePicker.layer.borderColor = UIColor.black.cgColor
        datePicker.layer.cornerRadius = 10
        datePicker.datePickerMode = .date
        
        view.addSubview(datePicker)
        
        var oneYearTime = TimeInterval()
        oneYearTime = 365 * 24 * 60 * 60
        let todayDate = Date()
        
        let oneYearFromeToday = todayDate.addingTimeInterval(oneYearTime * (-60))
        let twoYearsFromeDate = todayDate.addingTimeInterval(oneYearTime * (-18))
       
        datePicker.minimumDate = oneYearFromeToday
        datePicker.maximumDate = twoYearsFromeDate
        datePicker.addTarget(self, action: #selector(datePickerChange(picker:)), for: .valueChanged)
       
    }
    
    @objc func datePickerChange(picker: UIDatePicker) {
       
        
        if picker.isEqual(datePicker) {
            print("Date - ", picker.date, count)
            count += 1
        }
        
        
    }

}
