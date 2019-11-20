//
//  ViewController.swift
//  guessNumber
//
//  Created by Hanataba on 18/11/2562 BE.
//  Copyright © 2562 Hanataba. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var numberTextField: UITextField!
    @IBOutlet weak var previousNumTextField: UILabel!
    @IBOutlet weak var enterButton: UIButton!
    @IBOutlet weak var seeAnsButton: UIButton!
    
    
    var fourDigits: [String.Element] = []
    @IBOutlet weak var notificationLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        numberTextField.smartInsertDeleteType = UITextSmartInsertDeleteType.no
        numberTextField.delegate = self
        enterButton.layer.cornerRadius = enterButton.frame.height/5
        seeAnsButton.layer.cornerRadius = seeAnsButton.frame.height/5
        
                randomDigits()
    }
    @IBAction func answerPressed(_ sender: Any) {
        notificationLabel.text = "Answer: \(String(fourDigits))"
    }
    @IBAction func resetPressed(_ sender: UIButton) {
        randomDigits()
    }
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        var correctNum = 0
        var correctIndex = 0
        if numberTextField.text!.isEmpty {
            notificationLabel.text = "Please enter 4-digits"
        }else{
            if let num = numberTextField.text {
                numberTextField.text = ""
                let arrayNum = Array(num)
                if arrayNum.count != 4 {
                    notificationLabel.text = "Please enter 4-digits"
                }
                else{
                    if (arrayNum[0] != arrayNum[1]) && (arrayNum[0] != arrayNum[2]) && (arrayNum[0] != arrayNum[3]) && (arrayNum[1] != arrayNum[2]) && (arrayNum[1] != arrayNum[3]) && (arrayNum[2] != arrayNum[3]){
                        print(arrayNum)
                        for n in 0...3{
                            for i in 0...3{
                                if arrayNum[n] == fourDigits[i]{
                                    correctNum += 1
                                    if n == i {
                                        correctIndex += 1
                                    }
                                }
                            }
                        }
                        if correctIndex == 4 && correctNum == 4 {
                            notificationLabel.text = "Congratuation Answer is  \(String(fourDigits))"
                            
                            
                        }else{
                            print("correct number: \(correctNum)")
                            print("correct position: \(correctIndex)")
                            notificationLabel.text = "correct number: \(correctNum) \n correct position: \(correctIndex)"
                            previousNumTextField.text = "previous number: \(num)"
                        }
                    }
                    else{
                        print("wrong! please enter unique number")
                        notificationLabel.text = "wrong! please enter unique number"
                    }
                }
                
            }
        }
    }
    
    
    
    func randomDigits(){
        fourDigits = []
        var fourDigitNumber: String {
            var result = ""
            repeat {
                // Create a string with a random number 0...9999
                result = String(format:"%04d", arc4random_uniform(10000) )
            } while Set<Character>(result).count < 4
            return result
        }
        fourDigits = Array(fourDigitNumber)
        notificationLabel.text = "Please enter 4-digits"
        print("Answer: \(fourDigits)")
    }
    
    
}

extension ViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard let textFieldText = textField.text,
            let rangeOfTextToReplace = Range(range, in: textFieldText) else {
                return false
        }
        let substringToReplace = textFieldText[rangeOfTextToReplace]
        let count = textFieldText.count - substringToReplace.count + string.count
        return count <= 4
    }
}

