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

class LogInController: UIViewController {
    
    @IBOutlet weak var usernameForm: UITextField!
    @IBOutlet weak var passwordForm: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    let defaultValues = UserDefaults.standard
    
    var rootVC : UIViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.HideKeyboard()
        usernameForm.text = "luca.infante@ied.edu"
        passwordForm.text = "cavolo"
        
        self.usernameForm.layer.cornerRadius = 10
        self.passwordForm.layer.cornerRadius = 10
    }
    
    @IBAction func login() {
        let postDict:[String:String] = ["email": "\(usernameForm.text!)", "password": "\(passwordForm.text!)"]
        
        Alamofire.request("http://arbel.test/api/login", method: .post, parameters: postDict).responseJSON {response in
            if let data = response.data, let utf8Text = String(data: data, encoding: .utf8) {
                print("Data: \(utf8Text)") // original server data as UTF8 string
                do {
                    
                    let jsonDecoder = JSONDecoder()
                    var postData = try jsonDecoder.decode(Users.self, from: response.data!)
                    Users.userLogin = postData
                                       
                    let getCourses = postData.success.courses
                    var filteredCourses = getCourses.map { ($0).course}
                    var filteredID = getCourses.map { ($0).id}
                    print("utente loggato")
                    self.performSegue(withIdentifier: "enter", sender: self)
                }
                catch
                {
                    print(error)
                    if !CheckInternet.Connection() {
                        let alertController = UIAlertController(title: "Sorry :(", message:
                            "Problemi di connessione con il server, verifica la tua connessione", preferredStyle: .alert)
                        alertController.addAction(UIAlertAction(title: "Ok", style: .default))
                        self.present(alertController, animated: true, completion: nil)
                    }
                    else {
                        print("utente non loggato")
                        let alertController = UIAlertController(title: "Attenzione", message:
                            "Mail o password non corretti", preferredStyle: .alert)
                        alertController.addAction(UIAlertAction(title: "Ok", style: .default))
                        self.present(alertController, animated: true, completion: nil)
                    }
                }
            }
        }
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
//        self.usernameForm.text = ""
//        self.passwordForm.text = ""

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
