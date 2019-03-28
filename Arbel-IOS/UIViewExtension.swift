//
//  UIViewExtension.swift
//  Arbel-IOS
//
//  Created by Simone on 28/03/2019.
//  Copyright © 2019 Mac. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    
    func setGradientBackground(colorOne: UIColor, colorTwo: UIColor) {
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = bounds
        gradientLayer.colors = [colorOne.cgColor, colorTwo.cgColor]
        gradientLayer.locations = [0.0, 1.0]
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.8)
        gradientLayer.endPoint = CGPoint(x: 2.0, y: 3.0)
        
        layer.insertSublayer(gradientLayer, at: 0)
    }
}
