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
    //case NEGATIVE
    // case DECIMAL
    // comment
    
}

class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!

    var labelString:String = "0"
    var currentMode:modes = .NO_MODE_SET
    var savedNum:Int = 0
    var lastButtonWasMode:Bool = false
    var decimal:Bool = false
    var negative:Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func didPressDecimalPoint(_ sender: UIButton) {
        if (!decimal) {
            decimal = true
            let decimalChar:String = "."
        
            // turn labelString into int to remove leading zero's
            let intLabelString:Int = Int(labelString)!
        
            // turn labelString back into string to append '.'
            labelString = "\(intLabelString)"
            labelString = labelString.appending(decimalChar)
        
            label.text = labelString
        }
    }
    
    @IBAction func didPressNegative(_ sender: UIButton) {
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
        
                // turn labelString back into string to append '-'
                labelString = "\(intLabelString)"
                labelString = negativeChar.appending(labelString)
                
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
    
    @IBAction func didPressEquals(_ sender: Any) {
    }
    
    @IBAction func didPressClear(_ sender: Any) {
        // reset everything
        label.text = "0"
        labelString = "0"
        currentMode = modes.NO_MODE_SET
        savedNum = 0
        lastButtonWasMode = false
        decimal = false
        negative = false
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
    
    @IBAction func didPressNumber(_ sender: UIButton) {
        // retrieve label value of button
        let stringValue:String? = sender.titleLabel?.text
        labelString = labelString.appending(stringValue!)
        updateText()
    }
    
    // update label text after: any number press, clear, equals, negative, or decimal pressed
    func updateText() {
        if (decimal) {
            label.text = labelString
        } else {
            guard let labelInt:Int = Int(labelString) else {
                return
            }
            label.text = "\(labelInt)"
        }
    }

    func changeMode(newMode:modes) {
        
    }
}

