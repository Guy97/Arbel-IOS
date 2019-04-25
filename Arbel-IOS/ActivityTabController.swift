//
//  ActivityTabController.swift
//  Arbel-IOS
//
//  Created by Simone on 23/04/2019.
//  Copyright © 2019 Mac. All rights reserved.
//

import UIKit
import XLPagerTabStrip

class ActivityTabController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var showActivity: UIView!
    @IBOutlet weak var activityTableView: UITableView!
    
    var activityArray = ["Nome Argomento 1", "Nome Argomento 2", "Nome Argomento 3", "Nome Argomento 4"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        elementStyle()
        
        activityTableView.dataSource = self
        activityTableView.delegate = self
    }
    
    func elementStyle() {
        showActivity.layer.shadowColor = UIColor (red: 142/255, green: 142/255, blue: 142/255, alpha: 0.5).cgColor
        showActivity.layer.shadowOffset = CGSize (width: 0, height: 0.5)
        showActivity.layer.shadowRadius = 1.8
        showActivity.layer.shadowOpacity = 0.6
        
        showActivity.layer.cornerRadius = 10
        showActivity.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (activityArray.count)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let activity = tableView.dequeueReusableCell(withIdentifier: "activity") as! ActivityCell
            activity.argumentName?.text = activityArray[indexPath.row]
            return activity
        }
}

extension ActivityTabController : IndicatorInfoProvider {
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return IndicatorInfo(title: "Attività")
    }
}
