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

    @IBOutlet weak var calendar: FSCalendar!
    @IBOutlet weak var activityContainer: UIView!
    @IBOutlet weak var day: UILabel!
    @IBOutlet weak var calendarTableView: UITableView!
    
    struct Lessons {
        var hour: String
        var activity: String
    }
    
//    var activityArray = [Lessons]()
    var activityArray = [Lessons(hour: "8:30 - 11:30", activity: "Prima fascia oraria"),Lessons(hour: "9:00 - 12:00", activity: "Seconda fascia oraria"),Lessons(hour: "12:30 - 15:00", activity: "Terza fascia oraria"),Lessons(hour: "15:30 - 18:30", activity: "Quarta fascia oraria")]
    
//    var activityArray = ["Prima fascia oraria","Seconda fascia oraria","Terza fascia oraria","Quarta fascia oraria"]

    
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
        
        
    
//        let prova = calendar.selectedDates
//        print("orco", prova)
        
    }
    
    func elementStyle() {
        activityContainer.layer.cornerRadius = 16
        activityContainer.layer.shadowColor = UIColor (red: 142/255, green: 142/255, blue: 142/255, alpha: 0.5).cgColor
        activityContainer.layer.shadowOffset = CGSize (width: 0, height: 0.5)
        activityContainer.layer.shadowRadius = 1.8
        activityContainer.layer.shadowOpacity = 0.6
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (activityArray.count)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "singleActivity") as! ActivityCell
        let activityDetail = activityArray[indexPath.row]
        cell.hourActivity?.text = activityDetail.activity
        cell.currentActivity?.text = activityDetail.hour
        
        
        return cell
    }
}
