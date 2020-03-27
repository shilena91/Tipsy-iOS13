//
//  ResultsViewViewController.swift
//  Tipsy
//
//  Created by Hoang on 27.3.2020.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import UIKit

class ResultsViewViewController: UIViewController {

    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingLabel: UILabel!
    
    var totalLabeltext: String?
    var splitNumber: Int?
    var tipPct: Int?
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        totalLabel.text = totalLabeltext
        settingLabel.text = "Split between \(splitNumber!) people, with \(tipPct!)% tip"
        // Do any additional setup after loading the view.
    }
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        dismiss(animated: true)
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
