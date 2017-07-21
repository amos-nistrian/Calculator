//
//  ViewController.swift
//  Calculator
//
//  Created by Amos  on 7/17/17.
//  Copyright © 2017 Amos Nistrian. All rights reserved.
//

import UIKit

enum modes {
    case NO_MODE_SET
    case ADDITION
    case SUBTRACTION
    case MULTIPLICATION
    case DIVISION
}

class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!

    var labelString:String = "0"
    var currentMode:modes = .NO_MODE_SET
    var savedNumInt:Int = 0
    var savedNumDbl:Double = 0
    var lastButtonWasMode:Bool = false
    var decimal:Bool = false
    var negative:Bool = false
    var firstNumberFinal:Double = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func didPressDecimalPoint(_ sender: UIButton) {
        lastButtonWasMode = false

        if (!decimal) {
            decimal = true
            let decimalChar:String = "."
            
            print("labellllString is ", labelString)
            let intLabelString:Int = Int(labelString)! // this drops the negative
            print("intLabelString is nowwww ", +intLabelString)
        
            // turn labelString back into string to append '.'
            labelString = "\(intLabelString)"
            labelString = labelString.appending(decimalChar)
            print("labeString is now! ", labelString)
            
            if (negative) {
                let neg:String = "-"
                labelString = neg.appending(labelString)
            }

            label.text = labelString
            savedNumInt = 0
        }
    }
    
    @IBAction func didPressNegative(_ sender: UIButton) {
        lastButtonWasMode = false

        let negativeChar:String = "-"
        
        if (!negative) {
            if (decimal) {
                labelString = negativeChar.appending(labelString)
                
                // update the label
                label.text = labelString
                negative = true
            } else {
                // turn labelString into int to remove leading zero's
                let intLabelString:Int = Int(labelString)!
                //print("line 78 labelString is ", labelString)
        
                // turn labelString back into string to append '-'
                labelString = "\(intLabelString)"
                labelString = negativeChar.appending(labelString)
                //print("line 83 labelString is now ", labelString)

                savedNumInt = Int(labelString)! * -1
                // update the label
                label.text = labelString
                negative = true
            }
        } else {
            if (decimal) {
                // remove negative sign
                let index = labelString.index(labelString.startIndex, offsetBy: 1)
                labelString = labelString.substring(from: index)
                
                // update the label
                label.text = labelString
                negative = false
            } else {
                // turn labelString into int to remove leading zero's
                var intLabelString:Int = Int(labelString)!
                
                // remove negative sign
                intLabelString = intLabelString * -1
                labelString = "\(intLabelString)"
                
                // update the label
                label.text = labelString
                negative = false
            }
        }
    }
    
    @IBAction func didPressClear(_ sender: Any) {
        // reset everything
        label.text = "0"
        labelString = "0"
        currentMode = modes.NO_MODE_SET
        savedNumInt = 0
        savedNumDbl = 0
        lastButtonWasMode = false
        decimal = false
        negative = false
    }
    
    @IBAction func didPressNumber(_ sender: UIButton) {
        // retrieve label value of button
        let stringValue:String? = sender.titleLabel?.text
        //print("Appending "+stringValue!)
        //print("To ", labelString)
        
        if (lastButtonWasMode) {
           // print("Saved num double is ", +savedNumDbl)
            //print("Saved num int is ", +savedNumInt)
            labelString = ""
            lastButtonWasMode = false
        }
        //print("labelString was ", labelString)
        labelString = labelString.appending(stringValue!)
        //print("labelString is now ", labelString)
        updateText()
    }
    
    // update label text after: any number press, clear, equals, negative, or decimal pressed
    func updateText() {
        if (decimal) {
            label.text = labelString
            if (currentMode == .NO_MODE_SET) {
                savedNumDbl = Double(labelString)!
            }
        } else {
            guard let labelInt:Int = Int(labelString) else {
                return
            }
            label.text = "\(labelInt)"
            if (currentMode == .NO_MODE_SET){
                //print("Updating savedNumINT")
                savedNumInt = labelInt
            }
        }
    }
    
    @IBAction func didPressDivide(_ sender: Any) {
        changeMode(newMode: .DIVISION)
    }
    
    @IBAction func didPressMultiply(_ sender: Any) {
        changeMode(newMode: .MULTIPLICATION)
    }
    
    @IBAction func didPressSubtract(_ sender: Any) {
        changeMode(newMode: .SUBTRACTION)
    }
    
    @IBAction func didPressPlus(_ sender: Any) {
        changeMode(newMode: .ADDITION)
    }
    
    @IBAction func didPressEquals(_ sender: Any) {
        
        guard let labelNum:Double =  Double(labelString) else {
            return
        }
        
        if ( currentMode == .NO_MODE_SET || lastButtonWasMode) {
            return
        }
        
        // find out which ever is set (savedNumInt or savedNumDouble) turn it into double
        //let num1:Double = (savedNumInt == 0 ? savedNumDbl : Double(savedNumInt))
        //let result:Double = performOperation(firstNum:num1 , secondNum:labelNum)
        let result:Double = performOperation(firstNum:firstNumberFinal , secondNum:labelNum)

        
        // Format the string to drop any zeros ex 12.0 - > 12
        let numberFormatter: NumberFormatter = {
            let nf = NumberFormatter()
            nf.numberStyle = .decimal
            nf.minimumFractionDigits = 0
            // stop at 3 digit past decimal and round (ex: 2.0001 -> 2 & 1.2348 -> 1.235)
            nf.maximumFractionDigits = 3
            return nf
        }()
        
        let myNumber = NSNumber(value: result)
        let resultString:String = numberFormatter.string(from: myNumber)!
        
        // Update the label
        label.text = resultString
        
    }
    
    func performOperation(firstNum:Double, secondNum:Double) -> Double {
        print(firstNum)
        print(secondNum)
        var result:Double = 0
        // Perform the operation then return the string of the solution
        switch currentMode {
        case .ADDITION  :
            result = firstNum + secondNum
        case .SUBTRACTION :
            result = firstNum - secondNum
        case .MULTIPLICATION  :
            result = firstNum * secondNum
        case .DIVISION  :
            result = firstNum / secondNum
        default : ()
        }
        return result
    }
    
    func changeMode(newMode:modes) {
        // take first number mode 2nd number, update text with the string
        if (savedNumInt == 0 && savedNumDbl == 0) {
            return
        }
        currentMode = newMode
        lastButtonWasMode = true
        
        // reset decimal
        decimal = false
        labelString = "0"
        negative = false
        
        firstNumberFinal = (savedNumInt == 0 ? savedNumDbl : Double(savedNumInt))
    }
}

