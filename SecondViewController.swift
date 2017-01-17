//
//  SecondViewController.swift
//  SpendWell
//
//  Created by Raul Hossa Rambo on 2017-01-05.
//  Copyright © 2017 Raul Hossa Rambo. All rights reserved.
//

import UIKit
import MobileCoreServices


class SecondViewController: UIViewController, UITextFieldDelegate, UIAlertViewDelegate,UINavigationControllerDelegate,UIPopoverControllerDelegate


{
    @IBOutlet private(set) var checkLabel: UILabel!
    //check mark if a picture as chosen
    
    @IBOutlet private(set) var imagePicked: UIImageView!
    //image view of the image picked
    
    private private(set) var imagePicker: UIImagePickerController!
    //image picker
    
    @IBOutlet private(set) private var textTitle: UITextField!
    //title of expense
    
    @IBOutlet private(set) var textAmount: UITextField!
    //price of expense
    
    var picker:UIImagePickerController?=UIImagePickerController()
    
    var detailInfo:String?

    
    
   
    //-------------------------------------------

    
    @IBOutlet private(set) weak var textRating: UILabel!
    
    override internal func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Add Expense"
        
        picker!.delegate=self
        
        self.navigationController?.navigationBar.barTintColor = UIColor.black
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.gray]
        
  
        
    }
    
    override internal func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
            }
    @IBOutlet private(set) weak var slider: UISlider!
    @IBOutlet private(set) weak var sliderLabel: UILabel!
    
    @IBAction private func sliderAction(_ sender: UISlider)
    {
        sliderLabel.text = "\(Int(slider.value))"
    }
    
//********************

    
    /*
     *
     * SAVE BUTTON
     *
     */
    @IBAction private func addAction(_ sender: UIButton)
    {
      
        
        
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        let task = EntityCell(context: context)
        
        if(imagePicked.image != nil){
        let imageNS = UIImagePNGRepresentation(imagePicked.image!) as NSData?
            
        task.imageEntityCell = imageNS
        }
        
        
        
        
        
        task.priceEntityCell = textAmount.text!
        
        task.titleEntityCell = textTitle.text!
        
        task.ratingEntityCell = textRating.text
        
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        
        
        
        
        /********************************/
        
       
        self.view.endEditing(true)
        textTitle.text = ""
        textAmount.text = ""
        textRating.text = ""
        checkLabel.text = ""
        imagePicked.image = nil
    
        self.tabBarController?.selectedIndex = 0
    }
    
    
    //****************************
    override internal func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?)
    {
        self.view.endEditing(true)
    }
    
    internal func textFieldShouldReturn(_ textField: UITextField) -> Bool
    {
        textField.resignFirstResponder()
        return true
    }
    
    //*****************************
    
    open override var supportedInterfaceOrientations: UIInterfaceOrientationMask{
        get {
            return .portrait
        }
    }


    open override var shouldAutorotate: Bool {
        get {
            return false
        }
    }

open override var preferredInterfaceOrientationForPresentation: UIInterfaceOrientation{
get {
    return .portrait
}
}
//*****************************


    
}


//*************************************
















