//
//  SecondController.swift
//  Arbel-IOS
//
//  Created by Mac on 19/03/2019.
//  Copyright © 2019 Mac. All rights reserved.
//

import UIKit
import FSCalendar

class CalendarController: UIViewController, UITableViewDelegate, UITableViewDataSource, FSCalendarDataSource, FSCalendarDelegate   {
    
    var calendarData = Users.userLogin.success.events
    
    @IBOutlet weak var calendar: FSCalendar!
    @IBOutlet weak var activityContainer: UIView!
    @IBOutlet weak var day: UILabel!
    @IBOutlet weak var calendarTableView: UITableView!
    
    struct Lessons {
        var hour: String
        var activity: String
    }
    
    var eventData = [Lessons]();
    
    fileprivate weak var calendar2: FSCalendar!
    let calendario: FSCalendarCell = FSCalendarCell()
    let calendario2: FSCalendarEventIndicator = FSCalendarEventIndicator()
    let calendario3: FSCalendarDelegationFactory =  FSCalendarDelegationFactory()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        elementStyle()
        
        calendarTableView.dataSource = self
        calendarTableView.delegate = self
        
        let formatter = DateFormatter()
        formatter.setLocalizedDateFormatFromTemplate("EEEE dd")
        formatter.locale =  Locale(identifier: "it_IT")
        let today = formatter.string(from: Date())
        day.text = "\(today)".uppercased()
        
        for event in Users.userLogin.success.events {
            if "\(Date().string(format: "yyyy-MM-dd"))" == event.day {
                eventData.append(Lessons(hour: "\(event.start_hour) - \(event.end_hour) ", activity: "\(event.activity)"))
            }
        }
    }
    
    func elementStyle() {
        activityContainer.layer.cornerRadius = 16
        activityContainer.layer.shadowColor = UIColor (red: 142/255, green: 142/255, blue: 142/255, alpha: 0.5).cgColor
        activityContainer.layer.shadowOffset = CGSize (width: 0, height: 0.5)
        activityContainer.layer.shadowRadius = 1.8
        activityContainer.layer.shadowOpacity = 0.6
    }
    
    fileprivate lazy var dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.setLocalizedDateFormatFromTemplate("EEEE dd")
        formatter.locale = Locale(identifier: "it_IT")
        
        return formatter
    }()
    
    fileprivate lazy var dateFormatter2: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter
    }()
    
    
    func calendar(_ calendar: FSCalendar, numberOfEventsFor date: Date) -> Int {
        var filteredDay = calendarData.map { ($0).day}
        
        let dateString = self.dateFormatter2.string(from: date)
        
        if filteredDay.contains(dateString) {
            return 1
        }
        
        return 0
    }
    
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
        
        let dateString = self.dateFormatter.string(from: date)
        let dateStringLong = self.dateFormatter2.string(from: date)
        
        day.text = dateString.uppercased()
        
        for event in Users.userLogin.success.events {
            if dateStringLong == event.day {
                
                eventData.removeAll()
                eventData.append(Lessons(hour: "\(event.start_hour) - \(event.end_hour)", activity: "\(event.activity)"))
                calendarTableView.reloadData()
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (eventData.count)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "singleActivity") as! ActivityCell
        
        let activityDetail = eventData[indexPath.row]
        cell.hourActivity?.text = activityDetail.activity
        cell.currentActivity?.text = activityDetail.hour
        
        return cell
    }
}
