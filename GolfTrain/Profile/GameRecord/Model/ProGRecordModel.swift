//
//  ProGRecordModel.swift
//  BasketballTrain
//
//  Created by Apple on 7/15/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import Foundation

struct ProGRecordModel {
    var teams: [playerRecordModel]
    var hold: Int
}

struct playerRecordModel: Codable {
    var name: String
    var score: [Int]
    var toggle: Bool = false
    var total: Int {
        var total = 0
        for score in score {
            total += score
        }
        return total
    }
}
