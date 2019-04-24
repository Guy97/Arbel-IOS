//
//  StudentCell.swift
//  Arbel-IOS
//
//  Created by Simone on 24/04/2019.
//  Copyright © 2019 Mac. All rights reserved.
//

import UIKit

class StudentCell: UITableViewCell {
    
    @IBOutlet weak var studentName: UILabel!
    @IBOutlet weak var studentView: UIView!
    @IBOutlet weak var saveAll: UIButton!
    
    
    
    

    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
