//
//  ResultViewController.swift
//  Tipsy
//
//  Created by Gery Josua Sumual on 21/05/24.
//  Copyright © 2024 The App Brewery. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    @IBOutlet weak var payEachLabel: UILabel!
    @IBOutlet weak var infoLabel: UILabel!
    var result: String?
    var tip: String?
    var split: String?
    override func viewDidLoad() {
        super.viewDidLoad()
        payEachLabel.text = result ?? "Error"
        if let s = split, let t = tip {
            infoLabel.text = "Split between \(s) people, with \(t)% tip."
        } else {
            infoLabel.text = ""
            print("error")
        }
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
