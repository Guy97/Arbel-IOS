//
//  QuestionTableViewCell.swift
//  Arbel-IOS
//
//  Created by Diletta Favaretto on 03/05/2019.
//  Copyright © 2019 Mac. All rights reserved.
//

import UIKit

class QuestionTableViewCell: UITableViewCell {
    @IBOutlet weak var questions: UILabel!
    @IBOutlet weak var questionBtn: UIButton!
    @IBOutlet weak var domanda: UILabel!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var question: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
