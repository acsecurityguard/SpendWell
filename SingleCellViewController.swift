//
//  SingleCellViewController.swift
//  SpendWell
//
//  Created by Raul Hossa Rambo on 2017-01-10.
//  Copyright © 2017 Raul Hossa Rambo. All rights reserved.
//

import UIKit

class SingleCellViewController: UIViewController {
    @IBOutlet var titleLabel: UILabel!
    
    var showTitle = String()
    
    @IBOutlet var priceLabel: UILabel!
    
    var showPrice = String()
    
    @IBOutlet var ratingCell: UILabel!
    
    var showRate = String()
    
    @IBOutlet var imageCell: UIImageView!
    
    var showReceipt = UIImage(named: "")
    
    
    
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        titleLabel.text = showTitle
        
        priceLabel.text = showPrice
        
        ratingCell.text = showRate
        
        imageCell.image = showReceipt
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
