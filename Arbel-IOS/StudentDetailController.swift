//
//  StudentDetailController.swift
//  Arbel-IOS
//
//  Created by Simone on 25/04/2019.
//  Copyright © 2019 Mac. All rights reserved.
//

import UIKit

class StudentDetailController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var studentImage: UIImageView!
    @IBOutlet weak var essentialView: UIView!
    @IBOutlet weak var formContainer: UIView!
    @IBOutlet weak var dateForm: UITextField!
    @IBOutlet weak var typeForm: UITextField!
    @IBOutlet weak var voteForm: UITextField!
    @IBOutlet weak var infoForm: UITextView!
    @IBOutlet weak var testTableView: UITableView!
    @IBOutlet weak var absenceTableView: UITableView!
    @IBOutlet weak var noteForm: UITextView!
    @IBOutlet weak var saveButton: UIButton!
    
    var testResult = ["Test Scritto (26.11.2018): 28", "Test Orale (15.02.2019): 24"]
    
    var allAbsence = ["04.10.2018", "21.11.2018"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        elementStyle()
        
        testTableView.dataSource = self
        testTableView.delegate = self
        
        absenceTableView.dataSource = self
        absenceTableView.delegate = self
    }
    
    func elementStyle() {
        studentImage.layer.masksToBounds = false
        studentImage.layer.cornerRadius = studentImage.frame.height/2
        studentImage.clipsToBounds = true
        
        essentialView.layer.cornerRadius = 8
        essentialView.layer.shadowColor = UIColor (red: 142/255, green: 142/255, blue: 142/255, alpha: 0.7).cgColor
        essentialView.layer.shadowOffset = CGSize (width: 0, height: 1.0)
        essentialView.layer.shadowRadius = 1.3
        essentialView.layer.shadowOpacity = 0.5
        
        formContainer.layer.shadowColor = UIColor (red: 142/255, green: 142/255, blue: 142/255, alpha: 0.7).cgColor
        formContainer.layer.shadowOffset = CGSize (width: 0, height: 0)
        formContainer.layer.shadowRadius = 2.7
        formContainer.layer.shadowOpacity = 0.3
        
        dateForm.layer.cornerRadius = 10
        typeForm.layer.cornerRadius = 10
        voteForm.layer.cornerRadius = 10
        noteForm.layer.cornerRadius = 8
        infoForm.layer.cornerRadius = 8
        saveButton.layer.cornerRadius = 18
        
        saveButton.layer.masksToBounds = true
        saveButton.setGradientBackground(colorOne: UIColor(red: 208/255, green: 2/255, blue: 27/255, alpha: 1), colorTwo: UIColor(red: 233/255, green: 26/255, blue: 75/255, alpha: 1))
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == testTableView {
            return (testResult.count)
        }
        else {
            return (allAbsence.count)
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView == testTableView {
            let result = tableView.dequeueReusableCell(withIdentifier: "result") as! SingleStudentDetailCell
            result.textResult?.text = testResult[indexPath.row]
            return result
            
        } else {
            let absence = tableView.dequeueReusableCell(withIdentifier: "absence") as! SingleStudentDetailCell
            absence.textAbsence?.text = allAbsence[indexPath.row]
            return absence
        }
    }
}
