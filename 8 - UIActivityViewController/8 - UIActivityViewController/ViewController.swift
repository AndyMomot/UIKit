//
//  ViewController.swift
//  8 - UIActivityViewController
//
//  Created by Андрей on 01.07.2022.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    var textField = UITextField()
    var buttonShare = UIButton()
    var activityViewController: UIActivityViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createTextField()
        createButton()
        
    }
    
    // MARK: - Methods
    func createTextField() {
        self.textField.delegate = self
        self.textField.borderStyle = .roundedRect
        self.textField.placeholder = "Текст для відправки"
        self.textField.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(self.textField)
        
        [
            self.textField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 200),
            self.textField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            self.textField.widthAnchor.constraint(equalToConstant: 280),
            self.textField.heightAnchor.constraint(equalToConstant: 32)
        ].forEach({$0.isActive = true})
    }
    
    func createButton() {
        self.buttonShare.setTitle("Відправити", for: .normal)
        self.buttonShare.backgroundColor = .black
        self.buttonShare.addTarget(self, action: #selector(self.hendleShare(parametrSender:)), for: .touchUpInside)
        self.buttonShare.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview( self.buttonShare)
        
        [
            self.buttonShare.topAnchor.constraint(equalTo: self.textField.bottomAnchor, constant: 20),
            self.buttonShare.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            self.buttonShare.widthAnchor.constraint(equalToConstant: 280),
            self.buttonShare.heightAnchor.constraint(equalToConstant: 40)
        ].forEach({$0.isActive = true})
        
    }
    
    @objc
    func hendleShare(parametrSender: Any) {
        let text = self.textField.text
        
        if text?.count == 0 {
            let massage = "Спочатку введіть текст!"
            let alertController = UIAlertController(title: nil, message: massage, preferredStyle: .alert)
            let alertAction = UIAlertAction(title: "ok", style: .cancel, handler: nil)
            alertController.addAction(alertAction)
            self.present(alertController, animated: true, completion: nil)
        }
        
        self.activityViewController = UIActivityViewController(activityItems: [self.textField], applicationActivities: nil)
        self.present(self.activityViewController!, animated: true, completion: nil)
        
    }
    
    // MARK: - UITextFieldDelegate
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.textField.resignFirstResponder()
        return true
    }


}

