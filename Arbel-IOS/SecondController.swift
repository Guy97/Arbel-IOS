//
//  SecondController.swift
//  Arbel-IOS
//
//  Created by Mac on 19/03/2019.
//  Copyright © 2019 Mac. All rights reserved.
//

import UIKit
import FSCalendar

class SecondController: UIViewController, FSCalendarDataSource, FSCalendarDelegate {
    
    @IBOutlet weak var calendar: FSCalendar!
    @IBOutlet weak var display: UITextView!
    fileprivate weak var calendar2: FSCalendar!
    
    let calendario = FSCalendarCell.self
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        print("second.")
        
        calendar.dataSource = self
        calendar.delegate = self
        view.addSubview(calendar)
        //self.calendar = calendar
        //display.text = "\(calendar.)"
        
        
    }
    
    @IBAction func swipeControl(sender: UISwipeGestureRecognizer) {
        if sender.direction == UISwipeGestureRecognizer.Direction.left {
            self.tabBarController?.selectedIndex = 2
        }
        else if sender.direction == UISwipeGestureRecognizer.Direction.right {
            self.tabBarController?.selectedIndex = 0
        }
    }
}
