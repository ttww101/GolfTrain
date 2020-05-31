//
//  SimDeSettingVC.swift
//  GolfTrain
//
//  Created by Apple on 8/12/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit

class SimDeSettingVC: UIViewController {
    private let cellIdenfifier1 = String(describing: SimDePlayerCell.self)
    private let cellIdenfifier2 = String(describing: SimDeGolfCell.self)
    private let cellIdenfifier3 = String(describing: SimDeStartCell.self)
    @IBOutlet weak var settingTable: UITableView!
    
    var player = 1
    var hold = 9
    
    var playerList = [String]()
    var holdList = [Int]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cleanData()
        settingTable.dataSource = self
        // Do any additional setup after loading the view.
    }
    override func viewDidAppear(_ animated: Bool) {
        settingTable.reloadData()
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func cleanData() {
        for i in 1...player {
            playerList.append("选手\(i)")
        }
        for i in 0..<hold {
            holdList.append(-3)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let desVC = segue.destination as? SimPlayVC {
            desVC.simPlayModel = SimPlayModel(player: playerList, hold: holdList)
        }
    }

}

extension SimDeSettingVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return "选手设定"
        case 1:
            return "标准杆设定"
        default:
            return ""
        }
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return self.playerList.count
        case 1:
            return self.holdList.count
        default:
            return 1
        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let index = indexPath.row
        
        switch indexPath.section {
        case 0:
            guard let cell = settingTable.dequeueReusableCell(withIdentifier:
                cellIdenfifier1) as? SimDePlayerCell
                else {return SimDePlayerCell()}
            
            cell.indexRow = index + 1
            cell.endTF = {[weak self] (name) in
                self?.playerList[index] = name
            }
            
            return cell
            
        case 1:
            guard let cell = settingTable.dequeueReusableCell(withIdentifier:
                cellIdenfifier2) as? SimDeGolfCell
                else {return SimDeGolfCell()}
            
            cell.indexLabel.text = "\(index + 1)"
            cell.golfValue = {[weak self] (golf) in
                self?.holdList[index] = golf
            }
            
            return cell
            
        case 2:
            guard let cell = settingTable.dequeueReusableCell(withIdentifier:
                cellIdenfifier3) as? SimDeStartCell
                else {return SimDeStartCell()}
            
            return cell
            
        default:
            return UITableViewCell()
        }
    }
}
