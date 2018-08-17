//
//  AddViewController.swift
//  catYears
//
//  Created by Deborah Newberry on 8/15/18.
//  Copyright © 2018 Deborah Newberry. All rights reserved.
//

import UIKit

class AddViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var input: UITextField!
    
    
    @IBAction func addItem(_ sender: Any) {
        if let item = input.text {
            if !item.trimmingCharacters(in: .whitespaces).isEmpty {
                var list = UserDefaults.standard.array(forKey: "list") as? [String] ?? [String]()
                list.append(item)
                UserDefaults.standard.set(list, forKey: "list")
            }
            input.text = ""
        }
        
        input.endEditing(true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        input.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        input.resignFirstResponder()
        return true
    }
    
}
