//
//  ViewController.swift
//  eatClub
//
//  Created by ALEX on 2015/3/23.
//  Copyright (c) 2015年 miiitech. All rights reserved.
//

import UIKit
import Parse
import ParseUI

class ViewController: UIViewController, PFLogInViewControllerDelegate, PFSignUpViewControllerDelegate {

    var loginViewController: PFLogInViewController! = PFLogInViewController()
    var signUpViewController: PFSignUpViewController! = PFSignUpViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        if(PFUser.currentUser() == nil){
            self.loginViewController.fields = PFLogInFields.UsernameAndPassword | PFLogInFields.LogInButton | PFLogInFields.SignUpButton | PFLogInFields.PasswordForgotten | PFLogInFields.DismissButton
            
            var logInLogoTitle = UILabel()
            logInLogoTitle.text = "吃飯交朋友俱樂部"
            
            self.loginViewController.logInView!.logo = logInLogoTitle
            
            self.loginViewController.delegate = self
            
            var signUpLogoTitle = UILabel()
            signUpLogoTitle.text = "吃飯交朋友俱樂部"
            self.signUpViewController.delegate = self
            
            self.loginViewController.signUpController = self.signUpViewController
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //MARK: Parse 登入
    func logInViewController(logInController: PFLogInViewController!, shouldBeginLogInWithUsername username: String!, password: String!) -> Bool {
        if (!username.isEmpty || !password.isEmpty) {
            return true
        }else{
            return false
        }
    }
    
    func logInViewController(logInController: PFLogInViewController!, didLogInUser user: PFUser!) {
        
    }
    
    func logInViewController(logInController: PFLogInViewController!, didFailToLogInWithError error: NSError!) {
        println("Failed to login")
    }
    
    
    //MARK: Parse 註冊
    func signUpViewController(signUpController: PFSignUpViewController!, shouldBeginSignUp info: [NSObject : AnyObject]!) -> Bool {
        return true
    }
    
    func signUpViewController(signUpController: PFSignUpViewController!, didSignUpUser user: PFUser!) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func signUpViewController(signUpController: PFSignUpViewController!, didFailToSignUpWithError error: NSError!) {
        println("Failed to signup....")
    }
    
    func signUpViewControllerDidCancelSignUp(signUpController: PFSignUpViewController!) {
        println("User dismissed sign up.")
    }
    
    
    //MARK: Actions
    
    @IBAction func simpleAction(sender: AnyObject){
        self.presentViewController(self.loginViewController, animated: true, completion: nil)
    }
}

