//
//  SimPlayVC.swift
//  BasketballTrain
//
//  Created by Apple on 7/16/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit

struct SimPlayModel {
    var player: [String]
    var hold: [Int]
    var playerCount: Int {
        return player.count
    }
    var holdCount: Int {
        return hold.count
    }
}

enum stopType {
    case homeStop, awayStop, rest
}

class SimPlayVC: UIViewController {
    
    @IBOutlet weak var player1: UILabel!
    @IBOutlet weak var player12: UILabel!
    @IBOutlet weak var player2: UILabel!
    @IBOutlet weak var player22: UILabel!
    @IBOutlet weak var player3: UILabel!
    @IBOutlet weak var player32: UILabel!
    @IBOutlet weak var player4: UILabel!
    @IBOutlet weak var player42: UILabel!
    
    @IBOutlet weak var rule1: UILabel!
    @IBOutlet weak var rule2: UILabel!
    @IBOutlet weak var rule3: UILabel!
    @IBOutlet weak var rule4: UILabel!
    
    @IBOutlet weak var score1: UILabel!
    @IBOutlet weak var score2: UILabel!
    @IBOutlet weak var score3: UILabel!
    @IBOutlet weak var score4: UILabel!
    
    @IBOutlet weak var stepper1: UIStepper!
    @IBOutlet weak var stepper2: UIStepper!
    @IBOutlet weak var stepper3: UIStepper!
    @IBOutlet weak var stepper4: UIStepper!
    
    @IBOutlet weak var holdIn1: UIButton!
    @IBOutlet weak var holdIn2: UIButton!
    @IBOutlet weak var holdIn3: UIButton!
    @IBOutlet weak var holdIn4: UIButton!
    
    @IBOutlet weak var holdLabel: UILabel!
    
    
    @IBOutlet weak var player2View: UIView!
    @IBOutlet weak var player3View: UIView!
    @IBOutlet weak var player4View: UIView!
    @IBOutlet weak var player2View2: UIView!
    @IBOutlet weak var player3View2: UIView!
    @IBOutlet weak var player4view2: UIView!
    
    @IBOutlet weak var restBtn: UIButton!
    @IBOutlet weak var restImg: UIImageView!
    @IBOutlet weak var restView: UIView!
    
    var playerNames: [UILabel] {
        return [player1, player2, player3, player4]
    }
    var playerNames2: [UILabel] {
        return [player12, player22, player32, player42]
    }
    var steppers: [UIStepper] {
        return [stepper1, stepper2, stepper3, stepper4]
    }
    var holdBtn: [UIButton] {
        return [holdIn1, holdIn2, holdIn3, holdIn4]
    }
    
    var ocPlayerView: [UIView] {
        return [player4View, player3View, player2View]
    }
    var ocScore: [UILabel] {
        return [score4, score3, score2]
    }
    var ocPlayerView2: [UIView] {
        return [player4view2, player3View2, player2View2]
    }
    
    var proGRecord: ProGRecordModel!
    var simPlayModel: SimPlayModel!
    var manager: SimPlayManager!
    
    var hold = 0 {
        didSet {
            holdLabel.text = "\(hold)"
        }
    }
    var playRule1 = 0 {
        didSet {
            rule1.text = playRule1.toFormat()
        }
    }
    var playRule2 = 0 {
        didSet {
            rule2.text = playRule2.toFormat()
        }
    }
    var playRule3 = 0 {
        didSet {
            rule3.text = playRule3.toFormat()
        }
    }
    var playRule4 = 0 {
        didSet {
            rule4.text = playRule4.toFormat()
        }
    }
    
    var playScore1 = 0 {
        didSet {
            score1.text = playScore1.toFormat()
        }
    }
    var playScore2 = 0 {
        didSet {
            score2.text = playScore2.toFormat()
        }
    }
    var playScore3 = 0 {
        didSet {
            score3.text = playScore3.toFormat()
        }
    }
    var playScore4 = 0 {
        didSet {
            score4.text = playScore4.toFormat()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setPlayer()
        manager = SimPlayManager(simPlayModel.playerCount, simPlayModel.hold[0])
        restImg.loadGif(name: "cheerup")
        // Do any additional setup after loading the view.
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setDefault()
    }
    
    // MARK: - Default
    func setUI() {
        let tCount = 4 - simPlayModel.playerCount
        if tCount > 0 {
            for i in 0..<tCount {
                ocPlayerView[i].isHidden = true
                ocScore[i].isHidden = true
                ocPlayerView2[i].isHidden = true
            }
        }
    }
    
    func setPlayer() {
        var playerModel = [playerRecordModel]()
        for i in 0..<simPlayModel.playerCount {
            playerNames[i].text = simPlayModel.player[i]
            playerNames2[i].text = simPlayModel.player[i]
            playerModel.append(playerRecordModel(name: simPlayModel.player[i], score: [Int](), toggle: false))
        }
        proGRecord = ProGRecordModel(teams: playerModel, hold: simPlayModel.holdCount)
    }
    
    func setDefault() {
        hold = 1
        for stepper in steppers {
            stepper.minimumValue = Double(simPlayModel.hold[hold - 1])
            stepper.value = Double(simPlayModel.hold[hold - 1])
        }
        playRule1 = simPlayModel.hold[hold - 1]
        playRule2 = simPlayModel.hold[hold - 1]
        playRule3 = simPlayModel.hold[hold - 1]
        playRule4 = simPlayModel.hold[hold - 1]
    }
    
    // MARK: - Game
    func recordGame() {
        for i in 0..<simPlayModel.playerCount {
            proGRecord.teams[i].score.append(manager.playerScore[i])
            switch i {
            case 0:
                playScore1 += manager.playerScore[i]
            case 1:
                playScore2 += manager.playerScore[i]
            case 2:
                playScore3 += manager.playerScore[i]
            case 4:
                playScore4 += manager.playerScore[i]
            default:
                return
            }
        }
    }
    func overGame() {
        guard manager.finish else { return }
        recordGame()
        
        if hold == simPlayModel.holdCount {
            
            let profileStoryboard = UIStoryboard(name: "Main", bundle: nil)
            
            let desVC = profileStoryboard.instantiateViewController(withIdentifier: "SimGameOverVC")
            
            guard let simGameOverVC = desVC as? SimGameOverVC else { return }
            
            simGameOverVC.setParameter(proGRecord, .game)
            
            self.present(simGameOverVC, animated: true) {
                self.navigationController?.popToRootViewController(animated: false)
            }
        } else {
            showStopView(.rest)
        }
        
    }
    
    func showStopView(_ type: stopType) {
        switch type {
        case .homeStop:
            restBtn.setTitle("主队暂停    结束", for: .normal)
        case .awayStop:
            restBtn.setTitle("客队暂停    结束", for: .normal)
        case .rest:
            restBtn.setTitle("休息    结束", for: .normal)
        }
        restView.isHidden = false
    }
    
    @IBAction func stepPressed(_ sender: UIStepper) {
        manager.change(sender.tag, Int(sender.value))
        switch sender.tag {
        case 0:
            playRule1 = Int(sender.value)
        case 1:
            playRule2 = Int(sender.value)
        case 2:
            playRule3 = Int(sender.value)
        case 3:
            playRule4 = Int(sender.value)
        default:
            return
        }
    }
    
    @IBAction func finishPressed(_ sender: UIButton) {
        sender.isEnabled = false
        steppers[sender.tag].isEnabled = false
        manager.playerFinish(sender.tag)
        overGame()
    }
    
    @IBAction func restBtnPressed(_ sender: UIButton) {
        hold += 1
        manager.reset(simPlayModel.hold[hold - 1])
        for stepper in steppers {
            stepper.minimumValue = Double(simPlayModel.hold[hold - 1])
            stepper.value = Double(simPlayModel.hold[hold - 1])
            stepper.isEnabled = true
        }
        playRule1 = simPlayModel.hold[hold - 1]
        playRule2 = simPlayModel.hold[hold - 1]
        playRule3 = simPlayModel.hold[hold - 1]
        playRule4 = simPlayModel.hold[hold - 1]
        for button in holdBtn {
            button.isEnabled = true
        }
        
        restView.isHidden = true
    }
}
