//
//  ViewController.swift
//  HockeyQuiz
//
//  Created by Kirill Tarasko on 30.05.2022.
//

import UIKit

class QuestionsViewController: UIViewController {
    
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var question: UILabel!
    @IBOutlet var buttonAnswers: [UIButton]!
    
    var questionManager = DataManager()
    private var questions: Question!
    private var countOfAnswers = 0
    private var countOfRightAnswers = 0
    private var indexRange = -1
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        newQuestion()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let resultVC = segue.destination as! ResultsViewController
        resultVC.totalAnswers = totalAnswers
        resultVC.totalRightAnswers = totalRightAnswers
    }
    
    @IBAction func selectAnswer(_ sender: UIButton) {
        let index = buttonAnswers.firstIndex(of: sender)!
        validateAnswer(index: index)
        newQuestion()
    }
}

extension QuestionsViewController {
    
    private var currentQuestion: String {
        return questions.question
    }
    
    private var possibleAnswers: [String] {
        return questions.possibleAnswers
    }
    
    private var totalAnswers: Int {
        return countOfAnswers
    }
    
    private var totalRightAnswers: Int {
        return countOfRightAnswers
    }
    
    private var countOfQuestions: Int {
        questionManager.questions.count - 1
    }
    
    private func newQuestion() {
        
        if indexRange < countOfQuestions {
            indexRange += 1
        } else if indexRange == countOfQuestions {
            showResult()
        }
        
        refreshTest(indexRange)
        question.text = currentQuestion
        
        for index in
                0..<possibleAnswers.count {
                let possibleAnswer = possibleAnswers[index]
            let button = buttonAnswers[index]
            
            button.setTitle(possibleAnswer, for: .normal)
            
            let totalProgress = Float(indexRange) / Float(countOfQuestions)
            progressBar.setProgress(totalProgress, animated: true)
        }
    }
    
    private func validateAnswer(index: Int) {
        countOfAnswers += 1
        if questions.validatePossibleAnswer(index) {
            countOfRightAnswers += 1
        }
    }
    
    private func showResult() {
        performSegue(withIdentifier: "showResult", sender: nil)
    }
    
    private func refreshTest(_ index: Int) {
        let testData = DataManager().questions[index]
        
        questions = Question(question: testData.question, possibleAnswers: testData.possibleAnswers, rightAnswer: testData.rightAnswer)
    }
}
