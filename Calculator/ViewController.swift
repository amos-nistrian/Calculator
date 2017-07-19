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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    @IBAction func didPressDecimalPoint(_ sender: Any) {
    }
    @IBAction func didPressEquals(_ sender: Any) {
    }
    @IBAction func didPressNegative(_ sender: Any) {
    }
    @IBAction func didPressClear(_ sender: Any) {
    }
    @IBAction func didPressDivide(_ sender: Any) {
    }
    @IBAction func didPressMultiply(_ sender: Any) {
    }
    @IBAction func didPressSubtract(_ sender: Any) {
    }
    @IBAction func didPressPlus(_ sender: Any) {
    }
    @IBAction func didPressNumber(_ sender: UIButton) {
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func uodateText() {
        // updated after: any number press, clear, equals, negative, decimal
        
    }
    
    func changeMode(newMode:modes) {
        
    }


}

