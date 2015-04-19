//
//  WriteMyProfileTableViewController.swift
//  eatClub
//
//  Created by 駿逸 陳 on 2015/4/18.
//  Copyright (c) 2015年 miiitech. All rights reserved.
//

import UIKit

class WriteMyProfileTableViewController: UITableViewController, UITextFieldDelegate {

    
    @IBOutlet var firstNameField: UITextField!
    @IBOutlet var lastNameField: UITextField!
    @IBOutlet var workField: UITextField!
    @IBOutlet var livePlaceLabel: UILabel!
    @IBOutlet var genderLabel: UILabel!
    @IBOutlet var birthdayLabel: UILabel!
    @IBOutlet var heightLabel: UILabel!
    @IBOutlet var educationalLabel: UILabel!
    @IBOutlet var emotionalStatusLabel: UILabel!
    @IBOutlet var nextButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        nextButton.hidden = true
        
        lastNameField.tag = 100
        firstNameField.tag = 101
        workField.tag = 102
        
        
        
        self.navigationController?.navigationBarHidden = false
        self.navigationItem.hidesBackButton = true
        let label = UILabel()
        label.backgroundColor = UIColor.clearColor()
        label.font = UIFont.boldSystemFontOfSize(20.0)
        label.shadowColor = UIColor(white: 0.0, alpha: 0.5)
        label.textAlignment = NSTextAlignment.Center
        label.textColor = UIColor.whiteColor()
        self.navigationItem.titleView = label
        label.text = "請輸入基本資料"
        label.sizeToFit()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        
        println("textfield tag = \(textField.tag)")
        if textField.tag == 100 {
            //跳下一個，名字
            firstNameField.becomeFirstResponder()
            
        }else if textField.tag == 101 {
            //跳下一個，職業
            workField.becomeFirstResponder()
            
        }else if textField.tag == 102 {
            //跳居住地，選擇模式，等同於選擇 table cell = index 3
            workField.resignFirstResponder()
            nextButton.hidden = false
            
        }
        
        return true
    }
    
    @IBAction func nextButtonPressed(sender: AnyObject) {
        self.performSegueWithIdentifier("uploadProfilePhoto", sender: self)
    }
    

    // MARK: - Table view data source

//    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
//        // #warning Potentially incomplete method implementation.
//        // Return the number of sections.
//        return 0
//    }
//
//    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        // #warning Incomplete method implementation.
//        // Return the number of rows in the section.
//        return 0
//    }

    /*
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath) as! UITableViewCell

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

}
