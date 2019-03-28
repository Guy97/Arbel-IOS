//
//  FirstController.swift
//  Arbel-IOS
//
//  Created by Mac on 18/03/2019.
//  Copyright © 2019 Mac. All rights reserved.
//

import UIKit

   var list = ["tanto non si vede"]


class FirstController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var noteTableView: UITableView!
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (list.count)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let note = UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: "note")
        
        
        
        let note = tableView.dequeueReusableCell(withIdentifier: "note") as! UITableViewCell
        _ = list[indexPath.row]
        
        
        
//        note.textLabel?.text = list[indexPath.row]

        
//        note.textLabel?.text = list[indexPath.row]
    
        
        return note
    }
    
    private func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCell.EditingStyle.delete {
            list.remove(at: indexPath.row)
            noteTableView.reloadData()
            
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        noteTableView.reloadData()
    }
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        noteTableView.separatorColor = UIColor (white: 0.95, alpha: 1)
        noteTableView.dataSource = self
        noteTableView.delegate = self
        // Do any additional setup after loading the view, typically from a nib.
        
         
        
    }
    
    
}
