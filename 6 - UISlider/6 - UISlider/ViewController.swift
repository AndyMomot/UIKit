//
//  ViewController.swift
//  6 - UISlider
//
//  Created by Андрей on 29.06.2022.
//

import UIKit
// Framework for working with audio and video
import AVFoundation

class ViewController: UIViewController {
    @IBOutlet weak var playButton: UIButton!
    
    var isPlaying = false {
        didSet {
            if isPlaying {
                UIView.animate(withDuration: 0.3) {
                    self.playButton.setImage(UIImage(named: "pause"), for: .normal)
                }
                player.play()
            } else {
                UIView.animate(withDuration: 0.3) {
                    self.playButton.setImage(UIImage(named: "play"), for: .normal)
                }
                player.pause()
            }
        }
    }

    var player = AVAudioPlayer()
    
    let imageView: UIImageView = {
        let image = UIImage(named: "audioLogo")
        let imageView = UIImageView(image: image)
        imageView.backgroundColor = .gray
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let volumLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    @IBOutlet weak var volumSlider: UISlider!
    
    let slider: UISlider = {
        let slider = UISlider()
        slider.minimumValue = 0.0
        slider.maximumValue = 100.0
        slider.addTarget(self, action: #selector(changeSlider(sender:)), for: .valueChanged)
        slider.translatesAutoresizingMaskIntoConstraints = false
        return slider
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createAudioPlayer()
        playButton.layer.cornerRadius = 45
        view.addSubview(imageView)
        createVolumSlider()
        view.addSubview(volumSlider)
        volumLabel.text = String(Int(volumSlider.value))
        view.addSubview(volumLabel)
        view.addSubview(slider)
        createAnchors()
    }
    
    func createAnchors() {
        imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 250).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 250).isActive = true
        imageView.bottomAnchor.constraint(equalTo: slider.topAnchor, constant: -50).isActive = true
        
        volumLabel.topAnchor.constraint(equalTo: imageView.topAnchor).isActive = true
        volumLabel.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 10).isActive = true
        volumLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10).isActive = true
        volumLabel.heightAnchor.constraint(equalToConstant: 32).isActive = true

        volumSlider.centerYAnchor.constraint(equalTo: imageView.centerYAnchor).isActive = true
        volumSlider.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 10).isActive = true
        volumSlider.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10).isActive = true
        
        slider.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        slider.widthAnchor.constraint(equalToConstant: view.frame.width - 40).isActive = true
        slider.heightAnchor.constraint(equalToConstant: 23).isActive = true
        slider.bottomAnchor.constraint(equalTo: playButton.topAnchor, constant: -20).isActive = true
    }
    
    @objc func changeSlider(sender: UISlider) {
        if sender == slider {
            self.player.currentTime = TimeInterval(sender.value)
        }
    }
    
    @objc func changeVolum(sender: UISlider) {
        self.player.volume = volumSlider.value
        volumLabel.text = String(Int(volumSlider.value))
    }
    
    @IBAction func playButtonPressed(_ sender: Any) {
        UIView.animate(withDuration: 0.3) {
            self.playButton.layer.borderWidth = 1
            self.playButton.layer.borderColor = UIColor.black.cgColor
            
            self.playButton.layer.borderWidth = 0
            self.playButton.layer.borderColor = UIColor.clear.cgColor
        }
        isPlaying = !isPlaying
    }
    
    func createVolumSlider() {
        volumSlider.transform = CGAffineTransform(rotationAngle: CGFloat(Double.pi / -2))
        volumSlider.minimumValue = 0.0
        volumSlider.maximumValue = 100.0
        volumSlider.translatesAutoresizingMaskIntoConstraints = false
        volumSlider.addTarget(self, action: #selector(changeVolum(sender:)), for: .valueChanged)
    }
    
    func createAudioPlayer() {
        // Обработка ошибок через do / catch
        do {
            // Путь к аудио файлу
            if let audioPath = Bundle.main.path(forResource: "Coldplay", ofType: "mp3") {
                try player = AVAudioPlayer(contentsOf: URL(fileURLWithPath: audioPath))
                self.slider.maximumValue = Float(player.duration)
            }
        } catch {
            print("ErroR", error.localizedDescription)
        }
        //self.player.play()
    }

}

