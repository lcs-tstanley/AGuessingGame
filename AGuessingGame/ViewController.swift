//
//  ViewController.swift
//  AGuessingGame
//
//  Created by Stanley, Trent on 2019-10-02.
//  Copyright © 2019 Stanley, Trent. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    // MARK: Properties
    let targetNumber = Int.random(in: 1...100)
    
    @IBOutlet weak var submittedGuess: UITextField!
    //MARK: Initializers
    
    
    //MARK: Methods (funtions) - behaviours
    
    // Runs as soon as the view becomes isable to the user
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        speak(message: "I'm thinking of a number between 1 and 100. Guess what it is.")
        
    }    
    
    // Will be used to check a guess
    @IBAction func checkGuess(_ sender: Any) {
        
        // Obtain the guess value from the text field
        guard let guessText = submittedGuess.text, guessText != "" else {
            speak(message: "Please enter a number")
            return
        }
        // Try to convert the string into an integer data type
        guard let guessNumber = Int (guessText) else {
            speak(message: "Please enter a valid  number")
            return
        }
        
        // For testing purposes, what was the guess?
        print("For testing purposes, the guess made was \(guessNumber)")
        
        // Give the appropriate feedback to the user
        if guessNumber > targetNumber {
            
            speak(message: "Guess lower next time")
      
        } else if guessNumber < targetNumber {
            print("Guess higher next time")
            
            speak(message: "Guess higher next time")
        
        } else {
            
            speak(message: "You are correct")
      
        }
        
    }
    
    // A function that will speak whatever message is provided
    func speak(message: String)  {
        
        // Make and object named "synthesizer", which is an instance of the
        // class 'AVSpeechSynthesizer
        let synthesizer = AVSpeechSynthesizer()
        
        // Make an object named 'utterance', which is an instance of the class
        // AVSpeechUtterance
        let utterance = AVSpeechUtterance(string: message)
        
        // Speak the message
        synthesizer.speak(utterance)
        
        // Print the message
        print(message)
   
    }
    
}

