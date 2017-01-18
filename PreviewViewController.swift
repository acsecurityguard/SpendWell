//
//  PreviewViewController.swift
//  SpendWell
//
//  Created by Raul Hossa Rambo on 2017-01-17.
//  Copyright © 2017 Raul Hossa Rambo. All rights reserved.
//

import UIKit

class PreviewViewController: UIViewController {

        var selectedItem:UIImage!
        
        
    
    @IBOutlet var previewLabel: UIImageView!
        
      
        override func viewDidLoad() {
            super.viewDidLoad()
            
            // Do any additional setup after loading the view.
        }
        
        
        
        override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)
            
            previewLabel.image = selectedItem
            
        }
        
        
        override func didReceiveMemoryWarning() {
            super.didReceiveMemoryWarning()
            // Dispose of any resources that can be recreated.
        }
        
        
        /*
         // MARK: - Navigation
         
         // In a storyboard-based application, you will often want to do a little preparation before navigation
         override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
         // Get the new view controller using segue.destinationViewController.
         // Pass the selected object to the new view controller.
         }
         */
        
}
