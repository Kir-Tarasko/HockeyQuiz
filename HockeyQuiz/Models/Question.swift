//
//  Questions.swift
//  HockeyQuiz
//
//  Created by Kirill Tarasko on 30.05.2022.
//

import Foundation

struct Question {
    
    let question: String
    let possibleAnswers: [String]
    let rightAnswer: String
  
}
    
extension Question {
    
    func validatePossibleAnswer(_ index: Int) -> Bool {
        let answer = possibleAnswers[index]
        return answer == rightAnswer
    }
}
