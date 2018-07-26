//
//  SettingsViewController.swift
//  PrestonSeguraTipCalculator
//
//  Created by RCMACEXT-20 on 7/26/18.
//  Copyright © 2018 SCMACEXT-00. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var defaultTipControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onDefaultChanged(_ sender: Any) {
        
        let defaults = UserDefaults.standard
        defaults.set(defaultTipControl.selectedSegmentIndex, forKey: "default_tip")
        defaults.synchronize()
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let defaults = UserDefaults.standard
        if (defaults.object(forKey: "default_tip") != nil) {
            let defaultSegIndex = defaults.integer(forKey: "default_tip")
            defaultTipControl.selectedSegmentIndex = defaultSegIndex
        }
        // This is a good place to retrieve the default tip percentage from UserDefaults
        // and use it to update the tip amount

    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
    }
  
    

    
    
}
