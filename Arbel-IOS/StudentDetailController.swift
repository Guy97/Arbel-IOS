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
    @IBOutlet weak var testTableView: UITableView!
    @IBOutlet weak var absenceTableView: UITableView!
    @IBOutlet weak var noteForm: UITextView!
    @IBOutlet weak var saveButton: UIButton!
    
    var transparentView = UIView()
    
    struct Test {
        var date: String
        var testResult: String
    }
    
//    var testResult = ["Scritto (26.11.2018): 28", "Orale (15.02.2019): 24", "Test (04.05.2019): +"]
    
    var testResult = [Test(date: "26.11.2018", testResult: "28"),Test(date: "15.02.2019", testResult: "24"),Test(date: "04.05.2019", testResult: "+"), Test(date: "04.05.2019", testResult: "-")]
    
    var allAbsence = ["04.10.2018", "21.11.2018"]
    
    let testType = ["Scritto", "Orale", "Test"]
    var selectedType : String?
    
    private var datePicker: UIDatePicker?
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        self.navigationController
        let logoutBarButtonItem = UIBarButtonItem(image: UIImage(named: "contactIcon"), style: .done, target: self, action: #selector(logoutUser))
        self.navigationItem.rightBarButtonItem  = logoutBarButtonItem

        
        elementStyle()
        createDataPicker()
        createTestTypePicker()
        self.HideKeyboard()
        
//        createToolbar()
        
        testTableView.dataSource = self
        testTableView.delegate = self
        
        absenceTableView.dataSource = self
        absenceTableView.delegate = self
    }
    
    @objc func logoutUser(){
        print("mail")
        self.performSegue(withIdentifier: "sendMail", sender: self)
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
        saveButton.layer.cornerRadius = 18
        
        saveButton.layer.masksToBounds = true

        self.saveButton.setTitleColor(UIColor.white, for: .highlighted)
        self.saveButton.setBackgroundColor(color: UIColor(red: 208/255, green: 2/255, blue: 27/255, alpha: 1), forState: .normal)
        self.saveButton.setBackgroundColor(color: UIColor(red: 189/255, green: 0/255, blue: 23/255, alpha: 1), forState: .highlighted)
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
            
            let testDetail = testResult[indexPath.row]
            result.textResult?.text = testDetail.testResult
            result.testDate?.sizeToFit()
            result.testDate?.text = "Scritto " + "(" + testDetail.date + ")" + ":"
            
            
//            result.textResult?.text = testResult[indexPath.row]
            return result
            
        } else {
            let absence = tableView.dequeueReusableCell(withIdentifier: "absence") as! SingleStudentDetailCell
            absence.textAbsence?.text = allAbsence[indexPath.row]
            return absence
        }
    }
    
    func createTestTypePicker() {
        let testPicker = UIPickerView()
        testPicker.center = view.center
//        view.addSubview(testPicker)
        testPicker.delegate = self
        typeForm.inputView = testPicker
//        self.view.addSubview(testPicker)
    
        
        testPicker.backgroundColor = UIColor (red: 251/255, green: 251/255, blue: 251/255, alpha: 1)
        testPicker.clipsToBounds = false
        testPicker.layer.shadowColor = UIColor (red: 142/255, green: 142/255, blue: 142/255, alpha: 0.7).cgColor
        testPicker.layer.shadowOffset = CGSize (width: 0, height: 0)
        testPicker.layer.shadowRadius = 2.7
        testPicker.layer.shadowOpacity = 0.3
    }
    
    func createDataPicker() {
        let datePicker = UIDatePicker()
        dateForm.inputView = datePicker
        
//        transparentView.backgroundColor = UIColor.black.withAlphaComponent(1)

        
        datePicker.backgroundColor = UIColor (red: 251/255, green: 251/255, blue: 251/255, alpha: 1)
        datePicker.clipsToBounds = false
        datePicker.layer.shadowColor = UIColor (red: 142/255, green: 142/255, blue: 142/255, alpha: 0.7).cgColor
        datePicker.layer.shadowOffset = CGSize (width: 0, height: 0)
        datePicker.layer.shadowRadius = 2.7
        datePicker.layer.shadowOpacity = 0.3
        
        datePicker.datePickerMode = .date
        datePicker.locale = Locale(identifier: "it_IT")
        
        datePicker.addTarget(self, action: #selector(StudentDetailController.dateChaged(datePicker:)), for: .valueChanged)
        
        
//        datePicker.contentInset = UIEdgeInsets(top: 50, left: 0, bottom: 0, right: 0)
        

    }
    
    @objc func dateChaged(datePicker: UIDatePicker) {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM.yyyy"
        
        dateForm.text = dateFormatter.string(from: datePicker.date)
//        view.endEditing(true)
    }

    //    func createToolbar() {
//        let toolBar = UIToolbar()
//        toolBar.sizeToFit()
//
//        let doneButton = UIBarButtonItem(title: "Conferma", style: .plain, target: self, action: #selector(StudentDetailController.dismissKeyboard))
//
//        toolBar.setItems([doneButton], animated: false)
//        toolBar.isUserInteractionEnabled = true
//
//        typeForm.inputAccessoryView = toolBar
//    }
//
//    override func dismissKeyboard() {
//        view.endEditing(true)
//    }
    
}

extension StudentDetailController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return testType.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return testType[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        typeForm.text = testType[row]
    }
}


