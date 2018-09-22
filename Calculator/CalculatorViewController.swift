//
//  ViewController.swift
//  Calculator
//
//  Created by Siva on 9/13/18.
//  Copyright © 2018 Siva. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {
    
    private var currentNumber:Double = 0
    private var calculation:Bool = false
    private var previousNumber:Double = 0
    private var operation:String = ""
    private var displayResults:Bool = false
    
    @IBOutlet weak private var divisionButton: UIButton!
    @IBOutlet weak private var multiplyButton: UIButton!
    @IBOutlet weak private var addButton: UIButton!
    @IBOutlet weak private var subtractButton: UIButton!
    @IBOutlet weak private var equalsButton: UIButton!
    
    @IBOutlet weak private var result: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func pressNumbers(sender:UIButton){
        if displayResults{
            result.text = ""
        }
        if let enteredNumber = (sender.titleLabel?.text){
            if let numberOnScreen = result.text{
                result.text = numberOnScreen + enteredNumber
            }
            else{
                result.text = enteredNumber
            }
        }
        if let number = Double(result.text!){
            currentNumber = number
        }
        displayResults = false
        calculation = true
    }
    
    @IBAction func performCalculation(sender:UIButton){
        
        if let typeOfCalculation = sender.titleLabel?.text{
        if typeOfCalculation != "=" {
            operation = typeOfCalculation
            if displayResults == false{
                previousNumber = currentNumber
            }
            else{
                currentNumber = previousNumber
            }
            result.text = ""
            
        }
        else if typeOfCalculation == "=" && calculation == true{
            let calculatedValue = Calculation.performCalculation(previousNumber: previousNumber, currentNumber: currentNumber, operation: operation)
            result.text = calculatedValue
            if let numberOnscreen = Double(calculatedValue){
                previousNumber = numberOnscreen
            }
            displayResults = true
        }
        }
    }
    
    @IBAction func clearScreen(_ sender: UIButton) {
        
        previousNumber = 0
        currentNumber = 0
        operation = ""
        calculation = false
        result.text = ""
        displayResults = false
    }
    
}
