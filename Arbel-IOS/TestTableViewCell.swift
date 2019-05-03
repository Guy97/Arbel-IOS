//
//  TestTableViewCell.swift
//  Arbel-IOS
//
//  Created by Diletta Favaretto on 03/05/2019.
//  Copyright © 2019 Mac. All rights reserved.
//

import UIKit

class TestTableViewCell: UITableViewCell {

    @IBOutlet weak var arguments: UITextField!
    @IBOutlet weak var testBtn: UIButton!
    

    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
