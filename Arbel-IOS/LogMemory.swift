//
//  LogMemory.swift
//  Arbel-IOS
//
//  Created by Simone on 29/03/2019.
//  Copyright © 2019 Mac. All rights reserved.
//

import Foundation



struct Users: Codable {
    var success: UsersData
    static var userLogin: Users!
}

struct UsersData: Codable {
    var id : Int
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
    static var sillixi: CoursesData!
    
    
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


//extension usersData {
//    init?(json: [String: Any]) {
//        guard let id = json["id"] as? Int,
//            let name = json["name"] as? String,
//            let surname = json["surname"] as? String,
//            let email = json["email"] as? String
//            else {
//                return nil
//        }
//
//
//        self.id = id
//        self.name = name
//        self.surname = surname
//        self.email = email
//    }
//}
