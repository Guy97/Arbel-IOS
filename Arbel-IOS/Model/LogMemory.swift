//
//  LogMemory.swift
//  Arbel-IOS
//
//  Created by Simone on 29/03/2019.
//  Copyright © 2019 Mac. All rights reserved.
//

import Foundation
import Alamofire


struct Users: Codable {
    var success: UsersData
    static var userLogin: Users!
}

struct UsersData: Codable {
    var id : Int
    var token : String
    var name : String
    var surname : String
    var email : String
    var subjects : [SubjectsData]
    var courses : [CoursesData]
    
}

struct SubjectsData: Codable {
    var id : Int
    var user_id : Int
    var class_id : Int
    var subjectName : String
    var credits : Int
    var totHours : Int
}

struct CoursesData: Codable {
    var id: Int
    var course: String
    var year: Int
    var section: String    
    
}

struct Students: Codable {
    var students: [StudentData]
    static var studentList: Students!
}

struct StudentData: Codable {
    var id: Int
    var class_id: Int
    var badgeNumber: Int
    var name: String
    var surname: String
    var birthday: String
    var sex: String
    var email: String
    //var details: String
}

class API {
    class func StudentApi() {
        
        let url = URL(string: "http://arbel.test/api/user")!
        print("URCA")
        
        let headers: HTTPHeaders = [
            "Authorization": "Bearer \(Users.userLogin.success.token)",
            "Accept": "application/json"
        ]
        
        Alamofire.request(url, method: .get, headers: headers).responseJSON{
            
            response in //response serialization result
            if let data = response.data, let utf8Text = String(data: data, encoding: .utf8) {
                print("Data: \(utf8Text)") // original server data as UTF8 string
                do {
                    
                    let jsonDecoder = JSONDecoder()
                    var postData = try jsonDecoder.decode(Students.self, from: response.data!)
                    Students.studentList = postData
                    
                    print(postData, "dati ora")
                    
                    let getStudent = postData.students
                    var filteredStudent = getStudent.map { ($0).name}
                    
                    print(filteredStudent, "Vai stronzo")
                    
                }
                catch
                {
                    print(error)
                }
            }
        }
    }
}

struct PassData {
    struct globalVariable {
        static var passData = Int()
        static var studentID = Int()
    }
}

