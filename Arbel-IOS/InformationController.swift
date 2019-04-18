//
//  InformationController.swift
//  Arbel-IOS
//
//  Created by Silvana Tuku on 16/04/2019.
//  Copyright © 2019 Mac. All rights reserved.
//

import UIKit

class InformationController: UIViewController {
    @IBOutlet weak var textInformation: UILabel!
    
    @IBOutlet weak var goToProfile: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        goToProfile.layer.cornerRadius = 18
        goToProfile.layer.masksToBounds = true
        
        goToProfile.setGradientBackground(colorOne: UIColor(red: 208/255, green: 2/255, blue: 27/255, alpha: 1), colorTwo: UIColor(red: 233/255, green: 26/255, blue: 75/255, alpha: 1))
        
        
    }
}

