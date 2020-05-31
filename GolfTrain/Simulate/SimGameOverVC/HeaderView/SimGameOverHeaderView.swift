//
//  SimGameOverHeaderView.swift
//  GolfTrain
//
//  Created by Apple on 8/14/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit

protocol SimGameOverHeaderViewDelegate {
    func toggleSection(header: SimGameOverHeaderView, section: Int)
}

class SimGameOverHeaderView: UITableViewHeaderFooterView {
    var delegate: SimGameOverHeaderViewDelegate?
    var section: Int!
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        
        self.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(clickSecionHeader)))
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func customeInit(title: String, section: Int, delegate: SimGameOverHeaderViewDelegate) {
        self.textLabel?.text = title
        self.section = section
        self.delegate = delegate
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.textLabel?.textColor = .white
        self.contentView.backgroundColor = #colorLiteral(red: 0.1440726172, green: 0.4006781409, blue: 0.03672407666, alpha: 1)
    }
    
    @objc func clickSecionHeader(gesture: UITapGestureRecognizer){
        let cell = gesture.view as! SimGameOverHeaderView
        delegate?.toggleSection(header: self, section: cell.section)
    }

}
