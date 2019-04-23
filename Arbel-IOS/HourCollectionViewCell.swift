//
//  HourCollectionViewCell.swift
//  Arbel-IOS
//
//  Created by Simone on 21/04/2019.
//  Copyright © 2019 Mac. All rights reserved.
//

import UIKit

class HourCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var defaultHour: UILabel!
    @IBOutlet weak var work: UILabel!
    @IBOutlet weak var backgroundColorView: UIView!
    
    
    var activity: Activity? {
        didSet {
            self.updateUI()
        }
    }
    
    private func updateUI() {
        
        if let activity = activity {
            defaultHour.text = activity.hour
            work.text = activity.work
            backgroundColorView.backgroundColor = activity.color
            
        }
        else{
            defaultHour.text = nil
            work.text = nil
            backgroundColorView.backgroundColor = nil
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        backgroundColorView.layer.cornerRadius = 8
        
        layer.shadowColor = UIColor (red: 142/255, green: 142/255, blue: 142/255, alpha: 0.5).cgColor
        layer.shadowOffset = CGSize (width: 0, height: 1.0)
        layer.shadowRadius = 4
        layer.shadowOpacity = 0.3
        
        self.clipsToBounds = false
    }
    
    
}
