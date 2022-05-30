//
//  Questions.swift
//  HockeyQuiz
//
//  Created by Kirill Tarasko on 30.05.2022.
//

import Foundation


class Test {
    
    
    
    let question: String
    let possibleAnswers: [String]
    let rightAnswer: String
    
    init (question: String, possibleAnswers: [String], rightAnswer: String) {
        self.question = question
        self.possibleAnswers = possibleAnswers
        self.rightAnswer = rightAnswer
    }
    
    
}
