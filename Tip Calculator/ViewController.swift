//
//  ViewController.swift
//  Tip Calculator
//
//  Created by BUKOLA OMOTOSO on 26/05/2016.
//  Copyright © 2016 ANDELA. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var billAmountLabel: UILabel!
    @IBOutlet var customTipPercentLabel1: UILabel!
    @IBOutlet var customTipPercentageSlider: UISlider!
    @IBOutlet var customTipPercentLabel2: UILabel!
    @IBOutlet var tip15Label: UILabel!
    @IBOutlet var total15Label: UILabel!
    @IBOutlet var tipCustomLabel: UILabel!
    @IBOutlet var totalCustomLabel: UILabel!
    @IBOutlet var inputTextField: UITextField!
    
    let decimal100 = NSDecimalNumber(string:"100,0")
    let decimal15Percent = NSDecimalNumber(string:"0.15")
    
    let formatter = NSNumberFormatterStyle.CurrencyStyle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        inputTextField.becomeFirstResponder();
    }
    

    @IBAction func calculateTip(sender: AnyObject) {
        let inputString = inputTextField.text
        let sliderValue = NSDecimalNumber(integer:Int(customTipPercentageSlider.value))
        let customPercent = sliderValue/decimal100
        
        if sender is UISlider {
            customTipPercentLabel1.text = NSNumberFormatter.localizedStringFromNumber(customPercent,numberStyle:NSNumberFormatterStyle.PercentStyle)
            customTipPercentLabel2.text = customTipPercentLabel1.text
        }
        
        if !inputString!.isEmpty    {
            let billAmount:NSDecimalNumber =  NSDecimalNumber(string: inputString).decimalNumberByDividingBy(decimal100)
        
            if(sender is UITextField)   {
                billAmountLabel.text = formatAsCurrency(billAmount)
                
                let fifteenTip = billAmount * (decimal15Percent)
                tip15Label.text = formatAsCurrency(fifteenTip)
                total15Label.text = formatAsCurrency(billAmount.decimalNumberByAdding(fifteenTip))
            }
                let customTip = billAmount * (customPercent)
               tipCustomLabel.text = formatAsCurrency(customTip)
                totalCustomLabel.text = formatAsCurrency(billAmount+(customTip))
                
            }
            
            else {
                billAmountLabel.text = ""
                tip15Label.text = ""
                total15Label.text = ""
                tipCustomLabel.text = ""
                totalCustomLabel.text = ""
    }
}
    
}
func +(left: NSDecimalNumber, right:NSDecimalNumber) -> NSDecimalNumber  {
    return left.decimalNumberByAdding(right)
}

func /(left: NSDecimalNumber, right:NSDecimalNumber) -> NSDecimalNumber  {
    return left.decimalNumberByDividingBy(right)
}

func *(left: NSDecimalNumber, right:NSDecimalNumber) -> NSDecimalNumber  {
    return left.decimalNumberByMultiplyingBy(right)
}



func formatAsCurrency(number:NSNumber) -> String{
    return NSNumberFormatter.localizedStringFromNumber(number, numberStyle: NSNumberFormatterStyle.CurrencyStyle)
}





