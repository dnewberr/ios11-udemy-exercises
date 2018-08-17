//
//  FingersViewController.swift
//  catYears
//
//  Created by Deborah Newberry on 8/15/18.
//  Copyright © 2018 Deborah Newberry. All rights reserved.
//

import UIKit

class FingersViewController: UIViewController {
    @IBOutlet weak var guessInput: UITextField!
    @IBOutlet weak var resultLabel: UILabel!
    
    @IBAction func guess(_ sender: Any) {
        guard let ansText = guessInput.text, let ansNum = UInt32(ansText) else {
            return
        }
        
        resultLabel.text = ansNum == answer
            ? "You're right!"
            : "Wrong! The answer was \(answer).";
        answer = arc4random_uniform(6)
    }
    
    var answer = arc4random_uniform(6)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resultLabel.text = ""
    }
}
