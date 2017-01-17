//
//  FirstViewController.swift
//  SpendWell
//
//  Created by Raul Hossa Rambo on 2017-01-05.
//  Copyright © 2017 Raul Hossa Rambo. All rights reserved.
//

import UIKit
import CoreData


class FirstViewController: UIViewController,  NSFetchedResultsControllerDelegate {
    
    
    /*Variables
     */
    @IBOutlet private(set) var descripts: UITableView!
    //table view with information of title, price and rating
    
    @IBOutlet private(set) weak var wellTrack: UIProgressView!
    //progress view for the rating
    
    @IBOutlet private(set) weak var scrollView: UIScrollView!
    //scroll view
    
    @IBOutlet private(set) weak var totalSpent: UILabel!
    //total spent (sum of all expenses)
    
    @IBOutlet private(set) weak var textRecommend: UILabel!
    //recommended text according to rating
    
    var value: Float!
    //stores the current value of the rating
    
    var count: Int!
    //keeps track of the number of descriptions
    
    var sum: Float!
    //sum of all expenses
    
    var tasks: [EntityCell] = []
    
    var stuffType:String! = " "
    var quickActionString:String! = " "
    
    
    /*override functions
     *
    *
    *
    *SENDS THE INFORMATION FROM THE CELL TO THE SINGLE VIEW CONTROLLER
    */
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        let indexPath: NSIndexPath = self.descripts.indexPathForSelectedRow! as NSIndexPath
        
        let task = tasks[indexPath.row]
        
        let dest: SingleCellViewController = segue.destination as! SingleCellViewController
        
        if(task.imageEntityCell != nil)
        {
            let imagePt = UIImage(data: (task.imageEntityCell! ) as Data)
            
            dest.showReceipt = imagePt
        }

        
        dest.showTitle = task.titleEntityCell!
        
        dest.showPrice = "$ " + task.priceEntityCell!
        
        dest.showRate = task.ratingEntityCell!
        
    }
    //*************************************************************
    
    
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
        getData()
        descripts.reloadData()
        //reloads all descriptions from the table view
        
    }
    
    
    
       
    
    //***************************************
    private func getData(){
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        do{
            
            
            tasks = try context.fetch(EntityCell.fetchRequest())
        }
        catch{
            print("fetch failed")
        }
    }
    
    
}




























