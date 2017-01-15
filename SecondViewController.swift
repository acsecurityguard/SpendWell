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
    @IBOutlet private var checkLabel: UILabel!
    //check mark if a picture as chosen
    
    @IBOutlet private var imagePicked: UIImageView!
    //image view of the image picked
    
    private var imagePicker: UIImagePickerController!
    //image picker
    
    @IBOutlet private var textTitle: UITextField!
    //title of expense
    
    @IBOutlet private var textAmount: UITextField!
    //price of expense
    
    var picker:UIImagePickerController?=UIImagePickerController()
    
    var detailInfo:String?

    
    
    //-------------------------------------------
    
    /*Take Photo
    / enables user to take a photo or select a picture from library
     */
    @IBAction private func takePhoto(_ sender: AnyObject) {
            let alert:UIAlertController=UIAlertController(title: "upload receipt", message: nil, preferredStyle: UIAlertControllerStyle.actionSheet)
            
            let cameraAction = UIAlertAction(title: "Camera", style: UIAlertActionStyle.default)
            {
                UIAlertAction in
                self.openCamera()
                
            }
            let galleryAction = UIAlertAction(title: "Photo Library", style: UIAlertActionStyle.default)
            {
                UIAlertAction in
                self.openGallery()
            }
            let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.cancel)
            {
                UIAlertAction in
                
            }
            picker?.delegate = self
            alert.addAction(cameraAction)
            alert.addAction(galleryAction)
            alert.addAction(cancelAction)
        
            if UIDevice.current.userInterfaceIdiom == .phone
            {
                self.present(alert, animated: true, completion: nil)
            }
        }
        /*
        *opens the camera if available, otherwise the photo library is called
        */
        private func openCamera()
        {
            if(UIImagePickerController .isSourceTypeAvailable(UIImagePickerControllerSourceType.camera))
            {
                picker!.sourceType = UIImagePickerControllerSourceType.camera
                self .present(picker!, animated: true, completion: nil)
            }
            else
            {
                openGallery()
            }
        }
    
        /*
        *opens the  photo library
        */
        private func openGallery()
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
        internal func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any])
        {
            imagePicked.image=info[UIImagePickerControllerOriginalImage] as? UIImage
            checkLabel.text = "✓"
             picker .dismiss(animated: true, completion: nil)
        }
    
        /*
        *opens the camera if available, otherwise the photo library is called
        */
        internal func imagePickerControllerDidCancel(_ picker: UIImagePickerController)
        {
            picker .dismiss(animated: true, completion: nil)
        }
   

    //-------------------------------------------

    
    @IBOutlet private weak var textRating: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Add Expense"
        
        picker!.delegate=self
        
        self.navigationController?.navigationBar.barTintColor = UIColor.black
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.gray]
        
  
        
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
    
//********************
    
    
    
    
    //********************
    
    
    
    
    
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
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?)
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
extension UINavigationController {
    
    override open var shouldAutorotate: Bool {
        get {
            if let visibleVC = visibleViewController {
                return visibleVC.shouldAutorotate
            }
            return super.shouldAutorotate
        }
    }
    
    override open var preferredInterfaceOrientationForPresentation: UIInterfaceOrientation{
        get {
            if let visibleVC = visibleViewController {
                return visibleVC.preferredInterfaceOrientationForPresentation
            }
            return super.preferredInterfaceOrientationForPresentation
        }
    }
    
    override open var supportedInterfaceOrientations: UIInterfaceOrientationMask{
        get {
            if let visibleVC = visibleViewController {
                return visibleVC.supportedInterfaceOrientations
            }
            return super.supportedInterfaceOrientations
        }
    }}


//*************************************
extension UITabBarController {
    
    override open var shouldAutorotate: Bool {
        get {
            if let selectedVC = selectedViewController{
                return selectedVC.shouldAutorotate
            }
            return super.shouldAutorotate
        }
    }
    
    override open var preferredInterfaceOrientationForPresentation: UIInterfaceOrientation{
        get {
            if let selectedVC = selectedViewController{
                return selectedVC.preferredInterfaceOrientationForPresentation
            }
            return super.preferredInterfaceOrientationForPresentation
        }
    }
    
    override open var supportedInterfaceOrientations: UIInterfaceOrientationMask{
        get {
            if let selectedVC = selectedViewController{
                return selectedVC.supportedInterfaceOrientations
            }
            return super.supportedInterfaceOrientations
        }
    }}
















