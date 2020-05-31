//
//  SimDeGolfCell.swift
//  GolfTrain
//
//  Created by Apple on 8/12/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit

class SimDeGolfCell: UITableViewCell {
    @IBOutlet weak var indexLabel: UILabel!
    @IBOutlet weak var ruleLabel: UILabel!
    
    var golfValue: ((Int) -> Void)?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    @IBAction func stepPressed(_ sender: UIStepper) {
        ruleLabel.text = "\(Int(sender.value))"
        golfValue?(-Int(sender.value))
    }
    
}
