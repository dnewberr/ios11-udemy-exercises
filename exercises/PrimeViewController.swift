//
//  PrimeViewController.swift
//  catYears
//
//  Created by Deborah Newberry on 8/15/18.
//  Copyright © 2018 Deborah Newberry. All rights reserved.
//

import UIKit

class PrimeViewController: UIViewController {
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var input: UITextField!
    
    @IBAction func checkInput(_ sender: Any) {
        guard let textInput = input.text, let numInput = Int(textInput) else {
            resultLabel.text = "Please enter a positive whole number"
            return
        }
        
        resultLabel.text = isPrime(numInput)
            ? "\(numInput) is prime!"
            : "\(numInput) is not prime"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resultLabel.text = ""
    }

    func isPrime(_ n: Int) -> Bool{
        guard n != 2 && n != 3 else {
            return true
        }
        
        guard n > 2 && n % 2 != 0 && n % 3 != 0 else {
            return false
        }
        
        let sqrtN = sqrt(Double(n))
        var cur: Double = 6
        
        while cur <= sqrtN {
            if n % Int(cur - 1) == 0 || n % Int(cur + 1) == 0 {
                return false
            }
            cur += 6
        }
        
        return true
    }

}
