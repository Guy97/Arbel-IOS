//
//  FirstController.swift
//  Arbel-IOS
//
//  Created by Mac on 18/03/2019.
//  Copyright © 2019 Mac. All rights reserved.
//

import UIKit

class FirstController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        print("first porco due speriamo funzioni")
        print("ma speriamo speriamoooooo")
        print("scusate ho fatto un bordello e ho dovuto rifare il clone")
        print("tranquillo,adesso cerchiamo di risolvere")
        print("forse ci siamo")
        print("ci siamo davvero")
        //ciao sono fede
         
        
    }
    
    //funzione swipe
    @IBAction func swipeControl(sender: UISwipeGestureRecognizer) {
        if sender.direction == UISwipeGestureRecognizer.Direction.left {
            self.tabBarController?.selectedIndex = 1
        }
    }
    
}
