//
//  TableViewController.swift
//  SpendWell
//
//  Created by Raul Hossa Rambo on 2017-01-13.
//  Copyright © 2017 Raul Hossa Rambo. All rights reserved.
//

import UIKit

extension FirstViewController: UIViewControllerPreviewingDelegate {
    
    
    
    func previewingContext(_ previewingContext: UIViewControllerPreviewing, viewControllerForLocation location: CGPoint) -> UIViewController? {
        
        guard let indexPath = Descripts.indexPathForRow(at: location),
            let cell = Descripts.cellForRow(at: indexPath) else {return nil}
        
        
        guard let previewVC = storyboard?.instantiateViewController(withIdentifier: "PreviewVC") as? PreviewViewController else {return nil}
        
        previewVC.selectedItem = data[indexPath.row]
        quickActionString = data[indexPath.row]
        
        
        previewVC.preferredContentSize = CGSize(width: 0, height: 150)
        
        previewingContext.sourceRect = cell.frame
        
        
        return previewVC
    }
    
    // POP
    func previewingContext(_ previewingContext: UIViewControllerPreviewing, commit viewControllerToCommit: UIViewController) {
        if let stuffVC = storyboard?.instantiateViewController(withIdentifier: "AddStuffVC") as? AddStuffViewController{
            stuffVC.detailInfo = quickActionString
            
            show(stuffVC, sender: self)
        }
        
        
    }
}
