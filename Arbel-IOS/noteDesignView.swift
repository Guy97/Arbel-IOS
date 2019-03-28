//
//  noteDesignView.swift
//  Arbel-IOS
//
//  Created by Simone on 28/03/2019.
//  Copyright © 2019 Mac. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable class noteDesignView: UIView {
    
    @IBInspectable var cornerRadius : CGFloat = 0
    @IBInspectable var shadowColor : UIColor? = UIColor.black
    
    @IBInspectable var shadowOffSetWidth : Int = 0
    @IBInspectable var shadowOffSetHeight : Int = 1
    
    @IBInspectable var shadowOpacity : Float = 0.2
    
    @IBInspectable var shadowRadius : Float = 1
    
    
    override func layoutSubviews() {
        layer.cornerRadius = cornerRadius
        
        layer.shadowColor = shadowColor?.cgColor
        
        layer.shadowOffset = CGSize(width: shadowOffSetWidth, height: shadowOffSetHeight)
        
        let shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: cornerRadius)
        
        layer.shadowPath = shadowPath.cgPath
        
        layer.shadowOpacity = shadowOpacity
        
        layer.shadowRadius = CGFloat(shadowRadius)
    }
    
    
    
    
}
