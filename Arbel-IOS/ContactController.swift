//
//  FourthController.swift
//  Arbel-IOS
//
//  Created by Mac on 19/03/2019.
//  Copyright © 2019 Mac. All rights reserved.
//

import UIKit

class ContactController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
//    var list = [String]()
//
    var sendArray = ["1 Media Design","2 Media Design","2 Video Design","2 Sound Design"]
    
    
    @IBOutlet weak var mailForm: UITextField!
    @IBOutlet weak var objectForm: UITextField!
    @IBOutlet weak var messageForm: UITextView!
    @IBOutlet weak var sendButton: UIButton!
    @IBOutlet weak var addButton: UIButton!
    
    
    var transparentView = UIView()
    var tableView = UITableView()
    
    let height: CGFloat = 300



    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        self.HideKeyboard()
        
        self.mailForm.layer.cornerRadius = 10
        self.objectForm.layer.cornerRadius = 10
        self.messageForm.layer.cornerRadius = 8
        self.sendButton.layer.cornerRadius = 18
        
        addButton.clipsToBounds = true
        sendButton.layer.masksToBounds = true
        addButton.layer.cornerRadius = 10
        addButton.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMaxXMinYCorner]
        
        sendButton.setGradientBackground(colorOne: UIColor(red: 208/255, green: 2/255, blue: 27/255, alpha: 1), colorTwo: UIColor(red: 233/255, green: 26/255, blue: 75/255, alpha: 1))
        
        tableView.isScrollEnabled = true
        tableView.delegate = self as? UITableViewDelegate
        tableView.dataSource = self as? UITableViewDataSource
        tableView.register(ContactTableViewCell.self, forCellReuseIdentifier: "Cell")
        
        
        tableView.separatorColor = UIColor(red: 245/255, green: 245/255, blue: 245/255, alpha: 1)
        tableView.contentInset = UIEdgeInsets(top: 15, left: 0, bottom: 0, right: 0);
        
        tableView.clipsToBounds = true
        tableView.layer.cornerRadius = 10
        tableView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]

    
            
        }
    
    
    
    @IBAction func addAction(_ sender: AnyObject) {
        
//        let window = UIApplication.shared.keyWindow
        
        transparentView.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        transparentView.frame = self.view.frame
        self.view.addSubview(transparentView)
        
        let screenSize = UIScreen.main.bounds.size
        
        tableView.frame = CGRect(x: 0, y: screenSize.height, width: screenSize.width, height: height)
        
        self.view.addSubview(tableView)
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(onClickTransparentView))
        transparentView.addGestureRecognizer(tapGesture)
        
        transparentView.alpha = 0
        
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1.0, initialSpringVelocity: 1.0, options: .curveEaseInOut, animations: {
            self.transparentView.alpha = 0.6
            self.tableView.frame = CGRect(x: 0, y: screenSize.height - self.height, width: screenSize.width, height: self.height)
        }, completion: nil)
        

    }
    
    @objc func onClickTransparentView() {
        let screenSize = UIScreen.main.bounds.size
        
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1.0, initialSpringVelocity: 1.0, options: .curveEaseInOut, animations: {
            self.transparentView.alpha = 0
            self.tableView.frame = CGRect(x: 0, y: screenSize.height, width: screenSize.width, height: self.height)
        }, completion: nil)
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sendArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? ContactTableViewCell else {fatalError("Unable to deque cell")}
                cell.lbl.text = sendArray[indexPath.row]
                cell.lbl.font = UIFont.systemFont(ofSize: 16)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 45
    }
}
