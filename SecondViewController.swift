//
//  SecondViewController.swift
//  SpendWell
//
//  Created by Raul Hossa Rambo on 2017-01-05.
//  Copyright © 2017 Raul Hossa Rambo. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UITextFieldDelegate {
    
    
    @IBOutlet var textTitle: UITextField!
    
    @IBOutlet var textAmount: UITextField!
    
    @IBOutlet weak var textRating: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var sliderLabel: UILabel!
    
    @IBAction func sliderAction(_ sender: UISlider)
    {
        sliderLabel.text = "\(Int(slider.value))"
    }
    
    
    @IBAction func addAction(_ sender: UIButton)
    {
        operation.addDescription(title: textTitle.text!, price:  textAmount.text!, rating: textRating.text!)
        self.view.endEditing(true)
        textTitle.text = ""
        textAmount.text = ""
        textRating.text = ""
        self.tabBarController!.selectedIndex = 0
        
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?)
    {
        self.view.endEditing(true)
    }
    
    public func textFieldShouldReturn(_ textField: UITextField) -> Bool
    {
        textField.resignFirstResponder()
        return true
    }
    
    
}

