//
//  ViewController.swift
//  WinePiano
//
//  Created by 渡辺雄貴 on 2016/05/29.
//  Copyright © 2016年 渡辺雄貴. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var player:AVAudioPlayer!
    var soundManager = SEManager()
    
    @IBAction func wineTapped(sender: UIButton) {
        var sound :String = ""
        
        var transform:CGAffineTransform = CGAffineTransform()
        let duration:Double = 0.1
        
        switch sender.tag {
        case 1:
            sound = "sheep.mp3"
            transform = CGAffineTransform(translationX: 0, y: -20)
        case 2:
            sound = "dog.mp3"
            transform = CGAffineTransform(translationX: 0, y: -20)
        case 3:
            sound = "elephant.mp3"
            transform = CGAffineTransform(translationX: 0, y: -20)
        case 4:
            sound = "chicken.mp3"
            transform = CGAffineTransform(translationX: 0, y: -20)
        case 5:
            sound = "lion.mp3"
            transform = CGAffineTransform(translationX: 0, y: -20)
        default:
            print("どのボタンでもない")
        }
        soundManager.sePlay(soundName: sound)
        
        UIView.animate(withDuration: duration, animations: { () -> Void in
            sender.transform = transform
            })
        { (Bool) -> Void in
            UIView.animate(withDuration: duration, animations: { () -> Void in
                sender.transform = CGAffineTransform(translationX: 0, y: 0)
                })
        }
    }

    func play (soundName: String) {
        let url = Bundle.main.bundleURL.appendingPathComponent(soundName)
        
        do {
            try player = AVAudioPlayer(contentsOf: url)
            player.numberOfLoops = -1
            player.prepareToPlay()
            player.play()
        }
        catch {
            print("エラーです")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        play(soundName: "BGM.mp3")
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

