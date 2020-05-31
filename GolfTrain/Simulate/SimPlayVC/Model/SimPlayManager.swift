//
//  SimPlayManager.swift
//  BasketballTrain
//
//  Created by Apple on 7/17/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import Foundation

class SimPlayManager {
    private var player: Int
    private var rule: Int
    private var finishs: [Bool]!
    var finish = false
    var playerScore: [Int]!
    
    init(_ player: Int, _ rule: Int) {
        self.player = player
        self.rule = rule
        reset(rule)
    }
    
    func reset(_ rule: Int) {
        playerScore = [Int]()
        finishs = [Bool]()
        for i in 0..<player {
            playerScore.append(rule)
            finishs.append(false)
        }
        finish = false
    }
    
    func change(_ player: Int, _ score: Int) {
        playerScore[player] = score
    }
    
    func playerFinish(_ player: Int) {
        finishs[player] = true
        checkAll()
    }
    
    private func checkAll() {
        for play in finishs {
            if !play {
                return
            }
        }
        finish = true
    }
    
}
