//
//  SingleStudentDetailCell.swift
//  Arbel-IOS
//
//  Created by Simone on 25/04/2019.
//  Copyright © 2019 Mac. All rights reserved.
//

import UIKit

class SingleStudentDetailCell: UITableViewCell {
    
    @IBOutlet weak var textResult: UILabel!
    @IBOutlet weak var testDate: UILabel!
    @IBOutlet weak var textAbsence: UILabel!
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
}
