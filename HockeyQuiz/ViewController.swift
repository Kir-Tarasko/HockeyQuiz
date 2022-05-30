//
//  ViewController.swift
//  HockeyQuiz
//
//  Created by Kirill Tarasko on 30.05.2022.
//

import UIKit

class ViewController: UIViewController {


    private var test: Test!
    let questionManager = DataManager()
    private var countOfAnswers = 0
    private var indexRange = -1
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    
    var question: String {
        test.question
    }
    
    var possibleAnswers : [String] {
        test.possibleAnswers
    }
    
    var totalAnswers: Int {
        return countOfAnswers
    }
    
    
    var countOfQuestions: Int {
        questionManager.questions.count - 1
    }
    
    func refreshTest(_ index: Int) {
        let testData = questionManager.questions[index]
        
        test = Test(question: testData.question, possibleAnswers: testData.possibleAnswers, rightAnswer: testData.rightAnswer)
    }
}


extension ViewController {
    
    private func newQuestion() {
         
        if indexRange < countOfQuestions {
             indexRange += 1
         } else if indexRange == countOfQuestions {
             showResult()
         }
         
         refreshTest(indexRange)
         question.text = question
         
         for index in 0..<possibleAnswers.count {
             let possibleAnswer = possibleAnswers[index]
             let button = buttonAnswers[index]
             
             button.setTitle(possibleAnswer, for: .normal)
             
             let totalProgress = Float(indexRange) / Float(countOfQuestions)
             progressBar.setProgress(totalProgress, animated: true)
         }
     }
    private func showResult() {
        performSegue(withIdentifier: "showResult", sender: nil)
    }
}

