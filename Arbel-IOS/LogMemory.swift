//
//  LogMemory.swift
//  Arbel-IOS
//
//  Created by Simone on 29/03/2019.
//  Copyright © 2019 Mac. All rights reserved.
//

import Foundation



struct users: Codable {
    var success: usersData
    
}


struct usersData: Codable {
    var id : Int
    var name : String
    var surname : String
    var email : String
    
    
    
    
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
