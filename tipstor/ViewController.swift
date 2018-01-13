//
//  ViewController.swift
//  tipstor
//
//  Created by Rachel Ng on 1/10/18.
//  Copyright © 2018 Rachel Ng. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    var numOnScreen: Double = 0
    
    @IBOutlet var numLabel: UILabel!
    @IBAction func numbersBtns(_ sender: UIButton)
    {
        if numOnScreen == 0.0 {
            numLabel.text = String(sender.tag-1)
            numOnScreen = Double(numLabel.text!)!
        } else {
            numLabel.text = numLabel.text! + String(sender.tag-1)
            numOnScreen = Double(numLabel.text!)!
            print(numOnScreen)
        }

    }
    @IBAction func otherBtns(_ sender: UIButton)
    {
        if sender.tag == 11 {
            numOnScreen = 0
            numLabel.text = String(numOnScreen)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        numLabel.text = String(numOnScreen)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }



}

