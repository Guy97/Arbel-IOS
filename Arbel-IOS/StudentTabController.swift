//
//  StudentTabController.swift
//  Arbel-IOS
//
//  Created by Simone on 23/04/2019.
//  Copyright © 2019 Mac. All rights reserved.
//

import UIKit
import XLPagerTabStrip

class StudentTabController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var searchStudent: UISearchBar!
    @IBOutlet weak var searchView: UIView!
    @IBOutlet weak var studentsList: UITableView!
    
    var students = ["Piero Chiambretti", "Scemo Pagliaccio", "Marcello Pajntar", "Simone Ghisu", "Davide Coscino", "Salvatore Aranzulla", "Riccardo Mores", "Mauro Paffi", "Fabrizio Infante", "Eugenio De Medici"]
    
    override func viewDidLoad() {
        
        searchStudent.layer.masksToBounds = true
        searchStudent.backgroundColor = .white
        searchStudent.backgroundImage = nil
        searchStudent.layer.cornerRadius = 20
        
        searchView.layer.cornerRadius = 20
        searchView.layer.shadowColor = UIColor (red: 0/255, green: 0/255, blue: 0/255, alpha: 0.4).cgColor
        searchView.layer.shadowOffset = CGSize (width: 0, height: 1.2)
        searchView.layer.shadowRadius = 1.4
        searchView.layer.shadowOpacity = 0.3
        
        studentsList.dataSource = self
        studentsList.delegate = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (students.count)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let student = tableView.dequeueReusableCell(withIdentifier: "student") as! StudentCell
        student.studentName?.text = students[indexPath.row]
        return student
    }
    

}

extension StudentTabController : IndicatorInfoProvider {
    
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return IndicatorInfo(title: "Studenti")
}
}
