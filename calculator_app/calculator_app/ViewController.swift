
import UIKit

class ViewController: UIViewController {

    var first = true
    let operators: Set<Character> = ["+", "-", "×", "/", "%"]
    
    @IBOutlet weak var inputVal: UILabel!
    @IBOutlet weak var resVal: UILabel!

    @IBAction func inputButtonPressed(_ sender: UIButton) {
        
        let buttonText = sender.titleLabel?.text ?? ""
        print("button pressed :\(buttonText)")

        switch buttonText {

        case "AC":
            inputVal.text = "0"
            resVal.text = "0"
            first = true

        case "C":
            guard !first, let current = inputVal.text else { return }
            let newText = String(current.dropLast())
            
            if newText.isEmpty || newText == "-" {
                inputVal.text = "0"
                first = true
            } else {
                inputVal.text = newText
            }
            
        case "+", "×", "/", "%":
            guard !first, let current = inputVal.text else { return }
            if let last = current.last, operators.contains(last) {
                inputVal.text = String(current.dropLast()) + buttonText
            } else {
                inputVal.text = current + buttonText
            }

        case "-":
            if first {
                inputVal.text = "-"
                first = false
            } else {
                let current = inputVal.text ?? "0"
                if let last = current.last, operators.contains(last) {
                    inputVal.text = String(current.dropLast()) + buttonText
                } else {
                    inputVal.text = current + buttonText
                }
            }

        case ".":
            if first {
                inputVal.text = "0."
                first = false
            } else {
                let current = inputVal.text ?? "0"
                if !currentNumberHasDecimal(current) {
                    inputVal.text = current + "."
                }
            }

        case "00":
            if first {
                inputVal.text = "0"
                first = false
            } else {
                inputVal.text = (inputVal.text ?? "0") + "00"
            }

        default:
            if first {
                inputVal.text = buttonText
                first = false
            } else {
                inputVal.text = (inputVal.text ?? "0") + buttonText
            }
        }
    }

    @IBAction func calculate(_ sender: UIButton) {
        print("button pressed :=")

        guard let expression = inputVal.text, !expression.isEmpty else { return }
        resVal.text = evaluateExpression(expression)
    }

    private func evaluateExpression(_ expression: String) -> String {
        let expr = expression
            .replacingOccurrences(of: "×", with: "*")
            .filter { !$0.isWhitespace }
        
        var index = expr.startIndex

        guard let result = parseExpression(expr, &index), index == expr.endIndex else {
            return "Error"
        }
        if result.isNaN || result.isInfinite {
            return "Error"
        }
        return formatResult(result)
    }

    private func parseExpression(_ expr: String, _ index: inout String.Index) -> Double? {
        
        guard var result = parseTerm(expr, &index) else { return nil }

        while index < expr.endIndex {
            let op = expr[index]
            guard op == "+" || op == "-" else { break }
            index = expr.index(after: index)
            guard let right = parseTerm(expr, &index) else { return nil }
            result = op == "+" ? result + right : result - right
        }
        return result
    }

    private func parseTerm(_ expr: String, _ index: inout String.Index) -> Double? {

        guard var result = parseFactor(expr, &index) else { return nil }

        while index < expr.endIndex {
            let op = expr[index]
            guard op == "*" || op == "/" || op == "%" else { break }
            index = expr.index(after: index)
            guard let right = parseFactor(expr, &index) else { return nil }

            if op == "*" {
                result *= right
            } else if op == "/" {
                guard right != 0 else { return Double.nan }
                result /= right
            } else {
                guard right != 0 else { return Double.nan }
                result = result.truncatingRemainder(dividingBy: right)
            }
        }
        return result
    }
    
    private func parseFactor(_ expr: String, _ index: inout String.Index) -> Double? {
        guard index < expr.endIndex else { return nil }

        var isNegative = false
        if expr[index] == "-" {
            isNegative = true
            index = expr.index(after: index)
        }

        var numStr = ""
        var hasDecimal = false

        while index < expr.endIndex {
            let c = expr[index]

            if c.isNumber {
                numStr.append(c)
                index = expr.index(after: index)
            } else if c == "." && !hasDecimal {
                numStr.append(c)
                hasDecimal = true
                index = expr.index(after: index)
            } else {
                break
            }
        }
        guard !numStr.isEmpty, let num = Double(numStr) else { return nil }
        return isNegative ? -num : num
    }

    private func currentNumberHasDecimal(_ expression: String) -> Bool {
        for char in expression.reversed() {
            if operators.contains(char) { break }
            if char == "." { return true }
        }
        return false
    }

    private func formatResult(_ value: Double) -> String {
        if value.truncatingRemainder(dividingBy: 1) == 0 && abs(value) < 1e15 {
            return String(Int64(value))
        }
        return String(value)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
