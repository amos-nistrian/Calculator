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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    // TODO dont double up on decimals
    @IBAction func didPressDecimalPoint(_ sender: UIButton) {
        if (!decimal) {
            decimal = true
            let negativeChar:String = "."
        
            // turn labelString into int to remove leading zero's
            let intLabelString:Int = Int(labelString)!
        
            // turn labelString back into string to append '.'
            labelString = "\(intLabelString)"
            labelString = labelString.appending(negativeChar)
        
            label.text = labelString
        }
    }
    
    // TODO dont double up on negatives
    @IBAction func didPressNegative(_ sender: UIButton) {
        let negativeChar:String = "-"
        if (decimal) {
            let dblLabelString:Double = Double(labelString)!
            labelString = "\(dblLabelString)"
            labelString = negativeChar.appending(labelString)
            label.text = labelString
        } else {
            // turn labelString into int to remove leading zero's
            let intLabelString:Int = Int(labelString)!
        
            // turn labelString back into string to append '-'
            labelString = "\(intLabelString)"
            labelString = negativeChar.appending(labelString)
        
            label.text = labelString
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
        let stringValue:String? = sender.titleLabel?.text
        labelString = labelString.appending(stringValue!)
        updateText()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // updated after: any number press, clear, equals, negative, decimal
    func updateText() {
        if (decimal) {
            guard let labelInt:Double = Double(labelString) else {
                return
            }
            label.text = "\(labelInt)"

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

