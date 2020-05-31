//
//  SimGameOverVC.swift
//  BasketballTrain
//
//  Created by Apple on 7/17/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit

enum SimGameOverStyle {
    case profile, game
}

class SimGameOverVC: UIViewController {
    private let cellIdenfifier1 = String(describing: SimOverTitle.self)
    private let cellIdenfifier2 = String(describing: SimOverDetail.self)
    private let cellIdenfifier3 = String(describing: SimOverBtnCell.self)
    @IBOutlet weak var simTable: UITableView!
    
    var proGRecordModel: ProGRecordModel!
    var style: SimGameOverStyle!
    var sentions: Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        sentions = 2 + proGRecordModel.teams.count
        cleanData()
        // Do any additional setup after loading the view.
    }
    
    func setParameter(_ model: ProGRecordModel, _ style: SimGameOverStyle) {
        self.proGRecordModel = model
        self.style = style
    }
    
    func cleanData() {
        
    }
    

    @IBAction func savePressed(_ sender: UIButton) {
        if LCManager.shared.objectId != "" {
            LCManager.shared.saveGameRecord(self.proGRecordModel.teams, completion: { (success, error) in
                self.dismiss(animated: true, completion: nil)
            })
        }
    }
    
    @IBAction func cancelPressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
}

extension SimGameOverVC: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return sentions
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        case (sentions - 1):
            switch style! {
            case .game:
                return 1
            default:
                return 0
            }
        default:
            return proGRecordModel.teams[0].score.count
        }
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        switch section {
        case 0:
            return 0
        case (sentions - 1):
            return 0
        default:
            return 64
        }
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0:
            return 70
        case (sentions - 1):
            return 70
        default:
            if proGRecordModel.teams[indexPath.section - 1].toggle {
                return 51
            } else {
                return 0
            }
        }
    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 2
    }
}

extension SimGameOverVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        switch section {
        case 0:
            return nil
        case (sentions - 1):
            return nil
        default:
            let view = SimGameOverHeaderView()
            var s = ""
            if proGRecordModel.teams[section - 1].total > 0 {
                s = "+\(proGRecordModel.teams[section - 1].total)"
            } else {
                s = "\(proGRecordModel.teams[section - 1].total)"
            }
            view.customeInit(title: "\(proGRecordModel.teams[section - 1].name)        \(s)", section: section, delegate: self)
            return view
        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            
            guard let cell = simTable.dequeueReusableCell(withIdentifier:
                cellIdenfifier1) as? SimOverTitle
                else {return SimOverTitle()}
            let dataMax = proGRecordModel.teams.max { $0.total > $1.total }
            cell.winnerLabel.text = dataMax?.name
            
            return cell
            
        case (sentions - 1):
            
            guard let cell = simTable.dequeueReusableCell(withIdentifier:
                cellIdenfifier3) as? SimOverBtnCell
                else {return SimOverBtnCell()}
            
            return cell
            
        default:
            
            guard let cell = simTable.dequeueReusableCell(withIdentifier:
                cellIdenfifier2) as? SimOverDetail
                else {return SimOverDetail()}
            cell.holdLabel.text = "第 \(indexPath.row + 1) 洞"
            cell.holdScore.text = "\(proGRecordModel.teams[indexPath.section - 1].score[indexPath.row].toFormat())"
            
            return cell
        }
    }
}

extension SimGameOverVC: SimGameOverHeaderViewDelegate {
    func toggleSection(header: SimGameOverHeaderView, section: Int) {
        proGRecordModel.teams[section - 1].toggle = !proGRecordModel.teams[section - 1].toggle
        simTable.beginUpdates()
        for i in 0..<proGRecordModel.teams[section - 1].score.count {
            simTable.reloadRows(at: [IndexPath(row: i, section: section)], with: .fade)
        }
        simTable.endUpdates()
    }
}
