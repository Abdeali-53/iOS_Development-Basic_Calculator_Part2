//
//  ViewController.swift
//  301085484_Assignment1 (FILE NAME)
//
//  Created by Abdeali Mody on 2020-09-30. (AUTHOR'S NAME & DATE)
//  301085484 (STUDENT ID)
//  VERSION 1.0

import UIKit

class ViewController: UIViewController
{
    //Declaring the variables : Datatype = value.
    //abc
    var operand1: Double = 0.0
    var operand2: Double = 0.0
    var activeOperation : String = ""
    var operators: String = ""
    var result: String = ""

    @IBOutlet weak var ResultLabel: UILabel!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
    }
    //Creating function for number buttons.
    @IBAction func OnNumberButton_Press(_ sender: UIButton)
    {
    
        switch sender.titleLabel!.text!
    {
    case "C":
        ResultLabel.text! = "0"
        
        //Here I am cleaning the result variable as we are using this variable to save the numbers the user enter again ,we cannot have "trunk values".
        result = ""
    
    case "⌫":
        //popLast method will remove the last entered number or operator from the display panel.
        ResultLabel.text!.popLast()
            
        if((ResultLabel.text!.count < 1) || (ResultLabel.text! == "-"))
            {
                ResultLabel.text! = "0"
            }
    
    case ".":
            if(!ResultLabel.text!.contains("."))
            {
                ResultLabel.text! += "."
            }
    
    case "+/-":
        
    //if the number is 5 and we press this button it is going to change to -5 and vice-versa
    if(ResultLabel.text! != "0")
    {
            if(!ResultLabel.text!.contains("-"))
            {
                ResultLabel.text!.insert("-", at: ResultLabel.text!.startIndex)
            }
            else
            {
                ResultLabel.text!.remove(at: ResultLabel.text!.startIndex)
            }
     }
     
    default:
            if(ResultLabel.text == "0")
            {
                ResultLabel.text! = sender.titleLabel!.text!
                result += sender.titleLabel!.text!
                
            }
            else
            {
                ResultLabel.text! += sender.titleLabel!.text!
                result += sender.titleLabel!.text!
            }
        /*if(ResultLabel.text!.contains("."))
            {
                print(Double(ResultLabel.text!)!)
            }*/
        }
    }
    // Creating function for operator buttons.
    @IBAction func OnOperatorButton_Press(_ sender: UIButton)
    {
        activeOperation = sender.titleLabel!.text!
        
        //we need to check that the entered number is operand1 or operand2, now we will save the first value in operand1.
        if operand1 == 0.0
        {
            print(result)
            operand1 = Double(result)!
            result = ""
        }
        else
        {
            operand2 = Double(result)!
            result = ""
        }
                switch(activeOperation)
                {
                case "+":
                    ResultLabel.text! += "+"
                    operators = "+"
    
                case "-":
                    ResultLabel.text! += "-"
                    operators = "-"
                    
                case "x":
                    ResultLabel.text! += "x"
                    operators = "x"
                case "÷":
                    ResultLabel.text! += "÷"
                    operators = "÷"
                    
                case "%":
                    var test = ""
                    test = calculate(math: operators)
                    ResultLabel.text! = test
                    operators = "%"
                    
                case "=":
                    var test = ""
                    //just calling the calculate function and passing the the parameters. This will help us to call a particular operator.
                    test = calculate(math: operators)
                    
                    //Now we already have the value isnside the test variable, so we display the output in result panel.
                    ResultLabel.text! = test
                    
                default:
                    print("error")
                }
    }
    
    func calculate(math: String) -> String
    {
        var finalresult = ""
        
        //here we check the signal to go to the correct operation
        if (math == "+")
        {
            finalresult = String(Float32(operand1 + operand2))
        }
        else if (math == "-")
        {
            finalresult = String(Float32(operand1 - operand2))
        }
        else if (math == "x")
        {
            finalresult = String(Float32(operand1 * operand2))
        }
        else if (math == "÷")
        {
            finalresult = String(Float32(operand1 / operand2))
        }
        else if (math == "%")
        {
            finalresult = String(Float32((operand1 / operand2) * 100))
        }
        
        //Here we need to clear the operand so user can perform more operations.
        operand1 = 0.0
        operand2 = 0.0
        result = finalresult
        
        //returning the final result.
        return finalresult
    }
}
