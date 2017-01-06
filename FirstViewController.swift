//
//  FirstViewController.swift
//  SpendWell
//
//  Created by Raul Hossa Rambo on 2017-01-05.
//  Copyright © 2017 Raul Hossa Rambo. All rights reserved.
//

import UIKit


class FirstViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var descripts: UITableView!
    

    @IBOutlet weak var wellTrack: UIProgressView!

 
    
 
    
    
     @IBOutlet weak var scrollView: UIScrollView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        scrollView.contentSize.height = 2000
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func viewWillAppear(_ animated: Bool)
    {
        descripts.reloadData()
    }
    
    @IBOutlet weak var totalSpent: UILabel!
    
    var value: Float!
    var count: Int!
    var sum: Float!

    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        totalSpent.text = "0"
        count = 0
        sum = 0
        
        return operation.descriptions.count
    }
    



    @IBOutlet weak var textRecommend: UILabel!
    
    

    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
       
        
        
        let cell: UITableViewCell = UITableViewCell(style: UITableViewCellStyle.subtitle, reuseIdentifier: "empty")
        
        cell.textLabel!.text = operation.descriptions[indexPath.row].title
        cell.detailTextLabel!.text = "$ " + operation.descriptions[indexPath.row].price
        
        if(Int(operation.descriptions[indexPath.row].price) != nil)
        {
        totalSpent.text = String(Int(operation.descriptions[indexPath.row].price)! + Int(totalSpent.text!)!)
        }
        
        
        
        
        var rate: Int!
        rate = Int(operation.descriptions[indexPath.row].rating)!
        value = (Float(rate))/100.0
    
        if(value != nil)
        {
           count = count + 1
            sum! = value + sum
        wellTrack.setProgress(Float(sum)/Float(count), animated: true)
           
            if(Float(sum)/Float(count) <= 25)
            {
                
                   textRecommend.text = "You should look for help when spending money"
                
            }
            else if(Float(sum)/Float(count) > 25)
            {
                if(Float(sum)/Float(count) <= 50)
                {
                    textRecommend.text = "you should pay more attention at your money"
                }
            }
            else if(Float(sum)/Float(count) > 50)
            {
                if(Float(sum)/Float(count) <= 75)
                {
                    textRecommend.text = "You can still improve the way you use your money"
                }
            }
            else if(Float(sum)/Float(count) > 75)
            {
                if(Float(sum)/Float(count) <= 100)
                {
                    textRecommend.text = "You are doing a great job managing your money"
                }
            }

            
            
            
            
        }
        

        
        return cell
    }


}

