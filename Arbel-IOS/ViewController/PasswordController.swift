//
//  PasswordController.swift
//  Arbel-IOS
//
//  Created by Silvana Tuku on 15/04/2019.
//  Copyright © 2019 Mac. All rights reserved.
//

import UIKit

class PasswordController: UIViewController {
    
    @IBOutlet weak var oldPassword: UITextField!
    @IBOutlet weak var newPassword: UITextField!
    @IBOutlet weak var confirmPassword: UITextField!
    @IBOutlet weak var confirmButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        elementStyle()
    }
    
    func elementStyle() {
        self.oldPassword.layer.cornerRadius = 10
        self.newPassword.layer.cornerRadius = 10
        self.confirmPassword.layer.cornerRadius = 10
        self.confirmButton.layer.cornerRadius = 18
        confirmButton.clipsToBounds = true

        self.confirmButton.setTitleColor(UIColor.white, for: .highlighted)
        self.confirmButton.setBackgroundColor(color: UIColor(red: 208/255, green: 2/255, blue: 27/255, alpha: 1), forState: .normal)
        self.confirmButton.setBackgroundColor(color: UIColor(red: 189/255, green: 0/255, blue: 23/255, alpha: 1), forState: .highlighted)
    }
}
