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
    
    var reminderData = Users.userLogin.success.memories

    
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
                    print(postData, "UDITE")
//                    postData = PostReminder.teacherMemory
                    self.reminderData.append(postData.memories)
                    
//                    if (self.noteForm.text != "") {
//
////                        var filteredReminder = self.reminderData.map {($0).memoryText}
//
//                        //            date.append(str)
//                        reminderData.append(postData.memories.memoryText)
//                        //                PostReminder.teacherMemory.append(PostReminder.teacherMemory.)
//                        let jsonEncoder = JSONEncoder()
//
//                        do {
//                            let jsonData = try jsonEncoder.encode(PostReminder.teacherMemory.memories.memoryText)
//                            print(String(data: jsonData, encoding: .utf8)!)
//                        }
//                        catch
//                        {
//                            print(error)
//                        }
//                        self.noteForm.text = ""
//                    }
                }
                catch
                {
                    print(error)
                
                }
                
            }
        
//        let formatter = DateFormatter()
//        formatter.dateStyle = .long
//        formatter.timeStyle = .short
//        formatter.setLocalizedDateFormatFromTemplate("MMMMdd - HH:mm")
//        formatter.locale =  Locale(identifier: "it_IT")
//        let str = formatter.string(from: Date())
        
//            if (self.noteForm.text != "") {
//
//                var filteredReminder = self.reminderData.map {($0).memoryText}
//
////            date.append(str)
//                reminderData.append(PostReminder.teache)
////                PostReminder.teacherMemory.append(PostReminder.teacherMemory.)
//            let jsonEncoder = JSONEncoder()
//
//            do {
//                let jsonData = try jsonEncoder.encode(PostReminder.teacherMemory.memories.memoryText)
//                print(String(data: jsonData, encoding: .utf8)!)
//            }
//            catch
//            {
//                print(error)
//            }
//                self.noteForm.text = ""
//            }
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
        //        saveButton.setGradientBackground(colorOne: UIColor(red: 208/255, green: 2/255, blue: 27/255, alpha: 1), colorTwo: UIColor(red: 233/255, green: 26/255, blue: 75/255, alpha: 1))
        self.saveButton.setTitleColor(UIColor.white, for: .highlighted)
        self.saveButton.setBackgroundColor(color: UIColor(red: 208/255, green: 2/255, blue: 27/255, alpha: 1), forState: .normal)
        self.saveButton.setBackgroundColor(color: UIColor(red: 189/255, green: 0/255, blue: 23/255, alpha: 1), forState: .highlighted)
    }
}
