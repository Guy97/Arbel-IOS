//
//  LogMemory.swift
//  Arbel-IOS
//
//  Created by Simone on 29/03/2019.
//  Copyright © 2019 Mac. All rights reserved.
//

import Foundation

class LogMemory: Codable {
    
    var note : String
    var date : String
    
}

////note object
//let memory : LogMemory = LogMemory(name: "", mov)
//
////encode
//var data : Data!
//do {
//    let encoder :JSONEncoder = JSONEncoder()
//    data = try encoder.encode(memory)
//    let jsonString = String(data: data, encoding: .utf8)
//    print("JSON string: \(jsonString!)")
//}catch{}
//
////decode
//do {
//    let decoder :JSONDecoder = JSONDecoder()
//    let flashMovie = try decoder.decode(Movie.self, from: data)
//    print("Movie name: \(flashMovie.name)")
//}catch{}


