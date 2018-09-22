//
//  Calculation.swift
//  Calculator
//
//  Created by Siva on 9/20/18.
//  Copyright © 2018 Siva. All rights reserved.
//

import Foundation

class Calculation{
    
    static func performCalculation(previousNumber:Double,currentNumber:Double,operation:String)->String{
        var result:String = ""
        switch operation {
        case "+":
            result = String(currentNumber+previousNumber)
        case "-":
            result = String(previousNumber-currentNumber)
        case "x":
            result = String(currentNumber*previousNumber)
        case "/":
            if currentNumber != 0{
                result = String(format: "%.2f",(previousNumber/currentNumber))
            }
            else{
                result = "Error"
            }
        default:
            result = String(currentNumber)
        }
        return result
    }
}
