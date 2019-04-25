//
//  TestTabController.swift
//  Arbel-IOS
//
//  Created by Simone on 23/04/2019.
//  Copyright © 2019 Mac. All rights reserved.
//

import UIKit
import XLPagerTabStrip

class TestTabController: UIViewController {

    @IBOutlet weak var searchView: UIView!
    @IBOutlet weak var searchTest: UISearchBar!
    override func viewDidLoad() {
        elementStyle()
        
        super.viewDidLoad()
    }
    
    func elementStyle() {
        searchTest.layer.masksToBounds = true
        searchTest.backgroundColor = .white
        searchTest.backgroundImage = nil
        searchTest.layer.cornerRadius = 20
        
        searchView.layer.cornerRadius = 20
        searchView.layer.shadowColor = UIColor (red: 0/255, green: 0/255, blue: 0/255, alpha: 0.4).cgColor
        searchView.layer.shadowOffset = CGSize (width: 0, height: 1.2)
        searchView.layer.shadowRadius = 1.4
        searchView.layer.shadowOpacity = 0.3
        self.view.backgroundColor = UIColor(white: 1, alpha: 0)
    }
}

extension TestTabController : IndicatorInfoProvider {
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return IndicatorInfo(title: "Test")
    }   
}
