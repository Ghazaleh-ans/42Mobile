//
//  ViewController.swift
//  Calculator Layout iOS13
//
//  Created by Angela Yu on 01/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var first = true
    @IBOutlet weak var inputVal: UILabel!
    @IBOutlet weak var resVal: UILabel!

    @IBAction func inputButtonPressed(_ sender: UIButton) {
        let newText = sender.titleLabel?.text ?? ""
        if first {
            inputVal.text = newText
            first = false
        }
        else {
            inputVal.text = (inputVal.text ?? "") + newText
        }
        print("button pressed :\(sender.titleLabel!.text!)")
    }
    
    @IBAction func calculate(_ sender: UIButton) {
        print("button pressed :\(sender.titleLabel!.text!)")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

