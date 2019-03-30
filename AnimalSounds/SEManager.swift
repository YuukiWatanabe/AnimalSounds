//
//  SEManager.swift
//  WinePiano
//
//  Created by 渡辺雄貴 on 2016/05/30.
//  Copyright © 2016年 渡辺雄貴. All rights reserved.
//

import Foundation

import AVFoundation

class SEManager: NSObject, AVAudioPlayerDelegate {
    var soundArray = [AVAudioPlayer]()
    func sePlay(soundName: String) {
        let path = Bundle.main.bundleURL.appendingPathComponent(soundName)
        var player:AVAudioPlayer!
        do {
            try player = AVAudioPlayer(contentsOf: path)
            soundArray.append(player)
            player.delegate = self
            player.prepareToPlay()
            player.play()
        }
        catch {
            print("エラーです")
        }
    }
    
    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        guard let index: Int = soundArray.index(of: player) else {
            return
        }
        soundArray.remove(at: index)
    }
    
}
