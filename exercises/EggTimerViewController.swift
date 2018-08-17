//
//  EggTimerViewController.swift
//  catYears
//
//  Created by Deborah Newberry on 8/15/18.
//  Copyright © 2018 Deborah Newberry. All rights reserved.
//

import UIKit

class EggTimerViewController: UIViewController {
    var timer = Timer()
    var count = 210
    
    @IBOutlet weak var secondsLabel: UILabel!
    
    @IBAction func add(_ sender: Any) {
        count += 10
        updateLabel()
    }
    
    @IBAction func pause(_ sender: Any) {
        timer.invalidate()
    }
    
    @IBAction func play(_ sender: Any) {
        newTimer()
    }
    
    @IBAction func reset(_ sender: Any) {
        count = 210
        updateLabel()
    }
    
    @IBAction func subtract(_ sender: Any) {
        guard count > 9 else {
            return
        }
        
        count -= 10
        updateLabel()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateLabel()
    }
    
    @objc func timerHandler() {
        count -= 1
        
        if count == 0 {
            timer.invalidate()
        }
        
        updateLabel()
    }
    
    func updateLabel() {
        secondsLabel.text = String(count)
    }
    
    func newTimer() {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(EggTimerViewController.timerHandler), userInfo: nil, repeats: true)
    }
}
