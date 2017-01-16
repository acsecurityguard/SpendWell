//
//  PortraitViewController.swift
//  SpendWell
//
//  Created by Raul Hossa Rambo on 2017-01-16.
//  Copyright © 2017 Raul Hossa Rambo. All rights reserved.
//

import UIKit

extension UINavigationController {

    /*************************************
     *
     *
     * LOCKING VIEW INTO PORTRAIT ORIENTATION
     *
     */
        
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
        }
}

