//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let eggTimes = ["Soft": 3, "Medium": 4, "Hard": 7]
    var hardness: String = ""
    var secondsRemaining = 60
    var timer = Timer()

    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var progressBar: UIProgressView!
    @IBAction func hardnessSelected(_ sender: UIButton) {
        
        timer.invalidate()
        
        hardness = sender.currentTitle!
        
        secondsRemaining = eggTimes[hardness]!
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }
    
    @objc func updateTimer(){
        let value = Float(1 - Float(secondsRemaining) / Float(eggTimes[hardness]!))
        progressBar.progress = value
        if secondsRemaining > 0 {
            titleLabel.text = "\(secondsRemaining) Remaining"
            secondsRemaining -= 1
        }else{
            timer.invalidate()
            titleLabel.text = "Done"
        }


        
    }
}
