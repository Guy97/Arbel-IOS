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
    @IBOutlet weak var infoUser: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    //var bo: users!
    //var prova: usersData!
    
    var activities = Activity.fetchActivities()
    let cellScalingH: CGFloat = 0.5
    let cellScalingV: CGFloat = 0.7
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        print(Users.ciccio.success.name, "aio")
        elementStyle()
    
        noteTableView.dataSource = self
        noteTableView.delegate = self
        
        collectionView?.dataSource = self
        collectionView?.delegate = self
        
        if (list.count == 0 ) {
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
        if CheckInternet.Connection() {
            infoUser.text = "Bentornato \(Users.ciccio.success.name)," + "\n" + "sei Online"
        }
        else {
            infoUser.text = "Mi dispiace ma" + "\n" + " sei Offline"
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (list.count) }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
}
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let note = tableView.dequeueReusableCell(withIdentifier: "note") as! NoteTableView
        note.textNote?.text = list[indexPath.row]
        note.dateNote?.text = date[indexPath.row]
        return note
    }
}

extension HomeController : UICollectionViewDataSource {
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
}

extension HomeController : UIScrollViewDelegate, UICollectionViewDelegate {
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let layout = self.collectionView?.collectionViewLayout as! UICollectionViewFlowLayout
        let cellWidthIncludingSpacing = layout.itemSize.width + layout.minimumLineSpacing
        var offset = targetContentOffset.pointee
        let index = (offset.x + scrollView.contentInset.left) / cellWidthIncludingSpacing
        let roundedIndex = round(index)
        offset = CGPoint(x: roundedIndex * cellWidthIncludingSpacing - scrollView.contentInset.left, y: -scrollView.contentInset.top)
        targetContentOffset.pointee = offset
    }
}


