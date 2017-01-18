//
//  EditTitleViewController.swift
//  SpendWell
//
//  Created by Raul Hossa Rambo on 2017-01-18.
//  Copyright © 2017 Raul Hossa Rambo. All rights reserved.
//

import UIKit

class EditTitleViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBOutlet var newTitle: UITextField!
    

    @IBAction func editNewTitle(_ sender: UIButton) {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        let task = EntityCell(context: context)
        
        
        task.titleEntityCell = newTitle.text!
        
       
        
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        
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
