//
//  StudentTabController.swift
//  Arbel-IOS
//
//  Created by Simone on 23/04/2019.
//  Copyright © 2019 Mac. All rights reserved.
//

import UIKit
import XLPagerTabStrip
import Alamofire
import Kingfisher


class StudentTabController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var searchStudent: UISearchBar!
    @IBOutlet weak var searchView: UIView!
    @IBOutlet weak var studentsList: UITableView!
    @IBOutlet weak var saveButton: UIButton!
    
    var studentsLog = Students.studentList.students
    var coursesData = Users.userLogin.success.courses
    
    struct Preview {
        var average: Int
        var absence: Int
        var note: String
    }
    
    struct cellData {
        var opened = Bool()
        var userImage = String()
        var title = String()
//        var check = Button()
        var sectionData = [Preview]()
    }
    
    var tableViewData = [cellData]()
    var absence = [Int]()
    var absenceSelect = [Int]()
    override func viewDidLoad() {
        super.viewDidLoad()
        studentsList.dataSource = self
        studentsList.delegate = self
        self.title = "hhhh"

    
        var CourseCell_id = PassData.globalVariable.passData
        
        elementStyle()
        
        print("\(CourseCell_id)", "ORAAA")
        
        for student in Students.studentList.students.filter( { return ($0.class_id == CourseCell_id) } ) {
            if (student.class_id == CourseCell_id) {
                
//                let url = URL(string: student.userPicture)
                
                tableViewData.append(cellData(opened: false, userImage: "\(student.userPicture)", title: "\(student.name) " + "\(student.surname)", sectionData: [Preview(average: 28, absence: 15, note: "\(student.details)")]))
                
            }
        }
        
    }
    
    func elementStyle() {
        searchStudent.layer.masksToBounds = true
        searchStudent.backgroundColor = .white
        searchStudent.backgroundImage = nil
        searchStudent.layer.cornerRadius = 20
        
        searchView.layer.cornerRadius = 20
        searchView.layer.shadowColor = UIColor (red: 0/255, green: 0/255, blue: 0/255, alpha: 0.4).cgColor
        searchView.layer.shadowOffset = CGSize (width: 0, height: 1.2)
        searchView.layer.shadowRadius = 1.4
        searchView.layer.shadowOpacity = 0.3
        
        let insets = UIEdgeInsets(top: 0, left: 0, bottom: 40, right: 0)
        self.studentsList.contentInset = insets
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableViewData[section].opened == true {
            return tableViewData[section].sectionData.count + 1
        }
        else {
            return 1
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return (tableViewData.count)
        
        
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let dataIndex = indexPath.row - 1
        
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "student") as! StudentCell
            
            let studentSection = tableViewData[indexPath.section]
            
            
            cell.checkButton.tag = indexPath.section
            cell.checkButton.addTarget(self, action: #selector(checkBoxTapped(_:)), for: .touchUpInside)

            
            cell.studentName?.text = studentSection.title
//            let urla = URL(string: url)
            let placeholder = UIImage(named: "userPicture")
            let urlImage = URL(string: studentSection.userImage)
            cell.userPicture?.kf.setImage(with: urlImage, placeholder: placeholder)
//
//            if studentsList.cellForRow(at: indexPath)?.accessoryType == UITableViewCell.AccessoryType.checkmark {
//
//                studentsList.cellForRow(at: indexPath)?.accessoryType = UITableViewCell.AccessoryType.none
//
//            } else {
//
//                studentsList.cellForRow(at: indexPath)?.accessoryType = UITableViewCell.AccessoryType.checkmark
//
//            }
            
            return cell
        }
            
        else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! StudentCell
            let previewDetail = tableViewData[indexPath.section].sectionData[dataIndex]
            
            
            cell.noteUser?.sizeToFit()
            cell.noteUser?.text = previewDetail.note
            
            let averageConverted = "\(previewDetail.average)"
            cell.averageUser?.text = "MEDIA: " + averageConverted
            
            let absenceConverted = "\(previewDetail.absence)"
            cell.absenceUser?.sizeToFit()
            cell.absenceUser?.text = "ASSENZE: " + absenceConverted + "%"
            
            
            return cell
        }
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        if indexPath.row == 0 {
            if tableViewData[indexPath.section].opened == true {
                tableViewData[indexPath.section].opened = false
                let sections = IndexSet.init(integer: indexPath.section)
                tableView.reloadSections(sections, with: .none)
               
            }
            else{
                tableViewData[indexPath.section].opened = true
                let sections = IndexSet.init(integer: indexPath.section)
                tableView.reloadSections(sections, with: .none)
            }
        }
        
        var studentID = 0
        var data = Students.studentList.students.filter( { return ($0.class_id == PassData.globalVariable.passData) } )
        var detectStudent = data.map {($0).id}
        studentID = detectStudent[indexPath.section]
        
        PassData.globalVariable.studentID = studentID
        
        print(studentID, "QUIII")
        
        
    }
    
    
    @IBAction func checkBoxTapped(_ sender: UIButton) {


        UIView.animate(withDuration: 0.1, delay: 0.01, options: .curveLinear, animations: {
            sender.transform = CGAffineTransform(scaleX: 0.85, y: 0.85)

        }) { (success) in
            sender.isSelected = !sender.isSelected
            UIView.animate(withDuration: 0.1, delay: 0.01, options: .curveLinear, animations: {
                sender.transform = .identity
            }, completion: nil)
        }
        

        
       
        
        
        
        var position: CGPoint = sender.convert(.zero, to: self.studentsList)
        
        
        let indexPath = self.studentsList.indexPathForRow(at: position)
//        let cell: StudentCell = studentsList.cellForRow(at: IndexPath(row: 0, section: sender.tag)) as!
//        StudentCell
        
        var studentID = 0
        var data = Students.studentList.students.filter( { return ($0.class_id == PassData.globalVariable.passData) } )
        var detectStudent = data.map {($0).id}
        studentID = detectStudent[(indexPath?.section)!]

        print(studentID, "pulizia")
        absence.append(studentID)
    }
    
    @IBAction func saveAbsence() {
        var hours = 0
        let mappedItems = absence.map { ($0, 1) }
        let counts = Dictionary(mappedItems, uniquingKeysWith: +)
        for (key, value) in counts {
            if value % 2 != 0 {
                for i in 0 ..< absence.count {
                    if absence[i] == key {
                        //absence.remove(at: absence[i])
                        absenceSelect.append(absence[i])
                    }
                }
            }
        }
        for subject in Users.userLogin.success.subjects {
            if subject.id == PassData.globalVariable.subID {
                hours += subject.totHours
            }
        }
        print(hours, "ore")
        print(absenceSelect, "assenze")
        for i in 0 ..< absenceSelect.count {
            let postDict:[String:Int] = ["absence_hours": 300/hours, "stud_id": absenceSelect[i], "sub_id": PassData.globalVariable.subID]
        
        let headers: HTTPHeaders = [
            "Authorization": "Bearer \(Users.userLogin.success.token)",
            "Accept": "application/json"
        ]
        
        Alamofire.request("http://arbel.test/api/postAbsence", method: .post, parameters: postDict, headers: headers).responseJSON {response in
            if let data = response.data, let utf8Text = String(data: data, encoding: .utf8) {
                do {
                    
                    let jsonDecoder = JSONDecoder()
                    var postData = try jsonDecoder.decode(PostAbsence.self, from: response.data!)
                    print(postData, "UDITE")
                    
                    
                }
                catch
                {
                    print(error)
                    
                }
                
            }
            
         
        }
        }
    }
}

extension StudentTabController : IndicatorInfoProvider {
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {

        return IndicatorInfo(title: "Studenti")

    }
}
