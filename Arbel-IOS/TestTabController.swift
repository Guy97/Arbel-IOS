//
//  TestTabController.swift
//  Arbel-IOS
//
//  Created by Simone on 23/04/2019.
//  Copyright © 2019 Mac. All rights reserved.
//

import UIKit
import XLPagerTabStrip

class TestTabController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var searchView: UIView!
    @IBOutlet weak var searchTest: UISearchBar!
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var argumentTableView: UITableView!
    
    
    var arguments = ["Argomento 1", "Argomento 2", "Argomento 3", "Argomento 4", "Tutti gli argomenti"]
  
    override func viewDidLoad() {
        elementStyle()
        
        argumentTableView.dataSource = self
        argumentTableView.delegate = self
        
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

       
        let insets = UIEdgeInsets(top: 0, left: 0, bottom: 40, right: 0)
//        self.testList.contentInset = insets
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (arguments.count)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let argument = tableView.dequeueReusableCell(withIdentifier: "argument") as! StudentCell
        
        argument.argumentName?.text = arguments[indexPath.row]
        return argument
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        performSegue(withIdentifier: "showArgument", sender: self)
    }
}


extension TestTabController : IndicatorInfoProvider {
    
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        
        return IndicatorInfo(title: "Test")
     
    }
    
}



