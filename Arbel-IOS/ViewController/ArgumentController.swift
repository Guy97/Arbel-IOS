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
        
        elementStyle()
    }
    
    func elementStyle() {
        self.argumentForm.layer.cornerRadius = 8
        self.sendButton.layer.cornerRadius = 18
        sendButton.layer.masksToBounds = true

        self.sendButton.setTitleColor(UIColor.white, for: .highlighted)
        self.sendButton.setBackgroundColor(color: UIColor(red: 208/255, green: 2/255, blue: 27/255, alpha: 1), forState: .normal)
        self.sendButton.setBackgroundColor(color: UIColor(red: 189/255, green: 0/255, blue: 23/255, alpha: 1), forState: .highlighted)
    }
}
