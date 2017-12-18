//
//  SecondViewController.swift
//  RController
//
//  Created by Михаил Мерзляков on 13.12.2017.
//  Copyright © 2017 Михаил Мерзляков. All rights reserved.
//

import UIKit
import Foundation
import SystemConfiguration

class SecondViewController: UIViewController {

    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var label1: UILabel!
    
    @IBOutlet weak var switch1: UISwitch!
    @IBOutlet weak var Spin: UIActivityIndicatorView!
    
    @IBOutlet weak var textview: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func checkURL(explanation: String){

        
    }
    
    
    @IBAction func eee(_ sender: Any) {
        var exp = ""
    
     
        
          let semaphore = DispatchSemaphore(value: 0)
        
        let url = URL(string: "https://api.nasa.gov/planetary/apod?api_key=DEMO_KEY")
        
        let task = URLSession.shared.dataTask(with: url!) { (data, response, error) in
            
            if let data = data {
                do {
                    // Convert the data to JSON
                    let jsonSerialized = try JSONSerialization.jsonObject(with: data, options: []) as? [String : Any]
                    
                    if let json = jsonSerialized, let url = json["url"], let
                        explanation = json["explanation"] {
                        print(url)
                        print(explanation)
                        
                        exp = "\(explanation)"
                        
                        semaphore.signal()
                    }
                }  catch let error as NSError {
                    print(error.localizedDescription)
                }
            } else if let error = error {
                print(error.localizedDescription)
            }
        }
        
        
        task.resume()

        semaphore.wait();
        textview.text = exp
        
    }
    
    @IBAction func FFF(_ sender: UISlider) {
        
        if self.switch1.isOn {
            self.Spin.startAnimating()
        }
        if !self.switch1.isOn {
            self.Spin.stopAnimating()
        }
        var currentValue = Int(sender.value)
        
        label.text = "\(currentValue)"
        
    //    self.Spin.stopAnimating()
    }
    
    @IBAction func showAlertButtonTapped(_ sender: UIButton) {
        
        textview.text = ""
        // create the alert
        let alert = UIAlertController(title: "My Title", message: "This is my message.", preferredStyle: UIAlertControllerStyle.alert)
        
        // add an action (button)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
        
        // show the alert
        self.present(alert, animated: true, completion: nil)
    }
}

