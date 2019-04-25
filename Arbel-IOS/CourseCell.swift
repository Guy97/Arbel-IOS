//
//  CourseCell.swift
//  Arbel-IOS
//
//  Created by Simone on 24/04/2019.
//  Copyright © 2019 Mac. All rights reserved.
//

import UIKit

class CourseCell: UITableViewCell {
    
    @IBOutlet weak var year: UILabel!
    @IBOutlet weak var courseName: UILabel!
    @IBOutlet weak var separatorLine: UIImageView!
    @IBOutlet weak var goArrow: UIImageView!
    @IBOutlet weak var courseView: UIView!
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
}
