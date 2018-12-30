//
//  ViewController.swift
//  TipCalc
//
//  Created by Micaella Morales on 12/25/18.
//  Copyright © 2018 Micaella Morales. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var numPeopleField: UITextField!
    @IBOutlet weak var tipControl: UISegmentedControl!
    
    @IBOutlet weak var secondLabel: UILabel!
    @IBOutlet weak var eachLabel: UILabel!
    @IBOutlet weak var totalLabel2: UILabel!
    
    let defaults = UserDefaults.standard
    var changeTipSetting = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        billField.becomeFirstResponder()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tipControl.selectedSegmentIndex = defaults.integer(forKey: "index")
        changeTipSetting = defaults.bool(forKey: "changeTip")
        if(changeTipSetting == true) {
            calcTip((Any).self)
        }
    }

    @IBAction func onTap(_ sender: Any) {
        view.endEditing(true)
    }
    
    @IBAction func textFieldBeginEditing(_ sender: Any) {
        if(billField.text == "$"){
            billField.text = ""
            billField.textColor = UIColor.white
        }
        
        //hide the divided totals
        secondLabel.alpha = 0.0
        eachLabel.alpha = 0.0
        totalLabel2.alpha = 0.0
    }
    
    @IBAction func textFieldDoneEditing(_ sender: Any) {
        if(billField.text == ""){
            billField.text = "$"
            billField.textColor = UIColor(white: 1, alpha: 0.5)
        }
        
        //show the divided total
        secondLabel.alpha = 1.0
        eachLabel.alpha = 1.0
        totalLabel2.alpha = 1.0
    }
    
    @IBAction func calcTip(_ sender: Any) {
        let tipPercentages = [0.10, 0.15, 0.20]
        let bill = Double(billField.text!) ?? 0
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        let total = bill + tip
        let n = Double(numPeopleField.text!) ?? 1
        
        //secondLabel.text = String(Int(n))+":"
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
        if(n != 0) {
            totalLabel2.text = String(format: "$%.2f", total/n)
        }
        else {
            totalLabel2.text = String(format: "$%.2f", total)
        }
    }
    
    
    
}

