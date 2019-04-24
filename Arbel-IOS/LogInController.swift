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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.HideKeyboard()
        
        self.loginButton.layer.cornerRadius = 18
        loginButton.layer.masksToBounds = true
        
        
        loginButton.setGradientBackground(colorOne: UIColor(red: 208/255, green: 2/255, blue: 27/255, alpha: 1), colorTwo: UIColor(red: 233/255, green: 26/255, blue: 75/255, alpha: 1))
        
        
        
    }
    
    @IBAction func login() {
       
        
        let postDict:[String:String] = ["email": "\(usernameForm.text!)", "password": "\(passwordForm.text!)"]
//        let postDict: Parameters=[
//            "username":usernameForm.text!,
//            "password":passwordForm.text!
//        ]
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
            }
        }
        
//        Alamofire.request("http://arbel.test/api/login", method: .post, parameters: postDict).responseJSON
//            {
//                response in
//                //printing response
//                print(response, "cazzo")
//
//                //getting the json value from the server
//                if let result = response.result.value {
//                    let jsonData = result as! NSDictionary
//
//                    //if there is no error
//                    if(!(jsonData.value(forKey: "error") as! Bool)){
//
//                        //getting the user from response
//                        let user = jsonData.value(forKey: "users") as! NSDictionary
//
//                        //getting user values
//                        let userId = user.value(forKey: "id") as! Int
//                        let userName = user.value(forKey: "name") as! String
//                        let userEmail = user.value(forKey: "email") as! String
//
//
//                        //saving user values to defaults
//                        self.defaultValues.set(userId, forKey: "id")
//                        self.defaultValues.set(userName, forKey: "name")
//                        self.defaultValues.set(userEmail, forKey: "email")
//
//
//                        //switching the screen
//                        let profileViewController = self.storyboard?.instantiateViewController(withIdentifier: "HomeController") as! HomeController
//                        self.navigationController?.pushViewController(profileViewController, animated: true)
//
//                        self.dismiss(animated: false, completion: nil)
//                    }else{
//                        //error message in case of invalid credential
//                        print("invalid user")
//                    }
//                }
//        }
        
//        Alamofire.request("http://192.168.1.102/api/login", method: .post, parameters: postDict).responseJSON
//            {
//                response in
//                //printing response
//                print(response)
//
//                //getting the json value from the server
//                if let result = response.result.value {
//
//                    //converting it as NSDictionary
//                    let jsonData = result as! NSDictionary
//                    let user = jsonData.value(forKey: "user") as! NSDictionary
//
//                    if self.usernameForm.text! == user.value(forKey: "email") as! String && self.passwordForm.text! == user.value(forKey: "password") as! String {
//                        let profileViewController = self.storyboard?.instantiateViewController(withIdentifier: "Homecontroller") as! HomeController
//                        self.navigationController?.pushViewController(profileViewController, animated: true)
//                    }
//                    else {
//                        print("invalid user")
//                    }
//
//                }
//        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.usernameForm.underlined()
        self.passwordForm.underlined()
    }
    
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillDisappear(animated)
//        UIApplication.shared.statusBarStyle = UIStatusBarStyle.default
//        
//    }
//    
//    override func viewWillDisappear(_ animated: Bool) {
//        super.viewWillDisappear(animated)
//        UIApplication.shared.statusBarStyle = .lightContent    }
    
    
}
