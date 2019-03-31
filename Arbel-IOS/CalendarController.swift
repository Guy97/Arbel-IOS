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
        
        print("second.")
        
        print("second.")
        print(calendar2, "questo")
     
        calendar.dataSource = self
        calendar.delegate = self
        view.addSubview(calendar)
        //self.calendar = calendar
        print(calendario, "QUESTO")
        //display.text = "\(calendar.)"
        
        
    }
    
}
