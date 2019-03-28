//
//  FifthController.swift
//  Arbel-IOS
//
//  Created by Mac on 19/03/2019.
//  Copyright © 2019 Mac. All rights reserved.
//

import UIKit

class FifthController: UIViewController {
    
    @IBOutlet weak var Passwordbotton: UIButton!
  
    @IBOutlet weak var infobutton: UIButton!

    @IBOutlet weak var Imageprofile: UIImageView!
    
    @IBOutlet weak var Logoutbutton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
 
        
        self.Imageprofile.layer.cornerRadius = self.Imageprofile.frame.size.width / 2;
        self.Imageprofile.clipsToBounds = true;
        
        Passwordbotton.layer.shadowColor = UIColor.lightGray.cgColor
        Passwordbotton.layer.shadowOffset = .zero
        Passwordbotton.layer.shadowOpacity = 0.6
        Passwordbotton.layer.cornerRadius = 8

        
        infobutton.layer.shadowColor = UIColor.lightGray.cgColor
        infobutton.layer.shadowOffset = .zero
        infobutton.layer.shadowOpacity = 0.7
        infobutton.layer.cornerRadius = 8
       
        Logoutbutton.layer.cornerRadius = 18


        print("fifth")
    }

}
