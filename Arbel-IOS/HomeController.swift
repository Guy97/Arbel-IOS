//
//  FirstController.swift
//  Arbel-IOS
//
//  Created by Mac on 18/03/2019.
//  Copyright © 2019 Mac. All rights reserved.
//

import UIKit

    var list = [String]()
    var date = [String]()


class HomeController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var noteTableView: UITableView!
    @IBOutlet weak var infoNote: UILabel!
    

    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (list.count)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let note = UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: "note")
        
        
        
        let note = tableView.dequeueReusableCell(withIdentifier: "note") as! CustomTableView
        note.textNote?.text = list[indexPath.row]
        note.dateNote?.text = date[indexPath.row]
        
        
        
//        noteTableView.reloadData()
        
        
//        note.textLabel?.text = list[indexPath.row]

        return note
    }
    
    
//    private func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
//        if editingStyle == UITableViewCell.EditingStyle.delete {
//            list.remove(at: indexPath.row)
//            noteTableView.reloadData()
//
//        }
//    }
    
//    override func viewDidAppear(_ animated: Bool) {
    
//    }
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        noteTableView.separatorColor = UIColor (white: 0.95, alpha: 1)
        noteTableView.dataSource = self
        noteTableView.delegate = self
        
        self.tabBarController!.tabBar.layer.borderWidth = 0.5
        self.tabBarController!.tabBar.layer.borderColor = UIColor(red: 151/255, green: 151/255, blue: 151/255, alpha: 0.2).cgColor
        self.tabBarController?.tabBar.clipsToBounds = true
        
        
        if (list.count == 0 ) {
            infoNote.isHidden = false
            print("Scrivi una nota")
        }
        else {
            infoNote.isHidden = true
            print("Note già presenti")
        }
//        list.reverse()
        
        // Do any additional ssetup after loading the view, typically from a nib.
        
         
        
    }
    
    
}
