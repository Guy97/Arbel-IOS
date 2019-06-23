//
//  FirstController.swift
//  Arbel-IOS
//
//  Created by Mac on 18/03/2019.
//  Copyright © 2019 Mac. All rights reserved.
//

import UIKit
import Alamofire


class HomeController: UIViewController, UITableViewDelegate, UITableViewDataSource, UICollectionViewDataSource, UIScrollViewDelegate, UICollectionViewDelegate {
    
    @IBOutlet weak var noteTableView: UITableView!
    @IBOutlet weak var infoNote: UILabel!
    @IBOutlet weak var infoUser: UILabel!
    @IBOutlet weak var reload: UIButton!
    @IBOutlet weak var collectionView: UICollectionView!
    
    var activities = Activity.fetchActivities()
    let cellScalingH: CGFloat = 0.5
    let cellScalingV: CGFloat = 0.7
    
    var reminderData = GetReminder.dataReminder.memo
    
    @IBAction func refreshPage(_ sender: Any) {
        API.ReminderApi()
        noteTableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        API.ReminderApi()
        API.StudentApi()
        elementStyle()
        noteTableView.dataSource = self
        noteTableView.delegate = self
        collectionView?.dataSource = self
        collectionView?.delegate = self
        
        if (reminderData.count == 0 ) {
            infoNote.isHidden = false
        }
        else {
            infoNote.isHidden = true
        }
        
        let cellWidth = floor(collectionView.bounds.width * cellScalingH)
        let cellHeight = floor(collectionView.bounds.height * cellScalingV)
        let insetX = (collectionView.bounds.width - cellWidth) / 2
        let insetY = (collectionView.bounds.height - cellHeight) / 2
        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.itemSize = CGSize (width: cellWidth, height: cellHeight)
        collectionView?.contentInset = UIEdgeInsets(top: insetY, left: insetX, bottom: insetY, right: insetX)
    }
    
    func elementStyle() {
        noteTableView.separatorColor = UIColor (white: 0.95, alpha: 1)
        self.tabBarController!.tabBar.layer.borderWidth = 0.5
        self.tabBarController!.tabBar.layer.borderColor = UIColor(red: 151/255, green: 151/255, blue: 151/255, alpha: 0.2).cgColor
        self.tabBarController?.tabBar.clipsToBounds = true
    }
    
    override func viewDidAppear(_ animated: Bool) {
        API.ReminderApi()
        self.noteTableView.reloadData()
        
        func getPreviousViewController() -> UIViewController? {
            let viewControllers = self.navigationController?.viewControllers
            let count = viewControllers!.count
            guard count > 0 else { return nil }
            
            return viewControllers![count - 1]
        }
        
        if CheckInternet.Connection() {
            infoUser.text = "Bentornato \(Users.userLogin.success.name)," + "\n" + "sei Online"
        }
        else {
            infoUser.text = "Mi dispiace ma" + "\n" + " sei Offline"
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        API.ReminderApi()
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (GetReminder.dataReminder.memo.count) }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let note = tableView.dequeueReusableCell(withIdentifier: "note") as! NoteTableView
        let reminder = GetReminder.dataReminder.memo[indexPath.row]
        note.textNote?.text = reminder.memoryText
        note.dateNote?.text = reminder.created_at
        return note
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return activities.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HourCell", for: indexPath) as! HourCollectionViewCell
        cell.activity = activities[indexPath.item]
        return cell
    }
}


