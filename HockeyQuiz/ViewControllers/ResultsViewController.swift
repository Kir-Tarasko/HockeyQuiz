//
//  ResultsViewController.swift
//  HockeyQuiz
//
//  Created by Kirill Tarasko on 30.05.2022.
//

import UIKit

class ResultsViewController: UIViewController {
    
    @IBOutlet weak var correctAnswersTotal: UILabel!
    @IBOutlet weak var totalScoreInPercents: UILabel!
    
    var totalRightAnswers = 0
    var totalAnswers = 0
    
    override func viewDidLoad() {
        correctAnswersTotal.layer.cornerRadius = 7
        correctAnswersTotal.layer.masksToBounds = true
        correctAnswersTotal.text = "Верных ответов: \(totalRightAnswers)"
        
        let score = totalRightAnswers*100/totalAnswers
        totalScoreInPercents.text = "Результат - \(score)%"
    }
}

