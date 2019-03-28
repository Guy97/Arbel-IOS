//
//  NoteController.swift
//  Arbel-IOS
//
//  Created by Simone on 26/03/2019.
//  Copyright © 2019 Mac. All rights reserved.
//

import UIKit

class NoteController: UIViewController {
    
    @IBOutlet weak var noteForm: UITextView!
    @IBOutlet weak var saveButton: UIButton!
    @IBAction func saveButton(_ sender: Any) {
        
        if (noteForm.text != "") {
            
            list.append(noteForm.text!)
            noteForm.text = ""
        }
        
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.HideKeyboard()

        self.noteForm.layer.cornerRadius = 13
        self.saveButton.layer.cornerRadius = 18
        saveButton.layer.masksToBounds = true
        
        saveButton.setGradientBackground(colorOne: UIColor(red: 208/255, green: 2/255, blue: 27/255, alpha: 1), colorTwo: UIColor(red: 233/255, green: 26/255, blue: 75/255, alpha: 1))
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
