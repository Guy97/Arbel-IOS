//
//  QuestionViewController.swift
//  Arbel-IOS
//
//  Created by Diletta Favaretto on 03/05/2019.
//  Copyright © 2019 Mac. All rights reserved.
//

import UIKit

class QuestionViewController: UIViewController {

    @IBOutlet weak var createBtn: UIButton!
    @IBOutlet weak var questionTV: UITableView!
    
    var numberQuestions = ["Domanda 1", "Domanda 2", "Domanda 3", "Domanda 4"]
    var questions = ["Quanti anni ha Luca?", "Quanti bottoni ha il computer?", "Quanti elefanti ci stanno in una 500?", "Quanti capelli abbiamo?"]
    override func viewDidLoad() {
        super.viewDidLoad()
            elementStyle()
        // Do any additional setup after loading the view.
    }
    
    func elementStyle() {
            createBtn.layer.cornerRadius = 8
            createBtn.layer.shadowColor = UIColor (red: 142/255, green: 142/255, blue: 142/255, alpha: 0.5).cgColor
            createBtn.layer.shadowOffset = CGSize (width: 0, height: 1.0)
            createBtn.layer.shadowRadius = 1.1
            createBtn.layer.shadowOpacity = 0.5
    }
}
    
extension QuestionViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return numberQuestions.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cella", for: indexPath) as? QuestionTableViewCell
        cell?.label.text = questions[indexPath.row]
        cell?.question.text = numberQuestions[indexPath.row]
        cell?.layer.cornerRadius = 15
        
        return (cell!)
        
    }
}



    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


