//
//  LogInController.swift
//  Arbel-IOS
//
//  Created by Mac on 24/03/2019.
//  Copyright © 2019 Mac. All rights reserved.
//

import UIKit

extension UIView{
    
    func setBorder(radius:CGFloat, color:UIColor = UIColor.clear) -> UIView{
        let roundView:UIView = self
        roundView.layer.cornerRadius = CGFloat(radius)
        roundView.layer.borderWidth = 1
        roundView.clipsToBounds = true
        return roundView
    }
}


class LogInController: UIViewController {
    
    @IBOutlet weak var usernameForm: UITextField!
    @IBOutlet weak var passwordForm: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.HideKeyboard()
        
        self.loginButton.layer.cornerRadius = 18
        loginButton.layer.masksToBounds = true
        
        
        loginButton.setGradientBackground(colorOne: UIColor(red: 208/255, green: 2/255, blue: 27/255, alpha: 1), colorTwo: UIColor(red: 233/255, green: 26/255, blue: 75/255, alpha: 1))
        
        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.usernameForm.underlined()
        self.passwordForm.underlined()
    }
    
}
