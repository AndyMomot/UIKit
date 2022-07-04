//
//  ViewController.swift
//  10 - UINavigationViewController part 2
//
//  Created by Андрей on 04.07.2022.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        createLeftBatSwitchItem()
        createTitleViewImage()
        //createRightBarButtonItem()
        let items = ["0", "1"]
        createRightBarSegmrntItem(items)
    }

    // MARK: - Methods
    fileprivate func createLeftBatSwitchItem() {
        let switcher = UISwitch()
        switcher.isOn = true
        switcher.addTarget(self, action: #selector(leftBarButtonItemPressed(param:)), for: .valueChanged)
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: switcher)
    }
    
    fileprivate func createTitleViewImage() {
        let image = UIImage(named: "apple")
        let imageView = UIImageView(image: image)
        imageView.contentMode = .scaleAspectFit
        imageView.frame = CGRect(x: 0, y: 0, width: 100, height: 40)
        
        self.navigationItem.titleView = imageView
    }
    
    fileprivate func createRightBarButtonItem() {
        // Creare right bar button item
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .camera, target: self, action: #selector(rightBarButtonItemPressed(param:)))
    }
    
    fileprivate func createRightBarSegmrntItem(_ items: [String]) {
        let segmentController = UISegmentedControl(items: items)
        // segmentController.isMomentary = true
        segmentController.addTarget(self, action: #selector(rightBarSegmentItemPressed(param:)), for: .valueChanged)
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(customView: segmentController)
    }
    
    // MARK: - @objc Methods
    @objc func leftBarButtonItemPressed(param: UISwitch) {
        if param.isOn {
            UIView.animate(withDuration: 0.3) {
                self.view.backgroundColor = .white
            }
        } else {
            UIView.animate(withDuration: 0.3) {
                self.view.backgroundColor = .lightGray
            }
        }
    }
    
    @objc func rightBarButtonItemPressed(param: UIBarButtonItem) {
        print("Button clicked")
    }
    
    @objc func rightBarSegmentItemPressed(param: UISegmentedControl) {
        //let rundonColor = UIColor
        
        switch param.selectedSegmentIndex {
        case 0 :
            self.view.backgroundColor = .green
        
        case 1 :
            self.view.backgroundColor = .yellow
            
        default:
            return
        }
    }
}

