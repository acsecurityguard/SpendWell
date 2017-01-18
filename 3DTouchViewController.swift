//
//  3DTouchViewController.swift
//  SpendWell
//
//  Created by Raul Hossa Rambo on 2017-01-17.
//  Copyright © 2017 Raul Hossa Rambo. All rights reserved.
//

import UIKit

extension FirstViewController: UIViewControllerPreviewingDelegate {

    func previewingContext(_ previewingContext: UIViewControllerPreviewing, viewControllerForLocation location: CGPoint) -> UIViewController? {
        
        guard let indexPath = descripts.indexPathForRow(at: location),
            let cell = descripts.cellForRow(at: indexPath) else {return nil}
        
        guard let previewVC = storyboard?.instantiateViewController(withIdentifier: "PreviewVC") as? PreviewViewController else {return nil}
        
        if(tasks[indexPath.row]
            .imageEntityCell != nil)
        {
            let imagePt = UIImage(data: (tasks[indexPath.row]
                .imageEntityCell! ) as Data)
            
            previewVC.selectedItem = imagePt
        }
        previewVC.preferredContentSize = CGSize(width: 0, height: 600)
        
        previewingContext.sourceRect = cell.frame
        
        return previewVC
    }
    
    
    func previewingContext(_ previewingContext: UIViewControllerPreviewing, commit viewControllerToCommit: UIViewController) {
    }
}
