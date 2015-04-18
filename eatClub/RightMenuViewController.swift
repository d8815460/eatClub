//
//  RightMenuViewController.swift
//  eatClub
//
//  Created by 駿逸 陳 on 2015/4/8.
//  Copyright (c) 2015年 miiitech. All rights reserved.
//

import UIKit

class RightMenuViewController: UIViewController,UITableViewDelegate, UITableViewDataSource ,RESideMenuDelegate {

    var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        tableView = UITableView()
        self.tableView.frame = CGRectMake(0, (self.view.frame.size.height-54*2)/2.0, self.view.frame.size.width  , 54 * 2)
        tableView.autoresizingMask = UIViewAutoresizing.FlexibleTopMargin|UIViewAutoresizing.FlexibleBottomMargin|UIViewAutoresizing.FlexibleWidth
        tableView.delegate = self;
        tableView.dataSource = self;
        tableView.opaque = true;
        tableView.backgroundColor = UIColor.clearColor()
        tableView.backgroundView = nil;
        tableView.separatorStyle = UITableViewCellSeparatorStyle.None
        tableView.bounces = false;
        tableView.scrollsToTop = false;
//        tableView.backgroundColor = UIColor.redColor()
//        tableView.ba
        self.view.addSubview(tableView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath( indexPath, animated: true)
        switch (indexPath.row) {
        case 0:
            var c = self.storyboard?.instantiateViewControllerWithIdentifier("HomeViewController") as! UIViewController
            var navController = UINavigationController(rootViewController: c)
            self.sideMenuViewController.setContentViewController(navController, animated: true)
            self.sideMenuViewController.hideMenuViewController()
            break;
        case 1:
            var c = self.storyboard?.instantiateViewControllerWithIdentifier("LoginViewController") as! UIViewController
            var navController = UINavigationController(rootViewController: c)
            self.sideMenuViewController.setContentViewController(navController, animated: true)
            self.sideMenuViewController.hideMenuViewController()
            
            break;
        default:
            break;
        }
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 54
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "cell")
        
        cell.backgroundColor = UIColor.clearColor()
        cell.textLabel?.textColor = UIColor.whiteColor()
        var titles = ["Home", "Calendar", "Profile", "Settings", "Log Out"]
        var images = ["IconHome", "IconCalendar", "IconProfile", "IconSettings", "IconEmpty"];
        cell.textLabel?.text = titles[indexPath.row]
        cell.imageView?.image = UIImage(named: images[indexPath.row])
        cell.textLabel?.textAlignment =  NSTextAlignment.Right
        return cell
        
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
