//
//  ContactTableViewCell.swift
//  Arbel-IOS
//
//  Created by Simone on 20/04/2019.
//  Copyright © 2019 Mac. All rights reserved.
//

import UIKit

class ContactTableViewCell: UITableViewCell {
    
    lazy var backView: UIView = {  //chiedere a Luca la particolarità delle variabili Lazy
        let view = UIView(frame: CGRect(x: 0, y: 0, width: self.frame.width, height: 50))
        return view
    }()
    
    lazy var lbl: UILabel = {
        let lbl = UILabel(frame: CGRect(x: 40,  y: 10, width: self.frame.width - 80, height: 30))
        UIFont.systemFont(ofSize: 10)
        return lbl
    }()
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        addSubview(backView)
        backView.addSubview(lbl)
    }
}
