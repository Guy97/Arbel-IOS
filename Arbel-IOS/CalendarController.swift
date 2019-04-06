//
//  SecondController.swift
//  Arbel-IOS
//
//  Created by Mac on 19/03/2019.
//  Copyright © 2019 Mac. All rights reserved.
//

import UIKit
import FSCalendar

class CalendarController: UIViewController, FSCalendarDataSource, FSCalendarDelegate  {
    
    @IBOutlet weak var calendar: FSCalendar!
    @IBOutlet weak var activityContainer: UIView!
    @IBOutlet weak var day: UILabel!
    
    fileprivate weak var calendar2: FSCalendar!
    let calendario: FSCalendarCell = FSCalendarCell()
    let calendario2: FSCalendarEventIndicator = FSCalendarEventIndicator()
    let calendario3: FSCalendarDelegationFactory =  FSCalendarDelegationFactory()
    
    
   
    
//    let calendario = FSCalendarCell().titleLabel
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // Styles00
        activityContainer.layer.cornerRadius = 19
        activityContainer.layer.shadowColor = UIColor (red: 142/255, green: 142/255, blue: 142/255, alpha: 0.5).cgColor
        activityContainer.layer.shadowOffset = CGSize (width: 0, height: 0.5)
        activityContainer.layer.shadowRadius = 1.8
        activityContainer.layer.shadowOpacity = 0.6
        let formatter = DateFormatter()
        formatter.setLocalizedDateFormatFromTemplate("EEEE")
        formatter.locale =  Locale(identifier: "it_IT")
        let today = formatter.string(from: Date())
        day.text = "\(today)"
        
        
        
        
        let prova = calendar.selectedDates
        print("orco", prova)
        
        
    }
    
}
