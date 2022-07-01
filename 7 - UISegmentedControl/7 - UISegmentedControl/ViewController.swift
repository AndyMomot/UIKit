//
//  ViewController.swift
//  7 - UISegmentedControl
//
//  Created by Андрей on 30.06.2022.
//

import UIKit

class ViewController: UIViewController {
    
    var priceLabel = UILabel()
    var imageView = UIImageView()
    var segmentControll = UISegmentedControl()
    
    let imagesArrey = [UIImage(named: "apple"),UIImage(named: "banana"),UIImage(named: "pear")]
    var newOjectArray = ["Яблуко","Банан","Груша"]
    var test = ["Яблуко" : 10,"Банан" : 40,"Груша" : 70]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createPriceLabel()
        createImageView()
        createSegmentController()
        setConstrainrs()
    }
    
    func setConstrainrs() {
        
        [
            priceLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 60),
            priceLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            imageView.topAnchor.constraint(equalTo: priceLabel.bottomAnchor, constant: 60),
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageView.widthAnchor.constraint(equalToConstant: 250),
            imageView.heightAnchor.constraint(equalToConstant: 250),
            
            segmentControll.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 60),
            segmentControll.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            segmentControll.widthAnchor.constraint(equalToConstant: 250),
            segmentControll.heightAnchor.constraint(equalToConstant: 50)
            
        ].forEach({$0.isActive = true})
    }
    
    func createPriceLabel() {
        priceLabel.translatesAutoresizingMaskIntoConstraints = false
        priceLabel.sizeToFit()
        view.addSubview(priceLabel)
    }
    
    func createImageView() {
        imageView.backgroundColor = .gray
        imageView.image = imagesArrey.first!
        imageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(imageView)
    }
    
    func createSegmentController() {
        self.segmentControll = UISegmentedControl(items: newOjectArray)
        segmentControll.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(segmentControll)
        segmentControll.addTarget(self, action: #selector(selectedSegment(target:)), for: .valueChanged)
    }
    
    @objc func selectedSegment(target: UISegmentedControl) {
        if target == self.segmentControll {
            let segmentIndex = target.selectedSegmentIndex
            self.imageView.image = self.imagesArrey[segmentIndex]
            
            let segmentTitle = segmentControll.titleForSegment(at: segmentIndex)
            var price = "0"
            for item in test.keys {
                if segmentTitle == item {
                    price = "\(test[item] ?? 0)"
                }
            }
            priceLabel.text = "\(segmentTitle ?? "Фрукт"): \(price) грн. за кілограм"
        }
    }


}

