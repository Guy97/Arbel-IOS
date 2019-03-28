//
//  NoteCell.swift
//  Arbel-IOS
//
//  Created by Simone on 28/03/2019.
//  Copyright © 2019 Mac. All rights reserved.
//

import UIKit

class NoteCell: UITableViewCell {
    
    @IBOutlet weak var videoImageView: UIImageView!
    @IBOutlet weak var videoTitleLabel: UILabel!
    
    func setVideo(label: Label) {
        
        noteLabel.text = note.text
        noteImage.image = note.image
    
    }
    
}
