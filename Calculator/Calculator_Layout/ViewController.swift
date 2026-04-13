//
//  ViewController.swift
//  Calculator Layout iOS13
//
//  Created by Angela Yu on 01/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBAction func pressedNumber(_ sender: UIButton) {
        print(sender.titleLabel!.text!)
    }
    
    @IBAction func decimalPressed(_ sender: UIButton) {
        print(sender.titleLabel!.text!)
    }
    @IBAction func pressedOperator(_ sender: UIButton) {
        print(sender.titleLabel!.text!)
    }
    
    @IBAction func ACButton(_ sender: UIButton) {
        print(sender.titleLabel!.text!)
    }
    
    @IBAction func CButton(_ sender: UIButton) {
        print(sender.titleLabel!.text!)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

