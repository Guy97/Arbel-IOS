//
//  QuestionViewController.swift
//  Arbel-IOS
//
//  Created by Diletta Favaretto on 03/05/2019.
//  Copyright © 2019 Mac. All rights reserved.
//

import UIKit

class QuestionViewController: UIViewController {
    
    @IBOutlet weak var questionTV: UITableView!
    
    var questions = ["Prova domanda 1, lorem ipsum dolor consect.", "Prova domanda 2, lorem ipsum dolor consect.", "Prova domanda 3, lorem ipsum dolor consect.", "Prova domanda 4, lorem ipsum dolor consect."]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        elementStyle()
        self.questionTV.allowsMultipleSelection = true
        self.questionTV.allowsMultipleSelectionDuringEditing = true
    }
    
    func elementStyle() {
        
    }
}

extension QuestionViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return questions.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "question", for: indexPath) as? QuestionTableViewCell
        cell?.question.sizeToFit()
        cell?.question.text = questions[indexPath.row]
        
        cell?.layer.cornerRadius = 8
        
        return (cell!)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let select  = tableView.cellForRow(at: indexPath) as! QuestionTableViewCell
        select.questionView.backgroundColor = UIColor(red: 208/255, green: 2/255, blue: 27/255, alpha: 1)
        
        select.question.textColor = .white
        select.questionTitle.textColor = .white
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        let deselect  = tableView.cellForRow(at: indexPath) as! QuestionTableViewCell
        
        deselect.questionView.backgroundColor = .white
        deselect.question.textColor = .black
        deselect.questionTitle.textColor = .black
    }
}
