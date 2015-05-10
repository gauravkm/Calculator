//
//  ViewController.swift
//  Calculator
//
//  Created by Gaurav Mittal on 5/10/15.
//  Copyright (c) 2015 Gaurav Mittal. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var display: UITextField!
    
    var calculatorBrain = CalculatorBrain()
    var inTheMiddleOfTypingANumber = false
    
    @IBAction func numberClick(sender: UIButton) {
        
    }
    
    
    @IBAction func returnClick() {
    }
    
    @IBAction func performOperation(sender: UIButton) {
    }
    
}

