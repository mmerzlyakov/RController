//
//  FirstViewController.swift
//  RController
//
//  Created by Михаил Мерзляков on 13.12.2017.
//  Copyright © 2017 Михаил Мерзляков. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {
    
    var sw1_flag: Bool!
      var sw2_flag: Bool!
      var sw3_flag: Bool!
      var sw4_flag: Bool!
      var sw5_flag: Bool!
      var sw6_flag: Bool!
          var sw7_flag: Bool!
          var sw8_flag: Bool!

    
    @IBOutlet weak var ReadBtn: UIButton!
    
    @IBOutlet weak var btn2: UIButton!
    @IBOutlet weak var btn1: UIButton!
    
    @IBOutlet weak var btn3: UIButton!
    
    @IBOutlet weak var Btn5: UIButton!
    
    @IBOutlet weak var Btn6: UIButton!
        @IBOutlet weak var btn4: UIButton!
    
    @IBAction func SW3(_ sender: Any) {
        
        if (sw3_flag == false) {
            sw3_flag = true
             ExecCMD(cmd: "http://192.168.0.240/cmd.cgi?cmd=REL,3,1")
        }
        else{
            sw3_flag=false
            ExecCMD(cmd: "http://192.168.0.240/cmd.cgi?cmd=REL,3,0")
        }

    }
    
    @IBAction func Connection(_ sender: Any) {
        
        let client:TCPClient = TCPClient(addr: "192.168.0.240", port: 2424)
        let (success,errmsg) = client.connect(timeout: 1)
        if success {
          
                let data = client.read(1024 * 10)
                if let d = data {
                    if let str = NSString(bytes: d, length: d.count, encoding: NSUTF8StringEncoding) {
                        print(str)
                    }
                }
        }
    }
    
    @IBAction func SW7(_ sender: Any) {
        
        if (sw7_flag == false) {
            sw7_flag = true
            ExecCMD(cmd: "http://192.168.0.240/cmd.cgi?cmd=REL,7,1")
        }
        else{
            sw7_flag=false
            ExecCMD(cmd: "http://192.168.0.240/cmd.cgi?cmd=REL,7,0")
        }
        //buhgatery
    }
    
    @IBAction func SW8(_ sender: Any) {
        if (sw8_flag == false) {
            sw8_flag = true
            ExecCMD(cmd: "http://192.168.0.240/cmd.cgi?cmd=REL,8,1")
        }
        else{
            sw8_flag=false
            ExecCMD(cmd: "http://192.168.0.240/cmd.cgi?cmd=REL,8,0")
        }
        //it otdel
    }
    
    @IBAction func SW4(_ sender: Any) {
        if (sw4_flag == false) {
            sw4_flag = true
            ExecCMD(cmd: "http://192.168.0.240/cmd.cgi?cmd=REL,4,1")
        }
        else{
            sw4_flag=false
            ExecCMD(cmd: "http://192.168.0.240/cmd.cgi?cmd=REL,4,0")
        }
        //garderob
    }
    
    @IBAction func SW2(_ sender: Any) {
   /*     if (sw2_flag == false) {
            sw2_flag = true
            ExecCMD(cmd: "http://192.168.0.240/cmd.cgi?cmd=REL,2,1")
        }
        else{
            sw2_flag=false
            ExecCMD(cmd: "http://192.168.0.240/cmd.cgi?cmd=REL,2,0")
        }
        //toilet */
    }
    
    @IBAction func SW1(_ sender: Any) {
        if (sw1_flag == false) {
            sw1_flag = true
            ExecCMD(cmd: "http://192.168.0.240/cmd.cgi?cmd=REL,1,1")
        }
        else{
            sw1_flag=false
            ExecCMD(cmd: "http://192.168.0.240/cmd.cgi?cmd=REL,1,0")
        }
        //seredinka
    }
    
    @IBAction func SWW2(_ sender: Any) {
        
        if (sw2_flag == false) {
            sw2_flag = true
            ExecCMD(cmd: "http://192.168.0.240/cmd.cgi?cmd=REL,2,1")
        }
        else{
            sw2_flag=false
            ExecCMD(cmd: "http://192.168.0.240/cmd.cgi?cmd=REL,2,0")
        }
        //toilet
    }
    
    
    
    func ExecCMD(cmd: String) -> String
    {
        var exp = ""
        
        let semaphore = DispatchSemaphore(value: 0)
        
        let url = URL(string: cmd)
        
        let task = URLSession.shared.dataTask(with: url!) { (data, response, error) in
            
             /*if let data = data {
                 /* do {
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
                } */
            } else if let error = error {
                print(error.localizedDescription)
            } */
        }
        
        
        task.resume()
       // semaphore.wait();
        
        return exp;
    }
    
    
    @IBAction func ee2(_ sender: Any) {
        
       
       
        // create the alert
        let alert = UIAlertController(title: "First Button", message: "You press 1 button", preferredStyle: UIAlertControllerStyle.alert)
        
        // add an action (button)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
        
        // show the alert
        self.present(alert, animated: true, completion: nil)
    }
    
    
    @IBAction func ee1(_ sender: Any) {
    
        // create the alert
        let alert = UIAlertController(title: "Second Button", message: "You press 2 button", preferredStyle: UIAlertControllerStyle.alert)
        
        // add an action (button)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
        
        // show the alert
        self.present(alert, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
             sw1_flag = false
             sw2_flag = false
             sw3_flag = false
             sw4_flag = false
             sw5_flag = false
             sw6_flag = false
             sw7_flag = false
             sw8_flag = false
  
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

