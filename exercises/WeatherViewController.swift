//
//  WeatherViewController.swift
//  catYears
//
//  Created by Deborah Newberry on 8/16/18.
//  Copyright © 2018 Deborah Newberry. All rights reserved.
//

import UIKit

class WeatherViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var responseEffectView: UIVisualEffectView!
    @IBOutlet weak var cityInput: UITextField!
    @IBOutlet weak var responseLabel: UILabel!
    @IBAction func submit(_ sender: Any) {
        cityInput.endEditing(true)
        guard let city = cityInput.text, !city.trimmingCharacters(in: .whitespaces).isEmpty else {
            return
        }
        
        DispatchQueue.global(qos: .background).async { [weak self] in
            if let url = URL(string: "https://www.weather-forecast.com/locations/\(city.replacingOccurrences(of: " ", with: "-"))/forecasts/latest") {
                let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, response, error in
                    if let error = error {
                        self?.showMessage("The weather there couldn't be found. Please try again.")
                        print(error)
                    } else if let data = data {
                        let dataString = String(data: data, encoding: String.Encoding.utf8)
                        let separator = "Weather Today </h2>(1&ndash;3 days)</span><p class=\"b-forecast__table-description-content\"><span class=\"phrase\">"
                        if let contentArray = dataString?.components(separatedBy: separator), contentArray.count == 2 {
                            let endSeparator = "</span></p></td><td class=\"b-forecast__table-description-cell--js\""
                            
                            let weatherReport = contentArray[1].components(separatedBy: endSeparator)[0]
                            self?.showMessage(weatherReport.replacingOccurrences(of: "&deg;C", with: "℃ ").replacingOccurrences(of: "&deg;F", with: "℉ "))
                        } else {
                            self?.showMessage("The weather there couldn't be found. Please try again.")
                        }
                    }
                }
                
                task.resume()
            } else {
                self?.showMessage("The weather there couldn't be found. Please try again.")
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        responseEffectView.isHidden = true
        cityInput.keyboardAppearance = .dark
        cityInput.returnKeyType = .go
        cityInput.delegate = self
    }

    func showMessage(_ message: String) {
        DispatchQueue.main.async { [weak self] in
            self?.responseLabel.text = message
            self?.responseEffectView.isHidden = false
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        cityInput.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        cityInput.resignFirstResponder()
        submit(self)
        return true
    }
}
