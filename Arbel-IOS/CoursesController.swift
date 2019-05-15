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
    
//    var courses = [CoursesData]()
    
    var coursesData = Users.userLogin.success.courses
    
    struct Course {
        var yearCourse: Int
        var course: String
    }
    
//    var coursesArray = ["Media Design"," Media Design","Video Design","Sound Design"]
    
    var coursesArray = [Course(yearCourse: 1, course: "Media Design"),Course(yearCourse: 2, course: "Media Design"),Course(yearCourse: 2, course: "Video Design"),Course(yearCourse: 3, course: "Sound Design")]

    override func viewDidLoad() {
        super.viewDidLoad()
        coursesList.dataSource = self
        coursesList.delegate = self
        
//        LogInController().fetchEvents(complete: {
//            (courses) in self.courses = courses
//            //            Viene gestita l'esecuzione di più elementi di lavoro
//            let queue = DispatchQueue.main
//
//            queue.async(execute: {
//                self.coursesList.delegate = self
//                self.coursesList.dataSource = self
//                self.coursesList?.reloadData()
//            })
//        })
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
//        cell.year?.text = courseDetail.yearCourse
        
//        cell.courseName?.text = coursesArray[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print ("You selected cell #\(indexPath.row)!")
        tableView.deselectRow(at: indexPath, animated: true)
        performSegue(withIdentifier: "showStudent", sender: self)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
}
