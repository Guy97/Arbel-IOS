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
    
//    var numberQuestions = ["Domanda 1", "Domanda 2", "Domanda 3", "Domanda 4"]
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
        cell?.question.text = questions[indexPath.row]
        
        cell?.layer.cornerRadius = 8
        
        
        return (cell!)
    
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        (tableView.cellForRow(at: indexPath) as! QuestionTableViewCell).questionView.setGradientBackground(colorOne: UIColor(red: 208/255, green: 2/255, blue: 27/255, alpha: 1), colorTwo: UIColor(red: 233/255, green: 26/255, blue: 75/255, alpha: 1))        
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


