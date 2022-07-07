//
//  ViewController.swift
//  13 - UITextField and NotificationCenter
//
//  Created by Андрей on 07.07.2022.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    let myTextField: UITextField = {
        let textField = UITextField()
        textField.frame = CGRect(x: 0, y: 0, width: 200, height: 31)
        textField.borderStyle = .roundedRect
        textField.contentVerticalAlignment = .center
        textField.textAlignment = .center
        textField.placeholder = "Надрукуйте текст!"
        return textField
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        createMyTextField()
        notifications()
       
        
    }
    
    func createMyTextField() {
        myTextField.delegate = self
        myTextField.center = view.center
        view.addSubview(myTextField)
    }
    
    func notifications() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardwillShow(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardwillHiden(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc func  keyboardwillShow(_ aNotification: Notification) {
        self.view.frame.origin.y = -200
    }
    
    @objc func  keyboardwillHiden(_ aNotification: Notification) {
        self.view.frame.origin.y = 0.0
    }


}

extension ViewController {
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        print("textFieldShouldBeginEditing - дає дозвіл на редагування")
        if textField == myTextField {
            return true
        }
        return false
    } // return NO to disallow editing.

    func textFieldDidBeginEditing(_ textField: UITextField) {
        print("textFieldDidBeginEditing - Почалося редагування")
    }// became first  responder

    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        print("textFieldShouldEndEditing - Закінчилося редагування")
        return true
    }// return YES to allow editing to stop and to resign first responder status. NO to disallow the editing session to end


    func textFieldDidEndEditing(_ textField: UITextField, reason: UITextField.DidEndEditingReason) {
        print("textFieldDidEndEditing")
    }// if implemented, called in place of textFieldDidEndEditing:

    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        print("shouldChangeCharactersIn - виввели \(string)")
        return true
    }// return NO to not change text

    func textFieldDidChangeSelection(_ textField: UITextField) {
        print("textFieldDidChangeSelection")
    }
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        print("textFieldShouldClear - Зітрення тексту")
        return true
    }// called when clear button pressed. return NO to ignore (no notifications)

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print("textFieldShouldReturn - сховати клавіатуру")
        if textField == myTextField {
            self.myTextField.resignFirstResponder()
        }
        return true
    }// called when 'return' key pressed. return NO to ignore.
}

