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

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func uodateText() {
        
    }
    
    func changeMode(newMode:modes) {
        
    }


}

