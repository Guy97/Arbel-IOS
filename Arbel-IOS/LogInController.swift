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
    
    @IBOutlet weak var LogInView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //LogInView.layer.Borde
        
    }
    
}
