//
//  PasswordController.swift
//  Arbel-IOS
//
//  Created by Silvana Tuku on 15/04/2019.
//  Copyright © 2019 Mac. All rights reserved.
//

import UIKit

class PasswordController: UIViewController {
    
    
    @IBOutlet weak var passwordVecchia: UITextField!
    
    @IBOutlet weak var passwordNuova: UITextField!
    
    @IBOutlet weak var passwordNuovaDue: UITextField!
    
    @IBOutlet weak var sendbutton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Styles00
        passwordVecchia.layer.cornerRadius = 8
        passwordVecchia.layer.shadowColor = UIColor (red: 142/255, green: 142/255, blue: 142/255, alpha: 0.5).cgColor
        passwordVecchia.layer.shadowOffset = CGSize (width: 0, height: 1.0)
        passwordVecchia.layer.shadowRadius = 1.5
        passwordVecchia.layer.shadowOpacity = 0.8
        
        // Styles01
        passwordNuova.layer.cornerRadius = 8
        passwordNuova.layer.shadowColor = UIColor (red: 142/255, green: 142/255, blue: 142/255, alpha: 0.5).cgColor
        passwordNuova.layer.shadowOffset = CGSize (width: 0, height: 1.0)
        passwordNuova.layer.shadowRadius = 1.5
        passwordNuova.layer.shadowOpacity = 0.8
        
        // Styles02
        passwordNuovaDue.layer.cornerRadius = 8
        passwordNuovaDue.layer.shadowColor = UIColor (red: 142/255, green: 142/255, blue: 142/255, alpha: 0.5).cgColor
        passwordNuovaDue.layer.shadowOffset = CGSize (width: 0, height: 1.0)
        passwordNuovaDue.layer.shadowRadius = 1.5
        passwordNuovaDue.layer.shadowOpacity = 0.8
        
        
        
        sendbutton.layer.cornerRadius = 18
        sendbutton.layer.masksToBounds = true
        
        sendbutton.setGradientBackground(colorOne: UIColor(red: 208/255, green: 2/255, blue: 27/255, alpha: 1), colorTwo: UIColor(red: 233/255, green: 26/255, blue: 75/255, alpha: 1))
        
        
        
    }
    
}
