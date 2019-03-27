//
//  ThirdController.swift
//  Arbel-IOS
//
//  Created by Mac on 19/03/2019.
//  Copyright © 2019 Mac. All rights reserved.
//

import UIKit

class ThirdController: UIViewController ,UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet weak var classContainer00: UIView!
    @IBOutlet weak var classContainer01: UIView!
    @IBOutlet weak var classContainer02: UIView!
    @IBOutlet weak var classContainer03: UIView!
    
    @IBOutlet var tableView: UITableView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        // Styles00
//        classContainer00.layer.cornerRadius = 8
//        classContainer00.layer.shadowColor = UIColor (red: 142/255, green: 142/255, blue: 142/255, alpha: 0.5).cgColor
//        classContainer00.layer.shadowOffset = CGSize (width: 0, height: 1.1)
//        classContainer00.layer.shadowRadius = 1.1
//        classContainer00.layer.shadowOpacity = 0.7
//
//        // Styles01
//        classContainer01.layer.cornerRadius = 8
//        classContainer01.layer.shadowColor = UIColor (red: 142/255, green: 142/255, blue: 142/255, alpha: 0.5).cgColor
//        classContainer01.layer.shadowOffset = CGSize (width: 0, height: 1.1)
//        classContainer01.layer.shadowRadius = 1.1
//        classContainer01.layer.shadowOpacity = 0.7
//
//        // Styles02
//        classContainer02.layer.cornerRadius = 8
//        classContainer02.layer.shadowColor = UIColor (red: 142/255, green: 142/255, blue: 142/255, alpha: 0.5).cgColor
//        classContainer02.layer.shadowOffset = CGSize (width: 0, height: 1.1)
//        classContainer02.layer.shadowRadius = 1.1
//        classContainer02.layer.shadowOpacity = 0.7
//
//        // Styles03
//        classContainer03.layer.cornerRadius = 8
//        classContainer03.layer.shadowColor = UIColor (red: 142/255, green: 142/255, blue: 142/255, alpha: 0.5).cgColor
//        classContainer03.layer.shadowOffset = CGSize (width: 0, height: 1.1)
//        classContainer03.layer.shadowRadius = 1.1
//        classContainer03.layer.shadowOpacity = 0.7
        
        
        tableView.separatorColor = UIColor(white: 1, alpha: 1)
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 8
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! UITableViewCell
        
        cell.contentView.backgroundColor = UIColor(red: 251/255, green: 251/255, blue: 251/255, alpha: 1)
        return cell
    }
    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        <#code#>
//    }

}
