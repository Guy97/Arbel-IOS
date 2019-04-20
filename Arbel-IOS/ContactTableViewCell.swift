//
//  ContactTableViewCell.swift
//  Arbel-IOS
//
//  Created by Simone on 20/04/2019.
//  Copyright © 2019 Mac. All rights reserved.
//

import UIKit

class ContactTableViewCell: UITableViewCell {
    
    lazy var backView: UIView = {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: self.frame.width, height: 50))
        return view
    }()
    
    lazy var lbl: UILabel = {
        let lbl = UILabel(frame: CGRect(x: 60, y: 10, width: self.frame.width - 80, height: 30))
        return lbl
        
    }()

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        addSubview(backView)
        backView.addSubview(lbl)

        // Configure the view for the selected state
    }

}
