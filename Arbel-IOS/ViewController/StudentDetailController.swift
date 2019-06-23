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
    
    @IBOutlet weak var studentName: UILabel!
    @IBOutlet weak var studentBirthday: UILabel!
    @IBOutlet weak var badgeStudent: UILabel!
    @IBOutlet weak var averange: UILabel!
    @IBOutlet weak var cashBag: UILabel!
    
    var transparentView = UIView()
    
    var studentsMark = MarkData.studentMark.student_marks
    
    
    struct Test {
        var mark: Int
        var tipology: String
        var date: String
    }
    
    var allAbsence = ["04.10.2018", "21.11.2018"]
    
    let testType = ["Scritto", "Orale", "Test"]
    var selectedType : String?
    
    struct cellData {
        var mark = Int()
        var tipology = String()
        var date = String()
    }
    
    var studentData = [cellData]()
    
    private var datePicker: UIDatePicker?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let logoutBarButtonItem = UIBarButtonItem(image: UIImage(named: "contactIcon"), style: .done, target: self, action: #selector(logoutUser))
        self.navigationItem.rightBarButtonItem  = logoutBarButtonItem
        
        elementStyle()
        createDataPicker()
        createTestTypePicker()
        self.HideKeyboard()
        
        testTableView.dataSource = self
        testTableView.delegate = self
    
        absenceTableView.dataSource = self
        absenceTableView.delegate = self
        
        var filteredID = studentsMark.map { ($0).stud_id}
        var studID = PassData.globalVariable.studentID
      
        for stud in MarkData.studentMark.student_marks.filter ({ return ($0.stud_id == studID) }){
            if (stud.stud_id == studID) {
                averange.text = "MEDIA: \(stud.mark)"
                
                studentData.append(cellData(mark: stud.mark, tipology: stud.tipology, date: stud.date))
            }
        }
        
        
        var CourseCell_id = PassData.globalVariable.passData
        
        
        var StudentCell_id = PassData.globalVariable.studentID
        for student in Students.studentList.students.filter( { return ($0.class_id == CourseCell_id) } ) {
            if (student.id == StudentCell_id) {
                
                let placeholder = UIImage(named: "userPicture")
                let urlImage = URL(string: student.userPicture)
                studentImage.kf.setImage(with: urlImage, placeholder: placeholder)
                
                studentName.text = "\(student.name)" + " " + "\(student.surname)"
                badgeStudent.text = "N° matricola: " + "\(student.badgeNumber)"
                studentBirthday.text = "Data di nascita: " + "\(student.birthday)"
                cashBag.text = "Borsa di studio: "
                
            }
        }
    }
    
    @objc func logoutUser(){
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
            return (studentData.count)
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
            
            let testDetail = studentData[indexPath.row]
            result.textResult?.text = "\(testDetail.mark)"
            result.testDate?.sizeToFit()
            result.testDate?.text = "Scritto " + "(" + testDetail.date + ")" + ":"
            
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
        testPicker.delegate = self
        typeForm.inputView = testPicker
        
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
        
        datePicker.backgroundColor = UIColor (red: 251/255, green: 251/255, blue: 251/255, alpha: 1)
        datePicker.clipsToBounds = false
        datePicker.layer.shadowColor = UIColor (red: 142/255, green: 142/255, blue: 142/255, alpha: 0.7).cgColor
        datePicker.layer.shadowOffset = CGSize (width: 0, height: 0)
        datePicker.layer.shadowRadius = 2.7
        datePicker.layer.shadowOpacity = 0.3
        
        datePicker.datePickerMode = .date
        datePicker.locale = Locale(identifier: "it_IT")
        
        datePicker.addTarget(self, action: #selector(StudentDetailController.dateChaged(datePicker:)), for: .valueChanged)
    }
    
    @objc func dateChaged(datePicker: UIDatePicker) {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM.yyyy"
        
        dateForm.text = dateFormatter.string(from: datePicker.date)
    }
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


