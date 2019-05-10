//
//  ActivityCell.swift
//  Arbel-IOS
//
//  Created by Simone on 25/04/2019.
//  Copyright © 2019 Mac. All rights reserved.
//

import UIKit

class ActivityCell: UITableViewCell {
    
    @IBOutlet weak var dateLesson: UILabel!
    @IBOutlet weak var argumentName: UILabel!
    
    @IBOutlet weak var hourActivity: UILabel!
    @IBOutlet weak var currentActivity: UILabel!
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
}
