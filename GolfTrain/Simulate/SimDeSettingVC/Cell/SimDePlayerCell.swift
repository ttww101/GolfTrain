//
//  SimDePlayerCell.swift
//  GolfTrain
//
//  Created by Apple on 8/12/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit

class SimDePlayerCell: UITableViewCell, UITextFieldDelegate {
    @IBOutlet weak var playerLabel: UILabel!
    @IBOutlet weak var playerTF: UITextField!
    var indexRow = 0 {
        didSet {
            playerName = "选手\(indexRow)"
            playerLabel.text = "选手\(indexRow)"
        }
    }
    private var playerName = "选手0"
    
    var endTF: ((String) -> Void)?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        playerTF.delegate = self
    }
    
    // MARK: - UITextFieldDelegate
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard let text = textField.text else { return true }
        let count = text.count + string.count - range.length
        return count <= 6
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if let name = textField.text {
            if name != "" { playerName = name }
            endTF?(name)
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
