//
//  ResultsViewController.swift
//  HockeyQuiz
//
//  Created by Kirill Tarasko on 30.05.2022.
//

import UIKit

class ResultsViewController: UIViewController {
    
    let questionManager = DataManager()
    private var questions: Test!
    private var countOfAnswers = 0
    private var countOfRightAnswers = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let score = countOfRightAnswers*100/countOfAnswers
    }
    

    var totalRightAnswers : Int {
        return countOfRightAnswers
    }
    
    func validatePossibleAnswer(_ index: Int) -> Bool {
        let answer = questions.possibleAnswers[index]
        return answer == questions.rightAnswer
    }
    
    func validateAnswer(index: Int) {
        countOfAnswers += 1
        if validatePossibleAnswer(index) {
            countOfRightAnswers += 1
        }
    }
    
    

}
