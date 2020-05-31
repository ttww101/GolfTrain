//
//  ProfileGameRecordVC.swift
//  BasketballTrain
//
//  Created by Apple on 7/12/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit

class ProfileGameRecordVC: UIViewController {
    private let cellIdenfifier = String(describing: ProGRecordCell.self)
    @IBOutlet weak var recordTable: UITableView!
    
    var listData = [ProGRecordModel]()
    let manager = ProGRecordManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        recordTable.dataSource = self
        recordTable.delegate = self
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        getListData()
    }
    
    func getListData() {
        manager.getGameRecord {[weak self] (data, error) in
            guard error == nil else { return }
            guard let data = data else { return }
            self?.listData = data
            if data.count > 0 {
                self?.recordTable.isHidden = false
                self?.recordTable.reloadData()
            }
        }
    }

}

extension ProfileGameRecordVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let data = listData[indexPath.row]
        guard let cell = recordTable.dequeueReusableCell(withIdentifier:
            cellIdenfifier) as? ProGRecordCell
            else { return ProGRecordCell()}
        cell.holdLabel.text = "\(data.hold)"
        let win = data.teams.max { $0.total > $1.total }
        cell.winnerLabel.text = win?.name
        cell.scoreLabel.text = win?.total.toFormat()
        
        return cell
    }
    
    
}

extension ProfileGameRecordVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let data = listData[indexPath.row]
        let profileStoryboard = UIStoryboard(name: "Main", bundle: nil)
        
        let desVC = profileStoryboard.instantiateViewController(withIdentifier: "SimGameOverVC")
        
        guard let simGameOverVC = desVC as? SimGameOverVC else { return }
        
        simGameOverVC.setParameter(data, .profile)
        
        self.navigationController?.pushViewController(simGameOverVC, animated: true)
    }
}
