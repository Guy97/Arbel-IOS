//
//  NoteController.swift
//  Arbel-IOS
//
//  Created by Simone on 26/03/2019.
//  Copyright © 2019 Mac. All rights reserved.
//

import UIKit
import Alamofire

class NoteController: UIViewController {
    
    var previousVC = HomeController()
    
    @IBOutlet weak var noteForm: UITextView!
    @IBOutlet weak var saveButton: UIButton!
    
    @IBAction func saveButton(_ sender: Any) {
        
        let postDict:[String:String] = ["memoryText": "\(noteForm.text!)", "user_id": "\(Users.userLogin.success.id)"]
        
        let headers: HTTPHeaders = [
            "Authorization": "Bearer \(Users.userLogin.success.token)",
            "Accept": "application/json"
        ]
        
        Alamofire.request("http://arbel.test/api/postReminder", method: .post, parameters: postDict, headers: headers).responseJSON {response in
            if let data = response.data, let utf8Text = String(data: data, encoding: .utf8) {
                do {
                    
                    let jsonDecoder = JSONDecoder()
                    var postData = try jsonDecoder.decode(PostReminder.self, from: response.data!)
                    
                    if response.result.isSuccess {
                        
                        self.performSegue(withIdentifier: "goHome", sender: self)
                        API.ReminderApi()
                        var teext = self.previousVC.reminderData.map { ($0).memoryText}
                        let name : String = self.noteForm!.text!
                        teext.append(name)
                        self.noteForm?.text! = ""
                    }
                }
                catch
                {
                    print(error)
                    
                }
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.HideKeyboard()
        
        elementStyle()
    }
    
    func elementStyle() {
        self.noteForm.layer.cornerRadius = 8
        self.saveButton.layer.cornerRadius = 18
        saveButton.layer.masksToBounds = true
        self.saveButton.setTitleColor(UIColor.white, for: .highlighted)
        self.saveButton.setBackgroundColor(color: UIColor(red: 208/255, green: 2/255, blue: 27/255, alpha: 1), forState: .normal)
        self.saveButton.setBackgroundColor(color: UIColor(red: 189/255, green: 0/255, blue: 23/255, alpha: 1), forState: .highlighted)
    }
}
