//
//  DesignableViewController.swift
//  Arbel-IOS
//
//  Created by Simone on 28/03/2019.
//  Copyright © 2019 Mac. All rights reserved.
//

import UIKit

@IBDesignable
class DesignableViewController: UIViewController {
    
    @IBInspectable var LightStatusBar: Bool = false
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        get {
            if LightStatusBar {
                return UIStatusBarStyle.lightContent
            } else {
                return UIStatusBarStyle.default
            }
        }
    }
}
