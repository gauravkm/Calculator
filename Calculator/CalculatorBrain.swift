//
//  CalculatorBrain.swift
//  Calculator
//
//  Created by Gaurav Mittal on 5/10/15.
//  Copyright (c) 2015 Gaurav Mittal. All rights reserved.
//

import Foundation

class CalculatorBrain{
    
    var opStack = [Op]()
    
    enum Op{
        
        case Operand(Double)
        
        case UnaryOperator(String, Double->Double)
        
        case BinaryOperator(String, (Double, Double)->Double)
    }
    
    func pushOperand(operand:Double) {
        opStack.append(Op.Operand(operand))
    }
    
    func performOperation(operation:String){
        println("operation \(operation)")
        switch operation{
            case "➕":
                opStack.append(Op.BinaryOperator("➕", +))
            case "➖":
                opStack.append(Op.BinaryOperator("➖", {$1-$0}))
            case "✖️":
                opStack.append(Op.BinaryOperator("✖️", *))
            case "➗":
                opStack.append(Op.BinaryOperator("➗", {$1/$0}))
            case "✔️":
                opStack.append(Op.UnaryOperator("✔️", sqrt))
            default:
                break
        }
    }
    
    func evaluate(stack:[Op]) -> (result: Double?, remainingStack:[Op]){
        println("opStack \(stack)")
        if(stack.count>0){
            var lstack = stack
                let op = lstack.removeLast()
                switch op{
                case .Operand(let operand):
                    return (operand, lstack)
                
                case .BinaryOperator(_, let operation):
                    var op1Evaluation = evaluate(lstack)
                    if let op1 = op1Evaluation.result{
                        var op2Evaluation = evaluate(op1Evaluation.remainingStack)
                        if let op2 = op2Evaluation.result{
                            return (operation(op1, op2),op2Evaluation.remainingStack)
                        }
                    }
                case .UnaryOperator(_, let operation):
                    var op1Evaluation = evaluate(lstack)
                    if let op1 = op1Evaluation.result{
                        return (operation(op1), op1Evaluation.remainingStack)
                    }
                }
        }
        return (nil, stack)
    }
    func evaluate() -> Double?{
        
        var (result, remainder) = evaluate(opStack)
        return result
        
    }
}