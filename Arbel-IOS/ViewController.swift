//
//  ViewController.swift
//  Arbel-IOS
//
//  Created by Mac on 12/03/2019.
//  Copyright © 2019 Mac. All rights reserved.
//

import UIKit
import XLPagerTabStrip

extension UIViewController {
    
    func HideKeyboard(){
        
        let Tap:UITapGestureRecognizer = UITapGestureRecognizer(target: self , action: #selector(dismissKeyboard))
        
        view.addGestureRecognizer(Tap)
        
    }
    
    @objc func DismissKeyboard() {
        view.endEditing(true)
    }
}

class ViewController: UIViewController , UITextFieldDelegate {
    

    override func viewDidLoad() {
        super.viewDidLoad()

        }

}

//extension ButtonBarPagerTabStripViewController  {
//
//    override open func viewControllers(for pagerTabStripController: PagerTabStripViewController) -> [UIViewController] {
//        let child_1 = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "StudentTab")
//        let child_2 = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "TestTab")
//        let child_3 = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ActivityTab")
//        return [child_1, child_2, child_3]
//    }


