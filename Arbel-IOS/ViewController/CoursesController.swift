//
//  ThirdController.swift
//  Arbel-IOS
//
//  Created by Mac on 19/03/2019.
//  Copyright © 2019 Mac. All rights reserved.
//

import UIKit

class CoursesController: UIViewController ,UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var coursesList: UITableView!

    var coursesData = Users.userLogin.success.courses
    var subjectData = Users.userLogin.success.subjects
    
    struct Course {
        var yearCourse: Int
        var course: String
    }
    
//    var coursesArray = [Course(yearCourse: 1, course: "Media Design"),Course(yearCourse: 2, course: "Media Design"),Course(yearCourse: 2, course: "Video Design"),Course(yearCourse: 3, course: "Sound Design")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        API.StudentApi()
        coursesList.dataSource = self
        coursesList.delegate = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (coursesData.count)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "course") as! CourseCell
        
        let courseDetail = coursesData[indexPath.row]
        cell.courseName?.text = courseDetail.course
    
        let yearConverted = "\(courseDetail.year)"
        cell.year?.text = yearConverted + "°"

        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        tableView.deselectRow(at: indexPath, animated: true)
        performSegue(withIdentifier: "showStudent", sender: self)
        
        var courseID = 0
        var filt = coursesData.map {($0).id}
        courseID = filt[indexPath.row]
        PassData.globalVariable.passData = courseID
        
        var subjectID = 0
        var subfilt = subjectData.map {($0).id}
        subjectID = subfilt[indexPath.row]
        PassData.globalVariable.subID = subjectID
        
        print(courseID, "CLICCA CLICCA")
        print(subjectID, "CLICCA")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
}
