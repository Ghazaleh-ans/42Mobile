
import UIKit

class ViewController: UIViewController {

    @IBAction func pressedNumber(_ sender: UIButton) {
        print("button pressed :\(sender.titleLabel!.text!)")
    }
    
    @IBAction func decimalPressed(_ sender: UIButton) {
        print("button pressed :\(sender.titleLabel!.text!)")
    }
    @IBAction func pressedOperator(_ sender: UIButton) {
        print("button pressed :\(sender.titleLabel!.text!)")
    }
    
    @IBAction func ACButton(_ sender: UIButton) {
        print("button pressed :\(sender.titleLabel!.text!)")
    }
    
    @IBAction func CButton(_ sender: UIButton) {
        print("button pressed :\(sender.titleLabel!.text!)")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

