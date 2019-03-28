//
//  FourthController.swift
//  Arbel-IOS
//
//  Created by Mac on 19/03/2019.
//  Copyright © 2019 Mac. All rights reserved.
//

import UIKit

class FourthController: UIViewController {
    
    @IBOutlet weak var mailForm: UITextField!
    @IBOutlet weak var objectForm: UITextField!
    @IBOutlet weak var messageForm: UITextView!
    @IBOutlet weak var sendButton: UIButton!
    @IBOutlet weak var addButton: UIButton!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        self.HideKeyboard()
        
        self.mailForm.layer.cornerRadius = 17
        self.objectForm.layer.cornerRadius = 17
        self.messageForm.layer.cornerRadius = 13
        self.sendButton.layer.cornerRadius = 18
        
        addButton.clipsToBounds = true
        sendButton.layer.masksToBounds = true
        addButton.layer.cornerRadius = 17
        addButton.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMaxXMinYCorner]
        
        sendButton.setGradientBackground(colorOne: UIColor(red: 208/255, green: 2/255, blue: 27/255, alpha: 1), colorTwo: UIColor(red: 233/255, green: 26/255, blue: 75/255, alpha: 1))
        
        
    
        
        
        // Do any additional setup after loading the view, typically from a nib.
        
        print("fourth")
    }
    
    
    @IBAction func addAction(_ sender: Any) {
        
        let alertController = UIAlertController(title: "Seleziona il corso da contattare", message: nil, preferredStyle: .actionSheet)
        alertController.addAction(UIAlertAction(title: "Media Design", style: .default, handler: nil))
        alertController.addAction(UIAlertAction(title: "Sound Design", style: .default, handler: nil))
        alertController.addAction(UIAlertAction(title: "Penis Design", style: .default, handler: nil))
        alertController.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        self.present(alertController, animated: true, completion: nil )
    }
//    @IBAction func addButton(_sender: Any) {
//        let alertController = UIAlertController(title: "BriefOS", message: "Hello scemo", preferredStyle: .actionSheet)
//        alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
//        alertController.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
//        self.present(alertController, animated: true, completion: nil )
//    }
    
//    func okHandler(alert: UIAlertAction) {
//        self.navigationController?.pushViewController(UIViewController(), animated: true)
//    }
    
    
}
