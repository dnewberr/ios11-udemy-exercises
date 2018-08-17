//
//  CatAgeViewController.swift
//  catYears
//
//  Created by Deborah Newberry on 8/15/18.
//  Copyright © 2018 Deborah Newberry. All rights reserved.
//

import UIKit

class CatAgeViewController: UIViewController {
    @IBOutlet weak var yearInput: UITextField!
    @IBOutlet weak var yearLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        yearLabel.text = ""
    }

    @IBAction func calculateCatYears(_ sender: Any) {
        guard let yearTextInput = yearInput.text,
            let yearNum = Int(yearTextInput) else {
            return
        }
        
        self.yearLabel.text = "Your cat is \(yearNum * 7) in cat years!"
    }
}

