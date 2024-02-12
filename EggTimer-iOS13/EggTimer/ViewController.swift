//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    
    @IBOutlet weak var titleLabel: UILabel!
    
        
    @IBOutlet weak var progressBar: UIProgressView!
    
    let eggTimes = ["Soft" : 30, "Medium" : 50, "Hard" : 70 ]
    
    var player: AVAudioPlayer?
    var counter : Int = 60
    var totalTime = 0
    var secondsPassed = 0
    var timer = Timer()
    
    @objc func updateCounter() {
        //example functionality
        if secondsPassed < totalTime {
            secondsPassed += 1
            progressBar.progress = Float(secondsPassed)/Float(totalTime)
        }else{
            timer.invalidate()
            titleLabel.text = "DONE!"
            let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
            player = try! AVAudioPlayer(contentsOf: url!)
        player?.play()
        }
    }
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        
        timer.invalidate()
        
               
        let hardness = sender.currentTitle!
        
        titleLabel.text =  hardness
        
        totalTime = eggTimes[hardness]!
        secondsPassed = 0
        progressBar.progress = 0.0
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateCounter), userInfo: nil, repeats: true)
    }
    
}
