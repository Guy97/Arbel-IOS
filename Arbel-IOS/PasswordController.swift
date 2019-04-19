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
        
        
//        self.navigationController?.navigationBar.barTintColor = UIColor(red: 251/255, green: 251/255, blue: 251/255, alpha: 1)
//        self.navigationController?.navigationBar.tintColor = UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 1)
//        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor:UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 1)]
        

        self.oldPassword.layer.cornerRadius = 10
        self.newPassword.layer.cornerRadius = 10
        self.confirmPassword.layer.cornerRadius = 10
        self.confirmButton.layer.cornerRadius = 18
        confirmButton.clipsToBounds = true

        confirmButton.setGradientBackground(colorOne: UIColor(red: 208/255, green: 2/255, blue: 27/255, alpha: 1), colorTwo: UIColor(red: 233/255, green: 26/255, blue: 75/255, alpha: 1))
        
        
        
       
        
        
        
    }
    

    
}
