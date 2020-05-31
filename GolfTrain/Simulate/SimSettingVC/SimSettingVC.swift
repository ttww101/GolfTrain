//
//  SimSettingVC.swift
//  BasketballTrain
//
//  Created by Apple on 7/16/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit

class SimSettingVC: UIViewController {
    @IBOutlet weak var playerLabel: UILabel!
    @IBOutlet weak var holdLabel: UILabel!
    
    var player = 1
    var hold = 9
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let desVC = segue.destination as? SimDeSettingVC {
            desVC.player = player
            desVC.hold = hold
        }
    }
    @IBAction func playerStep(_ sender: UIStepper) {
        player = Int(sender.value)
        playerLabel.text = "\(player)"
    }
    
    @IBAction func holdStep(_ sender: UIStepper) {
        hold = Int(sender.value)
        holdLabel.text = "\(hold)"
    }
}
