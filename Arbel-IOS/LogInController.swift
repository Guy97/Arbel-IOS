//
//  LogInController.swift
//  Arbel-IOS
//
//  Created by Mac on 24/03/2019.
//  Copyright © 2019 Mac. All rights reserved.
//

import UIKit
import Alamofire

extension Double {
    func nodecimal() -> String
    {
        return String(format: "%.0f", self)
    }
    func toInt() -> Int
    {
        return Int(self)
    }
}

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
    
    @IBOutlet weak var usernameForm: UITextField!
    @IBOutlet weak var passwordForm: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    let defaultValues = UserDefaults.standard
    
    var rootVC : UIViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.HideKeyboard()

        self.loginButton.layer.cornerRadius = 18
        loginButton.layer.masksToBounds = true
//        loginButton.setGradientBackground(colorOne: UIColor(red: 208/255, green: 2/255, blue: 27/255, alpha: 1), colorTwo: UIColor(red: 233/255, green: 26/255, blue: 75/255, alpha: 1))
        
        self.loginButton.setTitleColor(UIColor.white, for: .highlighted)
        self.loginButton.setBackgroundColor(color: UIColor(red: 208/255, green: 2/255, blue: 27/255, alpha: 1), forState: .normal)
        self.loginButton.setBackgroundColor(color: UIColor(red: 189/255, green: 0/255, blue: 23/255, alpha: 1), forState: .highlighted)

    }
    
    @IBAction func login() {
    
        let postDict:[String:String] = ["email": "\(usernameForm.text!)", "password": "\(passwordForm.text!)"]
        Alamofire.request("http://arbel.test/api/login", method: .post, parameters: postDict).responseJSON {response in //response serialization result
            if let data = response.data, let utf8Text = String(data: data, encoding: .utf8) {
                print("Data: \(utf8Text)") // original server data as UTF8 string
                do {
                    let jsonDecoder = JSONDecoder()
                    let postData = try jsonDecoder.decode(users.self, from: response.data!)
                    print(postData, "bo")

                }
                catch
                {
                    print(error)
                }
                if utf8Text.contains("error") {
                    print("utente non loggato")
                    let alertController = UIAlertController(title: "Attenzione", message:
                        "Mail o password non corretti", preferredStyle: .alert)
                    alertController.addAction(UIAlertAction(title: "Ok", style: .default))
                    self.present(alertController, animated: true, completion: nil)
                }
                else {
                    print("utente loggato")
                    
                    self.performSegue(withIdentifier: "enter", sender: self)
                }
            }
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.usernameForm.underlined()
        self.passwordForm.underlined()
        self.usernameForm.text = ""
        self.passwordForm.text = ""
        
        UIApplication.shared.statusBarStyle = UIStatusBarStyle.default
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        UIApplication.shared.statusBarStyle = .lightContent    }
    
    
}

extension UIButton {
    func setBackgroundColor(color: UIColor, forState: UIControl.State) {

        UIGraphicsBeginImageContext(CGSize(width: 1, height: 1))
        UIGraphicsGetCurrentContext()!.setFillColor(color.cgColor)
        UIGraphicsGetCurrentContext()!.fill(CGRect(x: 0, y: 0, width: 1, height: 1))
        
        let colorImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()

        self.setBackgroundImage(colorImage, for: forState)
    }

}
