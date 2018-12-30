//
//  SettingsViewController.swift
//  TipCalc
//
//  Created by Micaella Morales on 12/26/18.
//  Copyright © 2018 Micaella Morales. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    let defaults = UserDefaults.standard
    var changeTip = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func changeSetting(_ sender: UIButton) {
        changeTip = true
        defaults.set(sender.tag, forKey: "index")
        defaults.set(changeTip, forKey: "changeTip")
        defaults.synchronize()
        
        changeTip = false
    }
    

}
