//
//  DesignableTextField.swift
//  Arbel-IOS
//
//  Created by Simone on 12/05/2019.
//  Copyright © 2019 Mac. All rights reserved.
//

import UIKit

@IBDesignable

class DesignableTextField: UITextField {
    
    
    @IBInspectable var leftImage: UIImage? {
        didSet {
            updateView()
        }
    }
    
    @IBInspectable var leftPadding: CGFloat = 0 {
        didSet {
            updateView()
        }
    }
    
    func updateView() {
        if let image = leftImage {
            
            let imageView = UIImageView(frame: CGRect(x: leftPadding, y: 0, width: image.size.width + 2, height: image.size.height + 2))
            imageView.image = image
            //            imageView.tintColor = tintColor
            
            var width = leftPadding + 20
            
            if borderStyle == UITextField.BorderStyle.none || borderStyle == UITextField.BorderStyle.line {
                width = width + 5
            }
            
            let view = UIView(frame: CGRect(x: 0, y: 0, width: width, height: image.size.height + 2))
            view.addSubview(imageView)
            
            leftView = view
            
            leftViewMode = .always
            
        } else {
            leftViewMode = .never
        }
        
        //        attributedPlaceholder = NSAttributedString(string: placeholder != nil ? placeholder! : "", attributes: [NSAttributedString.Key.foregroundColor : tintColor])
    }
    
    /*
     // Only override draw() if you perform custom drawing.
     // An empty implementation adversely affects performance during animation.
     override func draw(_ rect: CGRect) {
     // Drawing code
     }
     */
    
}
