//
//  SecondViewController.swift
//  SpendWell
//
//  Created by Raul Hossa Rambo on 2017-01-05.
//  Copyright © 2017 Raul Hossa Rambo. All rights reserved.
//

import UIKit
import MobileCoreServices


class SecondViewController: UIViewController, UITextFieldDelegate, UIAlertViewDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate,UIPopoverControllerDelegate


{
    @IBOutlet var checkLabel: UILabel!
    //check mark if a picture as chosen
    
    @IBOutlet var imagePicked: UIImageView!
    //image view of the image picked
    
    private var imagePicker: UIImagePickerController!
    //image picker
    
    @IBOutlet var textTitle: UITextField!
    //title of expense
    
    @IBOutlet var textAmount: UITextField!
    //price of expense
    
    var picker:UIImagePickerController?=UIImagePickerController()

    
    
    //-------------------------------------------
    
    /*Take Photo
    / enables user to take a photo or select a picture from library
     */
    @IBAction func takePhoto(_ sender: AnyObject) {
            let alert:UIAlertController=UIAlertController(title: "upload receipt", message: nil, preferredStyle: UIAlertControllerStyle.actionSheet)
            
            let cameraAction = UIAlertAction(title: "Camera", style: UIAlertActionStyle.default)
            {
                UIAlertAction in
                self.openCamera()
                
            }
            let gallaryAction = UIAlertAction(title: "Photo Library", style: UIAlertActionStyle.default)
            {
                UIAlertAction in
                self.openGallary()
            }
            let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.cancel)
            {
                UIAlertAction in
                
            }
            picker?.delegate = self
            alert.addAction(cameraAction)
            alert.addAction(gallaryAction)
            alert.addAction(cancelAction)
        
            if UIDevice.current.userInterfaceIdiom == .phone
            {
                self.present(alert, animated: true, completion: nil)
            }
        }
        /*
        *opens the camera if available, otherwise the photo library is called
        */
        func openCamera()
        {
            if(UIImagePickerController .isSourceTypeAvailable(UIImagePickerControllerSourceType.camera))
            {
                picker!.sourceType = UIImagePickerControllerSourceType.camera
                self .present(picker!, animated: true, completion: nil)
            }
            else
            {
                openGallary()
            }
        }
    
        /*
        *opens the  photo library
        */
        func openGallary()
        {
            picker!.sourceType = UIImagePickerControllerSourceType.photoLibrary
            if UIDevice.current.userInterfaceIdiom == .phone
            {
                self.present(picker!, animated: true, completion: nil)
            }
        }
    
        /*
        *once the user has chosen an image
        */
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any])
        {
            imagePicked.image=info[UIImagePickerControllerOriginalImage] as? UIImage
            checkLabel.text = "✓"
             picker .dismiss(animated: true, completion: nil)
        }
    
        /*
        *opens the camera if available, otherwise the photo library is called
        */
        func imagePickerControllerDidCancel(_ picker: UIImagePickerController)
        {
            picker .dismiss(animated: true, completion: nil)
        }
   

    //-------------------------------------------

    
    @IBOutlet weak var textRating: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Add Expense"
        
        picker!.delegate=self
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
            }
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var sliderLabel: UILabel!
    
    @IBAction func sliderAction(_ sender: UISlider)
    {
        sliderLabel.text = "\(Int(slider.value))"
    }
    
    
    @IBAction func addAction(_ sender: UIButton)
    {
        operation.addDescription(title: textTitle.text!, price:  textAmount.text!, rating: textRating.text!,receipt: imagePicked.image!)
        self.view.endEditing(true)
        textTitle.text = ""
        textAmount.text = ""
        textRating.text = ""
        checkLabel.text = ""
        imagePicked.image = nil
    
        self.tabBarController?.selectedIndex = 0
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



   
    














