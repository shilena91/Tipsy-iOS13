//
//  ViewController.swift
//  Tipsy
//
// Created by Created by Hoang on 27.3.2020.
// Copyright © 2020 Hoang. All rights reserved.
//


import UIKit

class CalculatorViewController: UIViewController {

    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    var tipResult: Float?
    var tipPct: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func tipChanged(_ sender: UIButton) {
        
        billTextField.endEditing(true)
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
        sender.isSelected = true
        
        let tipPctStr = sender.titleLabel?.text
        tipPct = Int(tipPctStr!.dropLast())
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        splitNumberLabel.text = "\(Int(sender.value))"
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        
        tipResult = calculateTip()
        performSegue(withIdentifier: "calculateTip", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "calculateTip" {
            let resultVC = segue.destination as? ResultsViewViewController
            resultVC?.totalLabeltext = String(format: "%.2f", tipResult!)
            resultVC?.splitNumber = Int(splitNumberLabel.text!)
            resultVC?.tipPct = tipPct
        }
    }
    
    func calculateTip() -> Float {
        var tipResult: Float = 0.0
        let splitNumber = Float(splitNumberLabel.text!)
                
        if let totalBill = Float(billTextField.text!) {
            if tenPctButton.isSelected == true {
                tipResult = totalBill * 0.1 / splitNumber!
            }
            else if twentyPctButton.isSelected == true {
                tipResult = totalBill * 0.2 / splitNumber!
            }
        }
        return (tipResult)
    }
}
