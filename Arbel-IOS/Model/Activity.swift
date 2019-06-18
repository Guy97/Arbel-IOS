//
//  Activity.swift
//  Arbel-IOS
//
//  Created by Simone on 21/04/2019.
//  Copyright © 2019 Mac. All rights reserved.
//

import UIKit

extension Date {
    func string(format: String) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        return formatter.string(from: self)
    }
}

class Activity {

var hour = ""
var work = ""
var color: UIColor

init(hour: String, work: String, color: UIColor)
{
    self.hour = hour
    self.work = work
    self.color = color
}
    
    static func fetchActivities() -> [Activity]
    {
        var calendarTeacher = [Activity]()
        //print("data", Date().string(format: "yyyy-MM-dd"))
        for event in Users.userLogin.success.events {
            if "\(Date().string(format: "yyyy-MM-dd"))" == event.day {
                calendarTeacher.append(Activity(hour: "8:30 - 11:30", work: "\(event.activity)", color: UIColor.white))
            }
        }
        if !calendarTeacher.isEmpty {
            return calendarTeacher
        }
        else {
            return [Activity(hour: "", work: "Oggi niente lezione", color: UIColor.white)]
        }
    }
}
