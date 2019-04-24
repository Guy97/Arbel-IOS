//
//  SaveDesignView.swift
//  Arbel-IOS
//
//  Created by Simone on 24/04/2019.
//  Copyright © 2019 Mac. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable class SaveDesignView: UIView {
    
    @IBInspectable var cornerRadius : CGFloat = 0
    
    override func layoutSubviews() {
        
        layer.cornerRadius = cornerRadius
    
    }
    

}

