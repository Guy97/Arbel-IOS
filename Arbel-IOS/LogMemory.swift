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

struct Api {
    static var cazzo: Any?

}
