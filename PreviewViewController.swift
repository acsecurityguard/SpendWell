//
//  PreviewViewController.swift
//  SpendWell
//
//  Created by Raul Hossa Rambo on 2017-01-13.
//  Copyright © 2017 Raul Hossa Rambo. All rights reserved.
//

import UIKit

class PreviewViewController: UIViewController {
    
    var selectedItem:String! = " "
    
    
    
    
    @IBOutlet weak var previewLabel: UILabel!
    
    var previewActions:[UIPreviewActionItem] {
        previewLabel.text = " "
        
        let item1 = UIPreviewAction(title: "Do something", style: .default) { (action:UIPreviewAction, vc:UIViewController) -> Void in
            print("Awesome")
        }
        
        let item2 = UIPreviewAction(title: "Do even more", style: .default) { (action:UIPreviewAction, vc:UIViewController) -> Void in
            print("cool")
        }
        
        return [item1, item2]
        
    }

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        registerForPreviewing(with: self as! UIViewControllerPreviewingDelegate, sourceView: view)
        // Do any additional setup after loading the view.
    }
    
    func previewingContext(previewingContext: UIViewControllerPreviewing, viewControllerForLocation location: CGPoint) -> UIViewController? {
        
        return UIViewController()
    }
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        previewLabel.text = selectedItem
        
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

