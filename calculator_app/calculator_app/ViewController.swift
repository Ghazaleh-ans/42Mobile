//
//  ViewController.swift
//  Calculator Layout iOS13
//
//  Created by Angela Yu on 01/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var inputVal: UILabel!
    @IBOutlet weak var resVal: UILabel!

    @IBAction func inputButtonPressed(_ sender: UIButton) {
        print("button pressed :\(sender.titleLabel!.text!)")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

