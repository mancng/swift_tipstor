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
    @IBOutlet var decimalBtn: UIButton!
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
    
    @IBOutlet var tipSliderUI: UISlider!
    @IBOutlet var groupSliderUI: UISlider!
    
    @IBAction func tipSlider(_ sender: UISlider)
    {
        calculation()
    }
    
    @IBAction func groupSlider(_ sender: UISlider)
    {
        calculation()
    }

    @IBAction func numbersBtnsPressed(_ sender: UIButton)
    {
        if numOnScreen.count <= 8 {
            if numOnScreen == "0" {
                numLabel.text = String(sender.tag-1)
                numOnScreen = numLabel.text!
                calculation()
            } else if numOnScreen == "0." {
                numLabel.text = "0." + String(sender.tag-1)
                numOnScreen = numLabel.text!
                calculation()
            } else {
                numLabel.text = numLabel.text! + String(sender.tag-1)
                numOnScreen = numLabel.text!
                calculation()
            }
        }
    }
    

    @IBAction func decimalBtnPressed(_ sender: UIButton) {
        if numOnScreen.count <= 7 {
            if numOnScreen == "0.0" {
                numLabel.text = "0."
                numOnScreen = "0."
                decimalBtn.isEnabled = false
                calculation()
                
            } else {
                numLabel.text = numLabel.text! + "."
                numOnScreen = numLabel.text!
                sender.isEnabled = false
                calculation()
            }
        }
    }
    
    @IBAction func cancelBtnPressed(_ sender: UIButton) {
        numOnScreen = "0"
        numLabel.text = numOnScreen
        decimalBtn.isEnabled = true
        groupSliderUI.value = 1.0
        tipSliderUI.value = 5.0
        viewDidLoad()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        numLabel.text = numOnScreen
        percentageLabelOne.text = String("\(Int(5))%")
        percentageLabelTwo.text = String("\(Int(10))%")
        percentageLabelThree.text = String("\(Int(15))%")
        tipsLabelOne.text = "0.00"
        tipsLabelTwo.text = "0.00"
        tipsLabelThree.text = "0.00"
        groupLabelOne.text = "0.00"
        groupLabelTwo.text = "0.00"
        groupLabelThree.text = "0.00"
        groupSizeLabel.text = "Group Size: 1"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func calculation() {
        let amount = (numLabel.text! as NSString).doubleValue
        let percentageOne = Int(tipSliderUI.value)
        let percentageTwo = Int(tipSliderUI.value + 5)
        let percentageThree = Int(tipSliderUI.value + 10)
        let groupSize = Int(groupSliderUI.value)
        let tipsOne = Double(amount * Double(percentageOne) / 100) / Double(groupSize)
        let tipsTwo = Double(amount * Double(percentageTwo) / 100) / Double(groupSize)
        let tipsThree = Double(amount * Double(percentageThree) / 100) / Double(groupSize)
        let groupOne = Double(amount) / Double(groupSize) + tipsOne
        let groupTwo = Double(amount) / Double(groupSize) + tipsTwo
        let groupThree = Double(amount) / Double(groupSize) + tipsThree
        percentageLabelOne.text = String("\(percentageOne)%")
        percentageLabelTwo.text = String("\(percentageTwo)%")
        percentageLabelThree.text = String("\(percentageThree)%")
        tipsLabelOne.text = String(convert2decimals(value: tipsOne))
        tipsLabelTwo.text = String(convert2decimals(value: tipsTwo))
        tipsLabelThree.text = String(convert2decimals(value: tipsThree))
        groupLabelOne.text = String(convert2decimals(value: groupOne))
        groupLabelTwo.text = String(convert2decimals(value: groupTwo))
        groupLabelThree.text = String(convert2decimals(value: groupThree))
        groupSizeLabel.text = "Group Size: \(Int(groupSliderUI.value))"
    }

    func percentageMath(amount: Double, percentage: Double, groupSize: Int) -> Double {
        let totalTips = (amount * Double(percentage))/Double(groupSize)
        return totalTips
    }
    
    func groupMath(amount: Double, groupSize: Int, tips: String) -> Double {
        var eachPersonCost = amount/Double(groupSize)
        eachPersonCost = convert2decimals(value: eachPersonCost)
        eachPersonCost += (Double(tips)!)
        return eachPersonCost
    }

    func convert2decimals(value: Double) -> Double {
        let numberOfPlaces = 2.0
        let multiplier = pow(10.0, numberOfPlaces)
        let rounded = round(value * multiplier) / multiplier
        return rounded
    }
}

