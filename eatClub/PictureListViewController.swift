//
//  PictureListViewController.swift
//  Mega
//
//  Created by Tope Abayomi on 16/12/2014.
//  Copyright (c) 2014 App Design Vault. All rights reserved.
//

import Foundation
import UIKit

class PictureListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, PFLogInViewControllerDelegate, PFSignUpViewControllerDelegate {
    
    @IBOutlet var tableView : UITableView!
    
    var people : [Person]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
        
        title = "Eating Club"
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .None
        
        
        var person1 = Person(name: "Linda Cristofssen", profilePicUrl: "people-profile-1", backgroundPicUrl: "people-pic-1", sex:"female", years:"25歲", location: "大安區, 台北市", commentCount: "3", restaurant: "西提牛排敦南店")
        
        var person2 = Person(name: "Christopher Bale", profilePicUrl: "people-profile-2", backgroundPicUrl: "people-pic-2", sex:"male", years:"40歲", location: "鳳山區, 高雄市", commentCount: "20", restaurant: "王品牛排")
        
        var person3 = Person(name: "Angelina Jolie", profilePicUrl: "people-profile-3", backgroundPicUrl: "people-pic-3", sex:"female", years:"35歲", location: "信義區, 台北市", commentCount: "21", restaurant: "客家小炒")
        
        var person4 = Person(name: "Tom Cruise", profilePicUrl: "people-profile-4", backgroundPicUrl: "people-pic-4", sex:"male", years:"38歲", location: "三民區, 高雄市", commentCount: "46", restaurant: "我家牛排")
        
        var person5 = Person(name: "Adam Sandler", profilePicUrl: "people-profile-5", backgroundPicUrl: "people-pic-5", sex:"male", years:"28歲", location: "北投區, 台北市", commentCount: "31", restaurant: "貴族世家牛排")
        
        people = [person1, person2, person3, person4, person5]
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("PictureCell") as! PictureCell
        
        let person = people[indexPath.row]
        
        cell.nameLabel.text = person.name
        cell.profileImageView.image = UIImage(named: person.profilePicUrl)
        cell.bgImageView.image = UIImage(named: person.backgroundPicUrl)
        cell.locationLabel.text = person.location
        cell.sexLabel.text = "\(person.years)"
        cell.restaurantLabel.text = "\(person.restaurant)"
        if person.sex == "female" {
            cell.sexImageView.image = UIImage(named: "icon-female")
        }else{
            cell.sexImageView.image = UIImage(named: "icon-male")
        }
        
        
        return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return people.count
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        self.performSegueWithIdentifier("login2", sender: self)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "login2"){
            
            
            var view:PFLogInViewController = segue.destinationViewController as! PFLogInViewController
            view.delegate = self
            view.facebookPermissions = ["public_profile", "email", "user_friends"]
            view.fields = PFLogInFields.Facebook | PFLogInFields.UsernameAndPassword | PFLogInFields.SignUpButton | PFLogInFields.DismissButton | PFLogInFields.PasswordForgotten
            
            var signUp:PFSignUpViewController = SignUpViewController()
            signUp.delegate = self
            signUp.fields = PFSignUpFields.Default
            
            view.signUpController = signUp
        }
    }
    
    
    //SignUp Delegate
    func signUpViewController(signUpController: PFSignUpViewController, didSignUpUser user: PFUser) {
        //如果成功註冊一個新的帳號，就要轉場到基本資料填寫頁面
        
    }
    
    func signUpViewController(signUpController: PFSignUpViewController, didFailToSignUpWithError error: NSError?) {
        
    }
    
    func signUpViewController(signUpController: PFSignUpViewController, shouldBeginSignUp info: [NSObject : AnyObject]) -> Bool {
        return true
    }
}


class Person {
    
    var name : String
    var profilePicUrl : String
    var backgroundPicUrl : String
    var sex : String
    var years : String
    var location : String
    var commentCount : String
    var restaurant : String
    
    init(name: String, profilePicUrl: String, backgroundPicUrl: String, sex: String, years: String, location: String, commentCount: String, restaurant: String){
     
        self.name = name
        self.profilePicUrl = profilePicUrl
        self.backgroundPicUrl = backgroundPicUrl
        self.sex = sex
        self.years = years
        self.location = location
        self.commentCount = commentCount
        self.restaurant = restaurant
    }
}


