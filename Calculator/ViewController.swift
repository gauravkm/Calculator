//
//  ViewController.swift
//  Calculator
//
//  Created by Gaurav Mittal on 5/10/15.
//  Copyright (c) 2015 Gaurav Mittal. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var display: UILabel!
    
    var calculatorBrain = CalculatorBrain()
    var inTheMiddleOfTypingANumber = false
    
    @IBAction func numberClick(sender: UIButton) {
        if inTheMiddleOfTypingANumber{
            display.text = display.text!+sender.currentTitle!
        }
        else{
            display.text = sender.currentTitle!
            inTheMiddleOfTypingANumber = true
        }
    }
    
    
    @IBAction func returnClick() {
        inTheMiddleOfTypingANumber = false
        calculatorBrain.pushOperand(displayText)
    }
    
    @IBAction func performOperation(sender: UIButton) {
        returnClick()
        calculatorBrain.performOperation(sender.currentTitle!)
        if let result = calculatorBrain.evaluate(){
            displayText = result
        }
        else{
            displayText = 0
        }
    }
    
    var displayText:Double {
        set{
            println("\(newValue)")
            display.text = "\(newValue)"
            inTheMiddleOfTypingANumber = false
        }
        get{
            println("current display value \(display.text!)")
            return NSNumberFormatter().numberFromString(display.text!)!.doubleValue
        }
    }
}

