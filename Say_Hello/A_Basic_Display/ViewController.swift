//
//  ViewController.swift
//  A_Basic_Display
//
//  Created by Ghazall on 13.04.26.
//

import UIKit

class ViewController: UIViewController {

    var isOn = false
    @IBOutlet weak var textLabel: UILabel!
    @IBAction func clickMeButton(_ sender: Any) {
        isOn.toggle()
        textLabel.text = isOn ? "Hello World" : "A simple text"
        print("Button pressed")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

