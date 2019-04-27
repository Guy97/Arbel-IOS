//
//  LogMemory.swift
//  Arbel-IOS
//
//  Created by Simone on 29/03/2019.
//  Copyright © 2019 Mac. All rights reserved.
//

import Foundation

struct usersData: Codable {
    var id : Int
    var name : String
    var surname : String
    var email : String
    
    init(id: Int = 0, name: String = "", surname: String = "", email: String = "") {
        self.id = id
        self.name = name
        self.surname = surname
        self.email = email
    }
}

struct users: Codable {
    var success: usersData
    
}
