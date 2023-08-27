//
//  ViewController.swift
//  TimerApp
//
//  Created by 김선규 on 2023/08/27.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    @IBOutlet weak var mainLable: UILabel!
    @IBOutlet weak var slider: UISlider!

    weak var timer: Timer?
    
    var number: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
    }
    
    func configureUI() {
        mainLable.text = "초를 선택하세요"
        slider.setValue(0.5, animated: true)
    }
    
    @IBAction func sliderChanged(_ sender: UISlider) {
        number = Int(sender.value * 60)
        mainLable.text = "\(number) 초"
    }
    
    @IBAction func startButtonTapped(_ sender: UIButton) {
        timer?.invalidate()
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true, block: { [self] _ in
            if number > 0 {
                number -= 1
                slider.value = Float(number) / Float(60)
                mainLable.text = "\(number) 초"
            } else {
                number = 0
                mainLable.text = "초를 선택하세요"
                timer?.invalidate()
                AudioServicesPlayAlertSound(SystemSoundID(1322))
            }
        })
    }
    
    @IBAction func resetButtonTapped(_ sender: UIButton) {
        mainLable.text = "초를 선택하세요"
        slider.setValue(0.5, animated: true)
        number = 0
        timer?.invalidate()
    }
}

