//
//  FifthController.swift
//  Arbel-IOS
//
//  Created by Mac on 19/03/2019.
//  Copyright © 2019 Mac. All rights reserved.
//

import UIKit

class ProfileController: UIViewController {
    
    @IBOutlet weak var passwordVoice: UIButton!
    @IBOutlet weak var infoVoice: UIButton!
    @IBOutlet weak var imageprofile: UIImageView!
    @IBOutlet weak var logoutbutton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        elementStyle()
    }
    
    func elementStyle() {
        imageprofile.layer.masksToBounds = false
        imageprofile.layer.cornerRadius = imageprofile.frame.height/2
        imageprofile.clipsToBounds = true
        
        // Styles00
        passwordVoice.layer.cornerRadius = 8
        passwordVoice.layer.shadowColor = UIColor (red: 142/255, green: 142/255, blue: 142/255, alpha: 0.5).cgColor
        passwordVoice.layer.shadowOffset = CGSize (width: 0, height: 1.0)
        passwordVoice.layer.shadowRadius = 1.1
        passwordVoice.layer.shadowOpacity = 0.5
        
        // Styles01
        infoVoice.layer.cornerRadius = 8
        infoVoice.layer.shadowColor = UIColor (red: 142/255, green: 142/255, blue: 142/255, alpha: 0.5).cgColor
        infoVoice.layer.shadowOffset = CGSize (width: 0, height: 1.0)
        infoVoice.layer.shadowRadius = 1.1
        infoVoice.layer.shadowOpacity = 0.5
        
        logoutbutton.layer.cornerRadius = 18
        logoutbutton.layer.masksToBounds = true
//        logoutbutton.setGradientBackground(colorOne: UIColor(red: 208/255, green: 2/255, blue: 27/255, alpha: 1), colorTwo: UIColor(red: 233/255, green: 26/255, blue: 75/255, alpha: 1))
        
        self.logoutbutton.setTitleColor(UIColor.white, for: .highlighted)
        self.logoutbutton.setBackgroundColor(color: UIColor(red: 208/255, green: 2/255, blue: 27/255, alpha: 1), forState: .normal)
        self.logoutbutton.setBackgroundColor(color: UIColor(red: 189/255, green: 0/255, blue: 23/255, alpha: 1), forState: .highlighted)

    }
    
    @IBAction func exit(_ sender: Any) {
        self.performSegue(withIdentifier: "exit", sender: self)
        self.view.window!.rootViewController?.dismiss(animated: false, completion: nil)
    }
}
