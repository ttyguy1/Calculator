//
//  ViewController.swift
//  Calculator
//
//  Created by Tyler Middleton on 4/11/17.
//  Copyright © 2017 Tyler Middleton. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var resultLabel: UILabel!
    
    var firstNumberText = ""
    var secondNumberText = ""
    var operation = ""
    var isFirstNumber = true
    var hasOperation = false
    var canClear = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func handelButtonPress(_ sender: UIButton) {
        if canClear {
            resultLabel.text = ""
            canClear = false
        }
        let currentText = resultLabel.text!
        let textLabel = sender.titleLabel?.text
        if let text = textLabel {
            switch text {
            case "+", "*", "/", "-":
                if hasOperation {
                    return
                }
                operation = text
                isFirstNumber = false
                hasOperation = true
                resultLabel.text = "\(currentText) \(operation) "
                break
            case "=":
                isFirstNumber = true
                hasOperation = false
                canClear = true
                let result = calculate()
                resultLabel.text = "\(result)"
                break
            default:
                if isFirstNumber {
                    firstNumberText = "\(firstNumberText)\(text)"
                } else {
                    secondNumberText = "\(secondNumberText)\(text)"
                }
                resultLabel.text = "\(currentText)\(text)"
                break;
            }
        }
    }
    
    
    func calculate() -> Double {
        let firstNumber = Double(firstNumberText)!
        let secondNumber = Double(secondNumberText)!
        firstNumberText = ""
        secondNumberText = ""
        switch operation {
        case "+":
            return firstNumber + secondNumber
        case "-":
            return firstNumber - secondNumber
        case "*":
            return firstNumber * secondNumber
        case "/":
            return firstNumber / secondNumber
        default:
            return 0
        }
    }

}

