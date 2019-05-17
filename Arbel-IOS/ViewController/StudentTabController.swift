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
import SwiftyJSON

class StudentTabController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var searchStudent: UISearchBar!
    @IBOutlet weak var searchView: UIView!
    @IBOutlet weak var studentsList: UITableView!
    @IBOutlet weak var saveButton: UIButton!
    
    var studentsLog = Students.studentList.students

    struct Preview {
        var average: Int
        var absence: Int
        var note: String
    }
    
    struct cellData {
        var opened = Bool()
        var title = String()
        var sectionData = [Preview]()
    }
    
    var tableViewData = [cellData]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var CourseCell_id = PassData.globalVariable.passData
        
        elementStyle()
        for student in Students.studentList.students {
            if (student.class_id == CourseCell_id) {
                
                tableViewData.append(cellData(opened: false, title: "\(student)", sectionData: [Preview(average: 28, absence: 15, note: "Soffre di DDA, picchiarlo dopo 15min")]))
            }
        }
        
        studentsList.dataSource = self
        studentsList.delegate = self

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
            
            let student = studentsLog[indexPath.section]
            
            cell.studentName?.text = student.name + " " + student.surname
            
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
        var detectStudent = studentsLog.map {($0).id}
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
    }
}

extension StudentTabController : IndicatorInfoProvider {
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return IndicatorInfo(title: "Studenti")
    }
}
