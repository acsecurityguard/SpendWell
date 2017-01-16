//
//  ImagePickerController.swift
//  SpendWell
//
//  Created by Raul Hossa Rambo on 2017-01-16.
//  Copyright © 2017 Raul Hossa Rambo. All rights reserved.
//

import UIKit

extension SecondViewController: UIImagePickerControllerDelegate {

    /*
     *
     * FUNCTIONS FOR IMAGE PICKING
     *
     *Take Photo
     * enables user to take a photo or select a picture from library
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
    

}
