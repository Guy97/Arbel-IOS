//
//  QuestionTableViewCell.swift
//  Arbel-IOS
//
//  Created by Diletta Favaretto on 03/05/2019.
//  Copyright © 2019 Mac. All rights reserved.
//

import UIKit

class QuestionTableViewCell: UITableViewCell {

    
    
    @IBOutlet weak var question: UILabel!
    @IBOutlet weak var questionView: UIView!
    
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
        questionView.layer.cornerRadius = 8
    }

}
