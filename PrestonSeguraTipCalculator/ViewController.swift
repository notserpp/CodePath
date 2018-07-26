//
//  ViewController.swift
//  PrestonSeguraTipCalculator
//
//  Created by RCMACEXT-47 on 7/10/18.
//  Copyright © 2018 SCMACEXT-00. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var billField: UITextField!
    
    @IBOutlet weak var tipControl: UISegmentedControl!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //set the defaultTipIndex to 0, in case the actual default doesn't exist
        var defaultTipIndex = 0
        
        //get the user-defined defaults
        let defaults = UserDefaults.standard
        if (defaults.object(forKey: "default_tip") != nil) {
            defaultTipIndex = defaults.integer(forKey: "default_tip")
        }
        
        //set the segment control to reflect the defaulted value
        tipControl.selectedSegmentIndex = defaultTipIndex
        
        calculateTip(defaultTipIndex)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onTap(_ sender: Any) {
        view.endEditing(true)
    }
    
    @IBAction func calculateTip(_ sender: Any) {
        
        let tipPercentages = [0.18, 0.2, 0.25]
        
        var backgroundColors = [
            [UIColor(red: 157/255, green: 196/255, blue: 164/255, alpha: 1), UIColor(red: 119/255, green: 140/255, blue: 119/255, alpha: 1)],
            [UIColor(red: 158/255, green: 199/255, blue: 87/255, alpha: 1), UIColor(red: 115/255, green: 150/255, blue: 58/255, alpha: 1)],
            [UIColor(red: 81/255, green: 184/255, blue: 146/255, alpha: 1), UIColor(red: 81/255, green: 140/255, blue: 114/255, alpha: 1)],
            [UIColor(red: 43/255, green: 140/255, blue: 134/255, alpha: 1), UIColor(red: 24/255, green: 97/255, blue: 92/255, alpha: 1)]
        ]
        let constant backgroundColor = backgroundColors[tipControl.selectedSegmentIndex][0]
        let constant tintColor = backgroundColors[tipControl.selectedSegmentIndex][1]
        
        let bill = Double(billField.text!) ?? 0
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        let total = bill + tip
        
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
        
        
        if(billField.text != "") {
            UIView.animate(withDuration: 0.3, animations: {
                
                self.billField.center = CGPoint(x: self.billField.center.x, y: CGFloat(110))
                
                self.tipControl.tintColor = tintColor

                self.view.backgroundColor = backgroundColor
            })
        } else {
            UIView.animate(withDuration: 0.3, animations: {
               
                self.billField.center = CGPoint(x: self.billField.center.x, y: CGFloat(180))
                self.view.backgroundColor = UIColor(red: 210/255, green: 216/255, blue: 219/255, alpha: 1)
            })
        }
    }
    
    }
    
    
    
    
}

