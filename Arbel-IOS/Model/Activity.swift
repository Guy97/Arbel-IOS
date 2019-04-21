//
//  Activity.swift
//  Arbel-IOS
//
//  Created by Simone on 21/04/2019.
//  Copyright © 2019 Mac. All rights reserved.
//

import UIKit

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
        return [
            Activity(hour: "8:30 - 11:30", work: "2° Media Design (S106), programmazione 2", color: UIColor.white),
            Activity(hour: "9:00 - 12:00", work: "2° Media Design (S106), programmazione 2", color: UIColor.white),
            Activity(hour: "12:30 - 15:30", work: "1° Video Design (S8), After Effects", color: UIColor.white),
            Activity(hour: "16:00 - 18:00", work: "//", color: UIColor.white),

        ]
    }
}
