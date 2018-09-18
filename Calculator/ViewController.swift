//
//  ViewController.swift
//  Calculator
//
//  Created by Siva on 9/13/18.
//  Copyright © 2018 Siva. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var currentNumber:Double = 0
    var calculation:Bool = false
    var previousNumber:Double = 0
    var operation:String = ""
    var displayResults:Bool = false
    
    @IBOutlet weak var divisionButton: UIButton!
    @IBOutlet weak var multiplyButton: UIButton!
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var subtractButton: UIButton!
    @IBOutlet weak var equalsButton: UIButton!
    
    @IBOutlet weak var result: UILabel!
    
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
        result.text? = result.text! + (sender.titleLabel?.text)!
        currentNumber = Double(result.text!)!
        displayResults = false
        calculation = true
    }
    
    @IBAction func performCalculation(sender:UIButton){
        
        if sender.titleLabel?.text! != "="{
            
            operation = (sender.titleLabel?.text)!
            if displayResults == false{
                previousNumber = currentNumber
            }
            result.text = ""
            
        }
        else if sender.titleLabel?.text! == "=" && calculation == true{
            performCalculation()
            displayResults = true
        }
        
    }
    
    func performCalculation(){
        switch operation {
        case "+":
            result.text = String(currentNumber+previousNumber)
        case "-":
            result.text = String(previousNumber-currentNumber)
        case "x":
            result.text = String(currentNumber*previousNumber)
        case "/":
            if currentNumber != 0{
                result.text = String(format: "%.2f",(previousNumber/currentNumber))
            }
            else{
                result.text = "Error"
            }
        default:
            result.text = String(currentNumber)
        }
        
        previousNumber = Double(result.text!)!
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
