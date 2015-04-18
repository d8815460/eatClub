//
//  RootViewController.swift
//  eatClub
//
//  Created by 駿逸 陳 on 2015/4/8.
//  Copyright (c) 2015年 miiitech. All rights reserved.
//

import UIKit

class RootViewController: RESideMenu, RESideMenuDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func awakeFromNib() {
        self.menuPreferredStatusBarStyle = UIStatusBarStyle.LightContent
        self.contentViewShadowColor = UIColor.blackColor();
        self.contentViewShadowOffset = CGSizeMake(0, 0);
        self.contentViewShadowOpacity = 0.6;
        self.contentViewShadowRadius = 12;
        self.contentViewShadowEnabled = true;
        
        self.contentViewController = self.storyboard?.instantiateViewControllerWithIdentifier("home") as! UIViewController
        self.leftMenuViewController = self.storyboard?.instantiateViewControllerWithIdentifier("LeftMenuViewController") as! UIViewController
        self.rightMenuViewController = self.storyboard?.instantiateViewControllerWithIdentifier("RightMenuViewController") as! UIViewController
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    
    // MARK: RESide Delegate Methods
    
    func sideMenu(sideMenu: RESideMenu!, willShowMenuViewController menuViewController: UIViewController!) {
        println("This will show the menu")
    }
    
    func close(){
        self.sideMenuViewController.hideMenuViewController()
    }
}
