//
//  ActivityTabController.swift
//  Arbel-IOS
//
//  Created by Simone on 23/04/2019.
//  Copyright © 2019 Mac. All rights reserved.
//

import UIKit
import XLPagerTabStrip

class ActivityTabController: UIViewController {

    @IBOutlet weak var showActivity: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        showActivity.layer.shadowColor = UIColor (red: 142/255, green: 142/255, blue: 142/255, alpha: 0.5).cgColor
        showActivity.layer.shadowOffset = CGSize (width: 0, height: 0.5)
        showActivity.layer.shadowRadius = 1.8
        showActivity.layer.shadowOpacity = 0.6
        
        showActivity.layer.cornerRadius = 10
        showActivity.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
    }
    


}

extension ActivityTabController : IndicatorInfoProvider {
    
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return IndicatorInfo(title: "Attività")
}
}
