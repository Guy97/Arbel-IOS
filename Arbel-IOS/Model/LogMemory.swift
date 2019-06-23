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
    var events : [TeacherCalendar]
    var subjects : [SubjectsData]
    var courses : [CoursesData]
    var memories : [Reminder]
    
}

struct TeacherCalendar: Codable {
    var id : Int
    var user_id : Int
    var activity : String
    var day : String
    var start_hour : String
    var end_hour : String
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
    var userPicture: String
    var surname: String
    var birthday: String
    var sex: String
    var email: String
    var details: String
}

struct PostReminder: Codable {
    var memories: Reminder
    static var teacherMemory: PostReminder!
}

struct GetReminder: Codable {
    var memo: [Reminder]
    static var dataReminder: GetReminder!
}

struct Reminder: Codable {
    var id: Int
    var user_id: Int
    var memoryText: String
    var created_at: String
}

struct GetTest: Codable {
    var tests: [Test]
    static var dataTest: GetTest!
}

struct Test: Codable {
    var id: Int
    var topic_id: Int
    var questions: String
    var created_at: String
}


struct PostAbsence: Codable {
    var absence: String
}

struct PostArgument: Codable {
    var arguments: String
    //static var studentAbsence: PostAbsence!
}

struct AbsenceData: Codable {
    var student_absence: [Absence]
    static var studentAbs: AbsenceData!
}

struct Absence: Codable {
    var id: Int
    var sub_id: Int
    var stud_id: Int
    var absence_hours: Int
    var date: String
}

struct MarkData: Codable {
    var student_marks: [Mark]
    static var studentMark: MarkData!
}

struct Mark: Codable {
    var id: Int
    var sub_id: Int
    var stud_id: Int
    var mark: Int
    var tipology: String
    var date: String
}

struct TopicData: Codable {
    var arguments: [Argument]
    static var studentMark: TopicData!
}

struct Argument: Codable {
    var id: Int
    var sub_id: Int
    var topic: String
}


class API {
    class func StudentApi() {
        
        let url = URL(string: "http://arbel.test/api/user")!
        
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
    
    class func ReminderApi() {
        
        let url = URL(string: "http://arbel.test/api/getReminder")!
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
                    var postData = try jsonDecoder.decode(GetReminder.self, from: response.data!)
                    
                    GetReminder.dataReminder = postData
                }
                catch
                {
                    print(error)
                }
                
            }
        }
    }
    
    class func StudentMark() {
        
        let url = URL(string: "http://arbel.test/api/studentsMark")!
        
        
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
                    var postData = try jsonDecoder.decode(MarkData.self, from: response.data!)
                    
                    MarkData.studentMark = postData
                    
                }
                catch
                {
                    print(error)
                }
                
            }
        }
    }
    class func StudentAbs() {
        
        let url = URL(string: "http://arbel.test/api/studentsAbsence")!
        
        
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
                    var postData = try jsonDecoder.decode(AbsenceData.self, from: response.data!)
                    
                    AbsenceData.studentAbs = postData
                    
                }
                catch
                {
                    print(error)
                }
                
            }
        }
    }
    
    class func TestApi() {
        
        let url = URL(string: "http://arbel.test/api/getTest")!
        
        
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
                    var postData = try jsonDecoder.decode(GetTest.self, from: response.data!)
                    
                    GetTest.dataTest = postData
                    
        
                    
                }
                catch
                {
                    print(error)
                }
                
            }
        }
    }
    
    class func TopicApi() {
        
        let url = URL(string: "http://arbel.test/api/getArgument")!
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
                    var postData = try jsonDecoder.decode(GetReminder.self, from: response.data!)
                    
                    GetReminder.dataReminder = postData
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
        static var subID = Int()
    }
}

