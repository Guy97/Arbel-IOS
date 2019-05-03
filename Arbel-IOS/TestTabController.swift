//
//  TestTabController.swift
//  Arbel-IOS
//
//  Created by Simone on 23/04/2019.
//  Copyright © 2019 Mac. All rights reserved.
//

import UIKit
import XLPagerTabStrip

class TestTabController: UIViewController, UITableViewDelegate {

    @IBOutlet weak var searchView: UIView!
    @IBOutlet weak var searchTest: UISearchBar!
    @IBOutlet weak var testList: UITableView!
    @IBOutlet weak var addButton: UIButton!
    
    var arguments = ["Programmazione", "Graphic Design", "Video Design", "Semiotica dell'arte", "TTPF", "IOS", "Android", "Web Laravel", "Motion Graphic"]
    
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
        
        // Styles00
        addButton.layer.cornerRadius = 8
        addButton.layer.shadowColor = UIColor (red: 142/255, green: 142/255, blue: 142/255, alpha: 0.5).cgColor
        addButton.layer.shadowOffset = CGSize (width: 0, height: 1.0)
        addButton.layer.shadowRadius = 1.1
        addButton.layer.shadowOpacity = 0.5
        
        let insets = UIEdgeInsets(top: 0, left: 0, bottom: 40, right: 0)
        self.testList.contentInset = insets
    }
}


extension TestTabController : IndicatorInfoProvider {
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return IndicatorInfo(title: "Test")
    }   
}
