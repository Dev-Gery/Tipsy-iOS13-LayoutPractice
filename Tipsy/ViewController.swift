//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var totalBill: Double?
    var tipPercentage: Double?
    var split: Double = 2
    var paymentEach: Double?

    @IBOutlet weak var billLabel: UITextField!
    @IBOutlet var tipOptionLabels: [UIButton]!
    
    @IBAction func tipButtonPressed(_ sender: UIButton) {
        guard let index = tipOptionLabels.firstIndex(of: sender) else {
            print("unknown tip button tapped.")
            return
        }
        let buttonTapped = tipOptionLabels[index]
        tipOptionLabels.forEach({
            $0 == buttonTapped ? { $0.isSelected = true; tipPercentage = Double($0.currentTitle!) }($0) : { $0.isSelected = false }($0) })
    }
    
    
    @IBOutlet weak var splitLabel: UILabel!
    @IBOutlet weak var stepper: UIStepper!
    @IBAction func step(_ sender: UIStepper) {
        //still need to know whether the action is to increase or reduce
        split += Double(Int(sender.stepValue))
        splitLabel.text = String(split)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    //in prototyping/testing phase
    @IBAction func calculatePressed(_ sender: UIButton) {
//        let bill = Float(billLabel.text ?? "0")!
        let bill = 789.0
        var tip:Double!
        tipOptionLabels.forEach {
            if $0.isSelected {
                print($0.currentTitle)
                tip = Double(($0.currentTitle)!);
                return
            }
        }
        let split = Float(splitLabel.text!)
//        paymentEach = (bill + (bill * tip)) / split
        paymentEach = 23.5
        print(paymentEach)
        performSegue(withIdentifier: "gotoResult", sender: self)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "gotoResult" {
            let destinationVC = segue.destination as! ResultViewController
            destinationVC.result = String(format: "%.2f", paymentEach!)
            destinationVC.tip = String(format: "%.2f", tipPercentage ?? "13")
            destinationVC.split = String(split)
        }
    }
    

}

