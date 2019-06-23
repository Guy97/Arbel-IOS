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
        for event in Users.userLogin.success.events {
            if "\(Date().string(format: "yyyy-MM-dd"))" == event.day {
                calendarTeacher.append(Activity(hour: "\(event.start_hour) - \(event.end_hour)", work: "\(event.activity)", color: UIColor.white))
            }
        }
        if !calendarTeacher.isEmpty {
            return calendarTeacher
        }
        else {
            return [Activity(hour: "Tranquillo", work: "Non hai lezioni oggi, concediti un giorno di riposo!", color: UIColor.white)]
        }
    }
}
