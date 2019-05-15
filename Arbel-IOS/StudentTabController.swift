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
    
    
    struct Preview {
        var average: Int
        var absence: Int
        var note: String
    }
//    var aaaa = [Preview(average: 28, absence: 15, note: "Soffre di DDA, picchiarlo dopo 15min")];]
    
    struct cellData {
        var opened = Bool()
        var title = String()
        var sectionData = [Preview]()
    }
    
    var tableViewData = [cellData]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        elementStyle()
        
        tableViewData = [cellData(opened: false, title: "Piero Chiambretti", sectionData: [Preview(average: 28, absence: 15, note: "Soffre di DDA, picchiarlo dopo 15min")]),
                         cellData(opened: false, title: "Mauro Paffi", sectionData: [Preview(average: 15, absence: 1, note: "non è molto, ma è un lavoro onesto")]),
                         cellData(opened: false, title: "Riccardo Mores", sectionData: [Preview(average: 28, absence: 15, note: "Studente mai visto in aula, ogni volta che faccio l'appello mi da una mela.")])]
    
        studentsList.dataSource = self
        studentsList.delegate = self
        
        //        Riprende i dati in arrivo dalla funzione (vedi complete)
//        StudentListModel().fetchEvents(complete: {
//            (students) in self.students = students
//            //            Viene gestita l'esecuzione di più elementi di lavoro
//            let queue = DispatchQueue.main
//
//            queue.async(execute: {
//                self.studentsList.delegate = self
//                self.studentsList.dataSource = self
//                self.studentsList?.reloadData()
//            })
//        })
        

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
//        return (students.count)
        
        if tableViewData[section].opened == true {
            return tableViewData[section].sectionData.count + 1
        }
        else {
            return 1
        }
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
//        return 1
        
        return (tableViewData.count)
        
        
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let dataIndex = indexPath.row - 1
        
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "student") as! StudentCell
            
            let student = tableViewData[indexPath.section]
            
            cell.studentName?.text = student.title
            
//            cell.studentName?.text = tableViewData[indexPath.section].title
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
            
//            performSegue(withIdentifier: "showDetail", sender: self)
        }
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
//        if sender.isSelected {
//            sender.isSelected = false
//        }
//        else {
//            sender.isSelected = true
//        }
    }
}

extension StudentTabController : IndicatorInfoProvider {
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return IndicatorInfo(title: "Studenti")
    }
}
