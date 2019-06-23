//
//  FourthController.swift
//  Arbel-IOS
//
//  Created by Mac on 19/03/2019.
//  Copyright © 2019 Mac. All rights reserved.
//

import UIKit
import MessageUI

class ContactController: UIViewController, UITableViewDataSource, UITableViewDelegate, MFMailComposeViewControllerDelegate {
    
    @IBOutlet weak var mailForm: UITextField!
    @IBOutlet weak var objectForm: UITextField!
    @IBOutlet weak var messageForm: UITextView!
    @IBOutlet weak var sendButton: UIButton!
    @IBOutlet weak var addButton: UIButton!
    
    var coursesData = Users.userLogin.success.courses
    
    var transparentView = UIView()
    var tableView = UITableView()
    
    let height: CGFloat = 300
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.HideKeyboard()
        elementStyle()
        tableView.isScrollEnabled = true
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(ContactTableViewCell.self, forCellReuseIdentifier: "Cell")
        
        var StudentCell_id = PassData.globalVariable.studentID
        
        for student in Students.studentList.students {
            if (student.id == StudentCell_id) {
                mailForm.text = "\(student.email)".lowercased()
            }
        }
    }
    
    func elementStyle() {
        self.mailForm.layer.cornerRadius = 10
        self.objectForm.layer.cornerRadius = 10
        self.messageForm.layer.cornerRadius = 8
        self.sendButton.layer.cornerRadius = 18
        
        addButton.clipsToBounds = true
        sendButton.layer.masksToBounds = true
        addButton.layer.cornerRadius = 10
        addButton.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMaxXMinYCorner]
        
        self.sendButton.setTitleColor(UIColor.white, for: .highlighted)
        self.sendButton.setBackgroundColor(color: UIColor(red: 208/255, green: 2/255, blue: 27/255, alpha: 1), forState: .normal)
        self.sendButton.setBackgroundColor(color: UIColor(red: 189/255, green: 0/255, blue: 23/255, alpha: 1), forState: .highlighted)
        
        tableView.separatorColor = UIColor(red: 245/255, green: 245/255, blue: 245/255, alpha: 1)
        tableView.contentInset = UIEdgeInsets(top: 15, left: 0, bottom: 0, right: 0);
        
        tableView.clipsToBounds = true
        tableView.layer.cornerRadius = 10
        tableView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
    }
    
    @IBAction func addAction(_ sender: AnyObject) {
        
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
            self.transparentView.alpha = 0.4
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
        return coursesData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? ContactTableViewCell else {fatalError("Unable to deque cell")}
        
        let courseDetail = coursesData[indexPath.row]
        cell.lbl.text = "\(courseDetail.year)" + "  " + courseDetail.course
        cell.lbl.font = UIFont.systemFont(ofSize: 16)
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 45
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    override func didReceiveMemoryWarning() {
        super.viewDidLoad()
    }
    
    @IBAction func sendButton(_ sender:AnyObject ) {
        let mailComposeViewController = configuredMailComposeViewController()
        if MFMailComposeViewController.canSendMail() {
            self.present(mailComposeViewController, animated: true, completion: nil)
        } else {
            self.showSendMailErrorAlert()
        }
    }
    
    func configuredMailComposeViewController() -> MFMailComposeViewController {
        let mailComposer = MFMailComposeViewController()
        mailComposer.mailComposeDelegate = self
        mailComposer.setToRecipients([Users.userLogin.success.email])
        mailComposer.setSubject(objectForm.text!)
        mailComposer.setMessageBody(messageForm.text!, isHTML: false)
        return mailComposer
    }
    
    func showSendMailErrorAlert() {
        let sendMailErrorAlert = UIAlertView(title: "Impossibile inviare e-mail", message: "Il tuo dispositivo non ha potuto inviare e-mail. Controlla la configurazione della posta elettronica e riprova", delegate: self, cancelButtonTitle: "OK")
        sendMailErrorAlert.show()
    }
    
    // MARK: MFMailComposeViewControllerDelegate Method
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func keyBoard(_ sender: Any) {
        self.resignFirstResponder()
    }
}
