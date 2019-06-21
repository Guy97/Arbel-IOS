//
//  prova.swift
//  Arbel-IOS
//
//  Created by Federica Brieda on 17/06/2019.
//  Copyright © 2019 Mac. All rights reserved.
//

import Foundation
import MessageUI

class prova:UIViewController, UITableViewDataSource, UITableViewDelegate, MFMailComposeViewControllerDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        <#code#>
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        <#code#>
    }
    
@IBAction func sendButton(_ sender: Any) {
    
    let emailUser = [Users.userLogin.success.email]
    let mc: MFMailComposeViewController = MFMailComposeViewController()
    mc.mailComposeDelegate = self
    mc.setToRecipients(emailUser)
    mc.setSubject(object.text!)
    mc.setMessageBody(Messageform.text!
        , isHTML: false)
    self.present(mc, animated: true, completion: nil)
}

@IBAction func keyBoard(_ sender: Any) {
    self.resignFirstResponder()
}
}
