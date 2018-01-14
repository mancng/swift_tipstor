//
//  ViewController.swift
//  tipstor
//
//  Created by Rachel Ng on 1/10/18.
//  Copyright © 2018 Rachel Ng. All rights reserved.
//

import UIKit
import Foundation

class ViewController: UIViewController, UITextFieldDelegate {
    
    var numOnScreen = "0"
    var percentageOne = 5.0
    var percentageTwo = 5.0
    var percentageThree = 5.0
    var groupSize = 1
    
    
    @IBOutlet var numLabel: UILabel!
    @IBOutlet var groupSizeLabel: UILabel!
    
    @IBOutlet var percentageLabelOne: UILabel!
    @IBOutlet var percentageLabelTwo: UILabel!
    @IBOutlet var percentageLabelThree: UILabel!
    
    @IBOutlet var tipsLabelOne: UILabel!
    @IBOutlet var tipsLabelTwo: UILabel!
    @IBOutlet var tipsLabelThree: UILabel!
    
    @IBOutlet var groupLabelOne: UILabel!
    @IBOutlet var groupLabelTwo: UILabel!
    @IBOutlet var groupLabelThree: UILabel!
    
    @IBAction func tipSlider(_ sender: UISlider)
    {
        let value = Double((sender.value)/100)
        let valueInt = convert2decimals(value: value)
        percentageOne = Double(valueInt)
        let tipsOne = percentageMath(amount: (Double(numOnScreen))!, percentage: Double(percentageOne), groupSize: 1)
        
        let value2 = Double((sender.value + 5)/100)
        let valueInt2 = convert2decimals(value: value2)
        percentageTwo = Double(valueInt2)
        let tipsTwo = percentageMath(amount: (Double(numOnScreen))!, percentage: Double(percentageTwo), groupSize: 1)

        let value3 = Double((sender.value + 10)/100)
        let valueInt3 = convert2decimals(value: value3)
        percentageThree = Double(valueInt3)
        let tipsThree = percentageMath(amount: (Double(numOnScreen))!, percentage: Double(percentageThree), groupSize: 1)
    
        //To print in UI
        let getPercentage = String("\(lround(value*100))%")
        percentageLabelOne.text = getPercentage
        percentageLabelTwo.text = String("\(Int(sender.value + 5))%")
        percentageLabelThree.text = String("\(Int(sender.value + 10))%")
        tipsLabelOne.text = String(tipsOne)
        tipsLabelTwo.text = String(tipsTwo)
        tipsLabelThree.text = String(tipsThree)
    }
    
    @IBAction func groupSlider(_ sender: UISlider)
    {
        groupSizeLabel.text = ("Group Size: \(Int(sender.value))")
        let groupOne = groupMath(amount: (Double(numOnScreen))!, groupSize: Int(sender.value))
        groupLabelOne.text = String(groupOne)
    }

    @IBAction func numbersBtnsPressed(_ sender: UIButton)
    {
        if numOnScreen.count <= 8 {
            if numOnScreen == "0" {
                numLabel.text = String(sender.tag-1)
                numOnScreen = numLabel.text!
            } else if numOnScreen == "0." {
                numLabel.text = "0." + String(sender.tag-1)
                numOnScreen = numLabel.text!
            } else {
                numLabel.text = numLabel.text! + String(sender.tag-1)
                numOnScreen = numLabel.text!
            }
        }
    }
    
    @IBOutlet var decimalBtn: UIButton!
    @IBAction func decimalBtnPressed(_ sender: UIButton) {
        
        if numOnScreen.count <= 7 {
            if numOnScreen == "0.0" {
                numLabel.text = "0."
                numOnScreen = "0."
                decimalBtn.isEnabled = false
                
            } else {
                numLabel.text = numLabel.text! + "."
                numOnScreen = numLabel.text!
                sender.isEnabled = false
            }
        }
    }
    
    @IBAction func cancelBtnPressed(_ sender: UIButton) {
        numOnScreen = "0"
        numLabel.text = numOnScreen
        decimalBtn.isEnabled = true
        viewDidLoad()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        numLabel.text = numOnScreen
        percentageLabelOne.text = String("\(Int(10))%")
        percentageLabelTwo.text = String("\(Int(15))%")
        percentageLabelThree.text = String("\(Int(20))%")
        tipsLabelOne.text = "0.00"
        tipsLabelTwo.text = "0.00"
        tipsLabelThree.text = "0.00"
        groupLabelOne.text = "0.00"
        groupLabelTwo.text = "0.00"
        groupLabelThree.text = "0.00"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func percentageMath(amount: Double, percentage: Double, groupSize: Int) -> Double {
        let totalTips = (amount * Double(percentage))/Double(groupSize)
        return totalTips
    }
    
    func groupMath(amount: Double, groupSize: Int) -> Double {
        var eachPersonCost = amount/Double(groupSize)
        eachPersonCost = convert2decimals(value: eachPersonCost)
        return eachPersonCost
    }

    func convert2decimals(value: Double) -> Double {
        let numberOfPlaces = 2.0
        let multiplier = pow(10.0, numberOfPlaces)
        let rounded = round(value * multiplier) / multiplier
        return rounded
    }

}

