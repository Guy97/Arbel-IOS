//
//  PaddingTextLogin.swift
//  Arbel-IOS
//
//  Created by Simone on 12/05/2019.
//  Copyright © 2019 Mac. All rights reserved.
//

import UIKit


class PaddingTextLogin: UITextField {
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    let padding = UIEdgeInsets(top: 0, left: 25, bottom: 0, right: 10)
    
    override open func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    override open func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    override open func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
}
