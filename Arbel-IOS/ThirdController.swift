//
//  ThirdController.swift
//  Arbel-IOS
//
//  Created by Mac on 19/03/2019.
//  Copyright © 2019 Mac. All rights reserved.
//

import UIKit

class ThirdController: UIViewController {
    
    @IBOutlet weak var classContainer00: UIView!
    @IBOutlet weak var classContainer01: UIView!
    
    @IBOutlet weak var classContainer02: UIView!
    @IBOutlet weak var classContainer03: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Styles00
        classContainer00.layer.cornerRadius = 8
        classContainer00.layer.shadowColor = UIColor (red: 142/255, green: 142/255, blue: 142/255, alpha: 0.5).cgColor
        classContainer00.layer.shadowOffset = CGSize (width: 0, height: 1.2)
        classContainer00.layer.shadowRadius = 1.5
        classContainer00.layer.shadowOpacity = 0.8
        
        // Styles01
        classContainer01.layer.cornerRadius = 8
        classContainer01.layer.shadowColor = UIColor (red: 142/255, green: 142/255, blue: 142/255, alpha: 0.5).cgColor
        classContainer01.layer.shadowOffset = CGSize (width: 0, height: 1.2)
        classContainer01.layer.shadowRadius = 1.5
        classContainer01.layer.shadowOpacity = 0.8
        
        // Styles02
        classContainer02.layer.cornerRadius = 8
        classContainer02.layer.shadowColor = UIColor (red: 142/255, green: 142/255, blue: 142/255, alpha: 0.5).cgColor
        classContainer02.layer.shadowOffset = CGSize (width: 0, height: 1.2)
        classContainer02.layer.shadowRadius = 1.5
        classContainer02.layer.shadowOpacity = 0.8
        
        // Styles03
        classContainer03.layer.cornerRadius = 8
        classContainer03.layer.shadowColor = UIColor (red: 142/255, green: 142/255, blue: 142/255, alpha: 0.5).cgColor
        classContainer03.layer.shadowOffset = CGSize (width: 0, height: 1.2)
        classContainer03.layer.shadowRadius = 1.5
        classContainer03.layer.shadowOpacity = 0.8
        
        print("third")
    }
    
    @IBAction func swipeControl(sender: UISwipeGestureRecognizer) {
        if sender.direction == UISwipeGestureRecognizer.Direction.left {
            self.tabBarController?.selectedIndex = 3
        }
        else if sender.direction == UISwipeGestureRecognizer.Direction.right {
            self.tabBarController?.selectedIndex = 1
        }
    }
}
