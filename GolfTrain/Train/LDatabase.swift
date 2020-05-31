//
//  LDatabase.swift
//  BasketballTrain
//
//  Created by Apple on 7/18/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import Foundation

class LDatabase {
    static let instance = LDatabase()
    private init() {}
    
    private let allArray = [
        TrainListModel(videoImg: "part1", durationLbl: 4, videoTitle: "高尔夫如何推杆", videoDescription: "高尔夫教学Putter Fitting Tips", intensity: "入门", videoID: "FrWbngIdaNI", category: .part, actionModel: [
            TrainActionModel(youtubeTime: 66, stopTime: 60, restTime: 3, timesDescription: 60, actionDescription: "握法"),
            TrainActionModel(youtubeTime: 127, stopTime: 36, restTime: 3, timesDescription: 60, actionDescription: "站姿"),
            TrainActionModel(youtubeTime: 165, stopTime: 118, restTime: 3, timesDescription: 120, actionDescription: "瞄球")
            ]),
        TrainListModel(videoImg: "part2", durationLbl: 5, videoTitle: "高球教室", videoDescription: "吕伟智老师来教学推杆", intensity: "入门", videoID: "hBfrCJxHHaM", category: .part, actionModel: [
            TrainActionModel(youtubeTime: 270, stopTime: 102, restTime: 5, timesDescription: 120, actionDescription: "练习技巧1"),
            TrainActionModel(youtubeTime: 373, stopTime: 111, restTime: 5, timesDescription: 120, actionDescription: "练习技巧2"),
            TrainActionModel(youtubeTime: 485, stopTime: 60, restTime: 5, timesDescription: 60, actionDescription: "练习技巧3")
            ]),
        TrainListModel(videoImg: "part3", durationLbl: 4, videoTitle: "推杆！", videoDescription: "自然推杆法", intensity: "入门", videoID: "BUFvdV1lnY0", category: .part, actionModel: [
            TrainActionModel(youtubeTime: 15, stopTime: 27, restTime: 5, timesDescription: 60, actionDescription: "基本握法"),
            TrainActionModel(youtubeTime: 58, stopTime: 16, restTime: 5, timesDescription: 30, actionDescription: "动作"),
            TrainActionModel(youtubeTime: 133, stopTime: 45, restTime: 3, timesDescription: 90, actionDescription: "适合自己姿势"),
            TrainActionModel(youtubeTime: 180, stopTime: 27, restTime: 3, timesDescription: 60, actionDescription: "摆动练习")
            ]),
        TrainListModel(videoImg: "teeshot1", durationLbl: 3, videoTitle: "一號木桿開球", videoDescription: "高球武功秘笈", intensity: "入门", videoID: "F8TYxS1hmpE", category: .teeshot, actionModel: [
            TrainActionModel(youtubeTime: 56, stopTime: 35, restTime: 5, timesDescription: 60, actionDescription: "开球动作"),
            TrainActionModel(youtubeTime: 141, stopTime: 23, restTime: 5, timesDescription: 60, actionDescription: "开球技巧"),
            TrainActionModel(youtubeTime: 197, stopTime: 60, restTime: 5, timesDescription: 60, actionDescription: "连续动作")
            ]),
        TrainListModel(videoImg: "teeshot2", durationLbl: 4, videoTitle: "提升一号木杆开球距离", videoDescription: "优化发力提升挥杆速度", intensity: "入门", videoID: "Vc3PcEQoK9k", category: .teeshot, actionModel: [
            TrainActionModel(youtubeTime: 15, stopTime: 55, restTime: 5, timesDescription: 55, actionDescription: "挥杆练习"),
            TrainActionModel(youtubeTime: 118, stopTime: 60, restTime: 5, timesDescription: 60, actionDescription: "手部速度"),
            TrainActionModel(youtubeTime: 185, stopTime: 120, restTime: 3, timesDescription: 120, actionDescription: "手部配合")
            ]),
        TrainListModel(videoImg: "teeshot3", durationLbl: 3, videoTitle: "高球教室", videoDescription: "三种常见错误概念", intensity: "入门", videoID: "xRq25dLAEws", category: .teeshot, actionModel: [
            TrainActionModel(youtubeTime: 54, stopTime: 60, restTime: 5, timesDescription: 60, actionDescription: "错误1"),
            TrainActionModel(youtubeTime: 126, stopTime: 60, restTime: 5, timesDescription: 60, actionDescription: "错误2"),
            TrainActionModel(youtubeTime: 193, stopTime: 50, restTime: 5, timesDescription: 60, actionDescription: "错误3")
            ]),
        TrainListModel(videoImg: "swing1", durationLbl: 3, videoTitle: "挥杆技巧", videoDescription: "高尔夫球入门", intensity: "入门", videoID: "K0gAPAmYRH4", category: .swing, actionModel: [
            TrainActionModel(youtubeTime: 32, stopTime: 28, restTime: 3, timesDescription: 60, actionDescription: "动作1"),
            TrainActionModel(youtubeTime: 61, stopTime: 27, restTime: 3, timesDescription: 60, actionDescription: "动作2"),
            TrainActionModel(youtubeTime: 89, stopTime: 21, restTime: 3, timesDescription: 60, actionDescription: "动作3")
            ]),
        TrainListModel(videoImg: "swing2", durationLbl: 3, videoTitle: "挥杆系列", videoDescription: "如何做好全挥杆", intensity: "入门", videoID: "bY1kulI0Xxw", category: .swing, actionModel: [
            TrainActionModel(youtubeTime: 10, stopTime: 20, restTime: 3, timesDescription: 60, actionDescription: "动作解析"),
            TrainActionModel(youtubeTime: 97, stopTime: 60, restTime: 3, timesDescription: 60, actionDescription: "连续动作")
            ]),
        TrainListModel(videoImg: "swing3", durationLbl: 6, videoTitle: "挥杆三部曲", videoDescription: "高球武功秘笈", intensity: "入门", videoID: "747jfLd_qMw", category: .swing, actionModel: [
            TrainActionModel(youtubeTime: 43, stopTime: 120, restTime: 3, timesDescription: 120, actionDescription: "要点1"),
            TrainActionModel(youtubeTime: 165, stopTime: 90, restTime: 3, timesDescription: 90, actionDescription: "要点2"),
            TrainActionModel(youtubeTime: 260, stopTime: 160, restTime: 3, timesDescription: 160, actionDescription: "要点3")
            ])
    ]
    
    private let partArray = [
        TrainListModel(videoImg: "part1", durationLbl: 4, videoTitle: "高尔夫如何推杆", videoDescription: "高尔夫教学Putter Fitting Tips", intensity: "入门", videoID: "FrWbngIdaNI", category: .part, actionModel: [
            TrainActionModel(youtubeTime: 66, stopTime: 60, restTime: 3, timesDescription: 60, actionDescription: "握法"),
            TrainActionModel(youtubeTime: 127, stopTime: 36, restTime: 3, timesDescription: 60, actionDescription: "站姿"),
            TrainActionModel(youtubeTime: 165, stopTime: 118, restTime: 3, timesDescription: 120, actionDescription: "瞄球")
            ]),
        TrainListModel(videoImg: "part2", durationLbl: 5, videoTitle: "高球教室", videoDescription: "吕伟智老师来教学推杆", intensity: "入门", videoID: "hBfrCJxHHaM", category: .part, actionModel: [
            TrainActionModel(youtubeTime: 270, stopTime: 102, restTime: 5, timesDescription: 120, actionDescription: "练习技巧1"),
            TrainActionModel(youtubeTime: 373, stopTime: 111, restTime: 5, timesDescription: 120, actionDescription: "练习技巧2"),
            TrainActionModel(youtubeTime: 485, stopTime: 60, restTime: 5, timesDescription: 60, actionDescription: "练习技巧3")
            ]),
        TrainListModel(videoImg: "part3", durationLbl: 4, videoTitle: "推杆！", videoDescription: "自然推杆法", intensity: "入门", videoID: "BUFvdV1lnY0", category: .part, actionModel: [
            TrainActionModel(youtubeTime: 15, stopTime: 27, restTime: 5, timesDescription: 60, actionDescription: "基本握法"),
            TrainActionModel(youtubeTime: 58, stopTime: 16, restTime: 5, timesDescription: 30, actionDescription: "动作"),
            TrainActionModel(youtubeTime: 133, stopTime: 45, restTime: 3, timesDescription: 90, actionDescription: "适合自己姿势"),
            TrainActionModel(youtubeTime: 180, stopTime: 27, restTime: 3, timesDescription: 60, actionDescription: "摆动练习")
            ])
    ]
    
    private let teeShotArray = [
        TrainListModel(videoImg: "teeshot1", durationLbl: 3, videoTitle: "一號木桿開球", videoDescription: "高球武功秘笈", intensity: "入门", videoID: "F8TYxS1hmpE", category: .teeshot, actionModel: [
            TrainActionModel(youtubeTime: 56, stopTime: 35, restTime: 5, timesDescription: 60, actionDescription: "开球动作"),
            TrainActionModel(youtubeTime: 141, stopTime: 23, restTime: 5, timesDescription: 60, actionDescription: "开球技巧"),
            TrainActionModel(youtubeTime: 197, stopTime: 60, restTime: 5, timesDescription: 60, actionDescription: "连续动作")
            ]),
        TrainListModel(videoImg: "teeshot2", durationLbl: 4, videoTitle: "提升一号木杆开球距离", videoDescription: "优化发力提升挥杆速度", intensity: "入门", videoID: "Vc3PcEQoK9k", category: .teeshot, actionModel: [
            TrainActionModel(youtubeTime: 15, stopTime: 55, restTime: 5, timesDescription: 55, actionDescription: "挥杆练习"),
            TrainActionModel(youtubeTime: 118, stopTime: 60, restTime: 5, timesDescription: 60, actionDescription: "手部速度"),
            TrainActionModel(youtubeTime: 185, stopTime: 120, restTime: 3, timesDescription: 120, actionDescription: "手部配合")
            ]),
        TrainListModel(videoImg: "teeshot3", durationLbl: 3, videoTitle: "高球教室", videoDescription: "三种常见错误概念", intensity: "入门", videoID: "xRq25dLAEws", category: .teeshot, actionModel: [
            TrainActionModel(youtubeTime: 54, stopTime: 60, restTime: 5, timesDescription: 60, actionDescription: "错误1"),
            TrainActionModel(youtubeTime: 126, stopTime: 60, restTime: 5, timesDescription: 60, actionDescription: "错误2"),
            TrainActionModel(youtubeTime: 193, stopTime: 50, restTime: 5, timesDescription: 60, actionDescription: "错误3")
            ])
    ]
    
    private let swingArray = [
        TrainListModel(videoImg: "swing1", durationLbl: 3, videoTitle: "挥杆技巧", videoDescription: "高尔夫球入门", intensity: "入门", videoID: "K0gAPAmYRH4", category: .swing, actionModel: [
            TrainActionModel(youtubeTime: 32, stopTime: 28, restTime: 3, timesDescription: 60, actionDescription: "动作1"),
            TrainActionModel(youtubeTime: 61, stopTime: 27, restTime: 3, timesDescription: 60, actionDescription: "动作2"),
            TrainActionModel(youtubeTime: 89, stopTime: 21, restTime: 3, timesDescription: 60, actionDescription: "动作3")
            ]),
        TrainListModel(videoImg: "swing2", durationLbl: 3, videoTitle: "挥杆系列", videoDescription: "如何做好全挥杆", intensity: "入门", videoID: "bY1kulI0Xxw", category: .swing, actionModel: [
            TrainActionModel(youtubeTime: 10, stopTime: 20, restTime: 3, timesDescription: 60, actionDescription: "动作解析"),
            TrainActionModel(youtubeTime: 97, stopTime: 60, restTime: 3, timesDescription: 60, actionDescription: "连续动作")
            ]),
        TrainListModel(videoImg: "swing3", durationLbl: 6, videoTitle: "挥杆三部曲", videoDescription: "高球武功秘笈", intensity: "入门", videoID: "747jfLd_qMw", category: .swing, actionModel: [
            TrainActionModel(youtubeTime: 43, stopTime: 120, restTime: 3, timesDescription: 120, actionDescription: "要点1"),
            TrainActionModel(youtubeTime: 165, stopTime: 90, restTime: 3, timesDescription: 90, actionDescription: "要点2"),
            TrainActionModel(youtubeTime: 260, stopTime: 160, restTime: 3, timesDescription: 160, actionDescription: "要点3")
            ])
    ]
    
    func getData(_ type: Int) -> [TrainListModel] {
        switch type {
        case 0:
            return allArray
        case 1:
            return partArray
        case 2:
            return teeShotArray
        case 3:
            return swingArray
        default:
            return allArray
        }
    }
}
