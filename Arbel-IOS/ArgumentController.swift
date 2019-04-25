//
//  StudentDetailController.swift
//  Arbel-IOS
//
//  Created by Simone on 24/04/2019.
//  Copyright © 2019 Mac. All rights reserved.
//

import UIKit

class ArgumentController: UIViewController {


    @IBOutlet weak var argumentForm: UITextView!
    @IBOutlet weak var sendButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.argumentForm.layer.cornerRadius = 8
        self.sendButton.layer.cornerRadius = 18
        sendButton.layer.masksToBounds = true
        
        sendButton.setGradientBackground(colorOne: UIColor(red: 208/255, green: 2/255, blue: 27/255, alpha: 1), colorTwo: UIColor(red: 233/255, green: 26/255, blue: 75/255, alpha: 1))
        }
    }
    



