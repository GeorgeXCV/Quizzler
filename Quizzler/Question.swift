//
//  Question.swift
//  Quizzler
//
//  Created by George on 03/04/2017.
//  Copyright © 2017 George Ashton. All rights reserved.
//

import Foundation

class Question {
    
    let questionText : String
    let answer : Bool
    
    init(text: String, correctAnswer: Bool) {
        questionText = text
        answer = correctAnswer
    }
    
}


