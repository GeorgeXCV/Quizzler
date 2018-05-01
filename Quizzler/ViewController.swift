//
//  ViewController.swift
//  Quizzler
//
//  Created by George on 03/04/2017.
//  Copyright © 2017 George Ashton. All rights reserved.
//

import UIKit


class ViewController: UIViewController {
    
    // UI Elements 
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet var progressBar: UIView!
    @IBOutlet weak var progressLabel: UILabel!
    
    
    // Instance variables
    let allQuestions = QuestionBank()
    var pickedAnswer : Bool = false
    var questionNumber : Int = 0
    var score : Int = 0
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

         updateUI()
    }

    //This action gets called when either the true or false button is pressed

    @IBAction func answerPressed(_ sender: AnyObject) {
       
        // Make pickedAnswer equal to true if the true button with tag 1 is pressed

        if sender.tag == 1{
            pickedAnswer = true
        }
        // Make pickedAnswer equal to false if the false button with tag 2 is pressed
        else if sender.tag == 2 {
            pickedAnswer = false
        }
        
        checkAnswer()
        
        questionNumber = questionNumber + 1
        
        updateUI()
        
    }
    
    // This method will update all the views on screen (progress bar, score label, etc)

    func updateUI() {
        
        progressBar.frame.size.width = (view.frame.size.width / 13) * CGFloat (questionNumber + 1)
        progressLabel.text = "\(questionNumber + 1) / 13"
        scoreLabel.text = "Score:" + String(score)
        nextQuestion()
      
    }
    
    //This method will update the question text and check if we reached the end

    func nextQuestion() {
        
        // If we have not reached the end, update the question displayed

        if questionNumber <= 12 {
            questionLabel.text = allQuestions.list[questionNumber].questionText
          }
            // else show a pop up alert to the user

        else {
            // 1. Create a UIAlertController named alert

            let alert = UIAlertController(title: "Awesome", message: "You've finished all the questions, do you want to start over?", preferredStyle: .alert)
            // 2. Make the button on this alert call the startOver() method

            let restartAction = UIAlertAction(title: "Restart", style: .default, handler: { (UIAlertAction) in
                self.startOver()
            })
            // 3. Add the UIAlertAction to the UIAlertController
            alert.addAction(restartAction)
            // 4. Present the alert to make it appear on screen
            present(alert, animated: true, completion: nil)
        }
    }
    //This method will check if the user has got the right answer
    func checkAnswer() {
        
        let correctAnswer = allQuestions.list[questionNumber].answer
        
        if pickedAnswer == correctAnswer {

            ProgressHUD.showSuccess("Correct")
            
            score + 1
        } else {
            ProgressHUD.showError("Wrong")
        }
    }
    
    //This method will wipe the board clean, so that users can retake the quiz.
    func startOver() {
        
        questionNumber = 0
        score = 0
        
        updateUI()
       
    }
    

    
}
