//
//  TimesTablesViewController.swift
//  catYears
//
//  Created by Deborah Newberry on 8/15/18.
//  Copyright © 2018 Deborah Newberry. All rights reserved.
//

import UIKit

class TimesTablesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var slider: UISlider!
    
    @IBOutlet weak var numLabel: UILabel!
    
    @IBAction func onChange(_ sender: Any) {
        let val = Int(slider.value)
        numLabel.text = String(val)
        tableView.isScrollEnabled = val != 0
        tableView.reloadData()
    }
    
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.tableFooterView = UIView()
        tableView.dataSource = self
        tableView.delegate = self
        
        numLabel.text = String(Int(slider.value))
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return slider.value < 1 ? 1 : 50
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "timesCell", for: indexPath)
        cell.textLabel?.text = "\(Int(slider.value) * (indexPath.row + 1))"
        return cell
    }
}
