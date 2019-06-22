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
//    var refresh: UIRefreshControl!
    
    var activities = Activity.fetchActivities()
    let cellScalingH: CGFloat = 0.5
    let cellScalingV: CGFloat = 0.7
    
    var reminderData = GetReminder.dataReminder.memo
    
    @IBAction func refreshPage(_ sender: Any) {
        
        
        
        API.ReminderApi()
        noteTableView.reloadData()
        print("culo di bue" )

    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        API.ReminderApi()
        API.StudentApi()
//        self.noteTableView.reloadData()

        elementStyle()
        noteTableView.dataSource = self
        noteTableView.delegate = self
        
        collectionView?.dataSource = self
        collectionView?.delegate = self
        
        if (reminderData.count == 0 ) {
            infoNote.isHidden = false
            print("Scrivi una nota")
        }
        else {
            infoNote.isHidden = true
            print("Note già presenti")
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
        print(getPreviousViewController()! ,"porco")
        
        if CheckInternet.Connection() {
            infoUser.text = "Bentornato \(Users.userLogin.success.name)," + "\n" + "sei Online"
        }
        else {
            infoUser.text = "Mi dispiace ma" + "\n" + " sei Offline"
        }
        
        
        
        
    }
    

    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
                
        print(Users.userLogin.success.memories, "uscite")
        print("cazzoo")
        API.ReminderApi()
        //reminderData = GetReminder.dataReminder.memo
        
//        self.noteTableView.reloadData()
        
        navigationController?.setNavigationBarHidden(true, animated: animated)
        
    }
    

    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       print("passaaa", GetReminder.dataReminder.memo)
        return (GetReminder.dataReminder.memo.count) }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let note = tableView.dequeueReusableCell(withIdentifier: "note") as! NoteTableView
        
        let reminder = GetReminder.dataReminder.memo[indexPath.row]
        note.textNote?.text = reminder.memoryText
        
        
//        let formatter = DateFormatter()
//        formatter.dateStyle = .long
//        formatter.timeStyle = .short
//        formatter.setLocalizedDateFormatFromTemplate("MMMMdd - HH:mm")
//        formatter.locale =  Locale(identifier: "it_IT")
//        let str = formatter.string(from: Date())
        
        note.dateNote?.text = reminder.created_at
        
//        noteTableView.reloadData()

        
//        note.textNote?.text = list[indexPath.row]
//        note.dateNote?.text = date[indexPath.row]
        return note
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print(activities.count)
        return activities.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HourCell", for: indexPath) as! HourCollectionViewCell
        
        cell.activity = activities[indexPath.item]
        return cell
    }
    
//    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
//        let layout = self.collectionView?.collectionViewLayout as! UICollectionViewFlowLayout
//        let cellWidthIncludingSpacing = layout.itemSize.width + layout.minimumLineSpacing
//        var offset = targetContentOffset.pointee
//        let index = (offset.x + scrollView.contentInset.left) / cellWidthIncludingSpacing
//        let roundedIndex = round(index)
//        offset = CGPoint(x: roundedIndex * cellWidthIncludingSpacing - scrollView.contentInset.left, y: -scrollView.contentInset.top)
//        targetContentOffset.pointee = offset
//    }

    

}

//extension HomeController : UICollectionViewDataSource {
//    func numberOfSections(in collectionView: UICollectionView) -> Int {
//        return 1
//    }
//
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        print(activities.count)
//        return activities.count
//    }
//
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HourCell", for: indexPath) as! HourCollectionViewCell
//
//        cell.activity = activities[indexPath.item]
//        return cell
//    }
//
//
//
//}

//extension HomeController : UIScrollViewDelegate, UICollectionViewDelegate {
//    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
//        let layout = self.collectionView?.collectionViewLayout as! UICollectionViewFlowLayout
//        let cellWidthIncludingSpacing = layout.itemSize.width + layout.minimumLineSpacing
//        var offset = targetContentOffset.pointee
//        let index = (offset.x + scrollView.contentInset.left) / cellWidthIncludingSpacing
//        let roundedIndex = round(index)
//        offset = CGPoint(x: roundedIndex * cellWidthIncludingSpacing - scrollView.contentInset.left, y: -scrollView.contentInset.top)
//        targetContentOffset.pointee = offset
//    }
//
//
//}





