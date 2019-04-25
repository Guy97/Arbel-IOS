//
//  ViewController.swift
//  Arbel-IOS
//
//  Created by Mac on 12/03/2019.
//  Copyright © 2019 Mac. All rights reserved.
//

import UIKit
import XLPagerTabStrip

extension UIViewController {
    
    func HideKeyboard(){
        
        let Tap:UITapGestureRecognizer = UITapGestureRecognizer(target: self , action: #selector(dismissKeyboard))
        
        view.addGestureRecognizer(Tap)
    }
    
    @objc func DismissKeyboard() {
        view.endEditing(true)
    }
}

class ViewController: UIViewController , UITextFieldDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        }
}

