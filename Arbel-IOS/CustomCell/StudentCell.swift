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
    @IBOutlet weak var averageUser: UILabel!
    @IBOutlet weak var absenceUser: UILabel!
    @IBOutlet weak var noteUser: UILabel!
    @IBOutlet weak var userPicture: UIImageView!
    @IBOutlet weak var checkButton: UIButton!
    @IBOutlet weak var saveAll: UIButton!
    @IBOutlet weak var argumentName: UILabel!
    
    
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
}
