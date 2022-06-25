//
//  ViewController.swift
//  3 - UIAlertController
//
//  Created by Андрей on 25.06.2022.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var firstButton: UIButton!
    @IBOutlet weak var secondButton: UIButton!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var changeButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        changeButton.layer.borderWidth = 2
        changeButton.layer.borderColor = UIColor.white.cgColor
        
        firstButton.layer.borderWidth = 2
        firstButton.layer.borderColor = UIColor.white.cgColor
        
        secondButton.layer.borderWidth = 2
        secondButton.layer.borderColor = UIColor.white.cgColor
    }
    
    func createAlertController(title: String, messege: String, style: UIAlertController.Style, color: UIColor) {
        
        // Create UIAlertController
        let alertController = UIAlertController(title: title, message: messege, preferredStyle: style)
        
        // Crearet button for UIAlertController
        let action = UIAlertAction(title: "Так", style: .default) { action in
            UIView.animate(withDuration: 0.3) {
                self.view.backgroundColor = color
            }
        }
        let cencel = UIAlertAction(title: "Ні", style: .cancel, handler: nil)
        
        // Add buttons on UIAlertController
        alertController.addAction(action)
        alertController.addAction(cencel)
        
        // Show UIAlertController
        self.present(alertController, animated: true, completion: nil)
        
    }
    
    @IBAction func changeButtonPressed(_ sender: Any) {
        
        // Create UIAlertController
        let aletController = UIAlertController(title: "УВАГА!", message: "Введіть пароль для зміни тексту.", preferredStyle: .alert)

        // Crearet buttons for UIAlertController
        let chackPasswordButton = UIAlertAction(title: "Так", style: .default) { action in
            let text = aletController.textFields?.first?.text
            
            if text == "1234" {
                changeText()
            } else {
                worning()
            }
        }
        let cancelButton = UIAlertAction(title: "Ні", style: .cancel, handler: nil)

        // Add buttons on UIAlertController
        aletController.addTextField { textField in
            textField.isSecureTextEntry = true
        }
        aletController.addAction(chackPasswordButton)
        aletController.addAction(cancelButton)
        
        // Show UIAlertController
        self.present(aletController, animated: true, completion: nil)
    
        ///

        
        func changeText() {
            // Create UIAlertController
            let aletController = UIAlertController(title: "УВАГА!", message: "Введіть новий текст.", preferredStyle: .alert)

            // Crearet buttons for UIAlertController
            let changeTxtButton = UIAlertAction(title: "Так", style: .default) { action in
                let text = aletController.textFields?.first?.text
                self.label.text = text

            }
            let cancelButton = UIAlertAction(title: "Ні", style: .cancel, handler: nil)

            // Add buttons on UIAlertController
            aletController.addTextField(configurationHandler: nil)
            aletController.addAction(changeTxtButton)
            aletController.addAction(cancelButton)

            // Show UIAlertController
            self.present(aletController, animated: true, completion: nil)
        }
        
        func worning() {
            let alertController = UIAlertController(title: "УВАГА!", message: "Не вірний пароль", preferredStyle: .actionSheet)
            
            let cancel = UIAlertAction(title: "Вийти", style: .cancel, handler: nil)
            
            alertController.addAction(cancel)
            
            self.present(alertController, animated: true, completion: nil)
        }
        
    }
    

    @IBAction func firstButtonPressed(_ sender: Any) {
        createAlertController(title: "Зміна кольору фона", messege: "Хочете встановити синій коляр?", style: .alert, color: .blue)
    }
    
    @IBAction func secondButtonPressed(_ sender: Any) {
        createAlertController(title: "Зміна кольору фона", messege: "Хочете встановити червоний коляр?", style: .alert, color: .red)
    }
}

