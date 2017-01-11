//
//  FirstViewController.swift
//  SpendWell
//
//  Created by Raul Hossa Rambo on 2017-01-05.
//  Copyright © 2017 Raul Hossa Rambo. All rights reserved.
//

import UIKit


class FirstViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    
    
    
   
    /*Variables
     */
    @IBOutlet var descripts: UITableView!
    //table view with information of title, price and rating
    
    @IBOutlet weak var wellTrack: UIProgressView!
    //progress view for the rating
    
    @IBOutlet weak var scrollView: UIScrollView!
    //scroll view
    
    @IBOutlet weak var totalSpent: UILabel!
    //total spent (sum of all expenses)
    
    @IBOutlet weak var textRecommend: UILabel!
    //recommended text according to rating
    
    var value: Float!
    //stores the current value of the rating
    
    var count: Int!
    //keeps track of the number of descriptions
    
    var sum: Float!
    //sum of all expenses
    
       
    /*override functions
     */
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
        {
            let indexPath: NSIndexPath = self.descripts.indexPathForSelectedRow! as NSIndexPath
            
 
            
            
        let dest: SingleCellViewController = segue.destination as! SingleCellViewController
        
        dest.showTitle = operation.descriptions[indexPath.row].title
        
        dest.showPrice = "$ " + operation.descriptions[indexPath.row].price
        
        dest.showRate = operation.descriptions[indexPath.row].rating
            
        dest.showReceipt = operation.descriptions[indexPath.row].receipt
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        scrollView.contentSize.height = 2000
        //sets the height of scroll view
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool)
    {
        descripts.reloadData()
        //reloads all descriptions from the table view
    }
    
    //initializes the table view
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        totalSpent.text = "0"
        count = 0
        sum = 0
        return operation.descriptions.count
    }
    
    //@IBOutlet var titleLabel: UILabel!
    //implements the delet function for the table view and updates the total spent
    public func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath)
    {
        if(editingStyle == UITableViewCellEditingStyle.delete)
        {
            if(Int(operation.descriptions[indexPath.row].price) != nil)
            {
                totalSpent.text = String(Int(totalSpent.text!)! - Int(operation.descriptions[indexPath.row].price)!)
            }
            operation.descriptions.remove(at: indexPath.row)
            descripts.reloadData()
        }
    }
    
    //
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        var rate: Int!
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "NewCell") as! CellTableViewCell
        
        cell.cellImage.image = operation.descriptions[indexPath.row].receipt
        
        cell.cellTitle.text = operation.descriptions[indexPath.row].title
        
        cell.cellPrice.text = "$ " + operation.descriptions[indexPath.row].price
        
       
        
        if(Int(operation.descriptions[indexPath.row].price) != nil)
        {
            totalSpent.text = String(Int(operation.descriptions[indexPath.row].price)! + Int(totalSpent.text!)!)
        }
        if(Int(operation.descriptions[indexPath.row].rating) != nil)
        {
            rate = Int(operation.descriptions[indexPath.row].rating)!
            value = (Float(rate))/100.0
            
            if(value != nil)
            {
                count = count + 1
                sum! = value + sum
                wellTrack.setProgress(Float(sum)/Float(count), animated: true)
                
                if((Float(sum)/Float(count) >= 0 ) && ((Float(sum)/Float(count) <= 0.25)))
                {
                    textRecommend.text = "\"Look for help when spending money\""
                }
                else if((Float(sum)/Float(count) > 0.25) && ((Float(sum)/Float(count) <= 0.50)))
                    
                {
                    textRecommend.text = "\"Poor job managing your money\""
                }
                else if((Float(sum)/Float(count) > 0.50) && ((Float(sum)/Float(count) <= 0.75)))
                    
                {
                    textRecommend.text = "\"Good job managing your money\""
                    
                }
                else if((Float(sum)/Float(count) > 0.75) && ((Float(sum)/Float(count) <= 1.00)))
                {
                    
                    textRecommend.text = "\"Great job managing your money\""
                }
            }
        }
        return cell
    }
}

