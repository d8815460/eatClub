//
//  PictureCell.swift
//  Mega
//
//  Created by Tope Abayomi on 16/12/2014.
//  Copyright (c) 2014 App Design Vault. All rights reserved.
//

import Foundation
import UIKit

class PictureCell: UITableViewCell {
    
    @IBOutlet var bgImageView : UIImageView!
    
    @IBOutlet var nameLabel : UILabel!
    @IBOutlet var profileImageView : UIImageView!
    
    @IBOutlet var sexImageView: UIImageView!
    @IBOutlet var sexLabel: UILabel!
    @IBOutlet var locationImageView : UIImageView!
    @IBOutlet var locationLabel : UILabel!
//    @IBOutlet var commentsImageView : UIImageView!
//    @IBOutlet var commentsLabel : UILabel!
    @IBOutlet var restaurantLabel: UILabel!
    
    
    override func awakeFromNib() {
        
        sexImageView.tintColor = UIColor(red: 0.16, green: 0.75, blue: 0.56, alpha: 1.0)
        sexImageView.contentMode = .ScaleAspectFill
        sexImageView.image = UIImage(named: "icon-male")?.imageWithRenderingMode(.AlwaysTemplate)
        
        locationImageView.tintColor = UIColor(red: 0.16, green: 0.75, blue: 0.56, alpha: 1.0)
        locationImageView.contentMode = .ScaleAspectFill
        locationImageView.image = UIImage(named: "location")?.imageWithRenderingMode(.AlwaysTemplate)
        
//        commentsImageView.tintColor = UIColor(red: 0.16, green: 0.75, blue: 0.56, alpha: 1.0)
//        commentsImageView.contentMode = .ScaleAspectFill
//        commentsImageView.image = UIImage(named: "icon-chat")?.imageWithRenderingMode(.AlwaysTemplate)
        
        profileImageView.layer.cornerRadius = 25
        
        nameLabel.textColor = UIColor.whiteColor()
        nameLabel.font = UIFont(name: MegaTheme.semiBoldFontName, size: 18)
        
        sexLabel.textColor = UIColor.whiteColor()
        sexLabel.font = UIFont(name: MegaTheme.fontName, size: 11)
        
        locationLabel.textColor = UIColor.whiteColor()
        locationLabel.font = UIFont(name: MegaTheme.fontName, size: 11)
        
//        commentsLabel.textColor = UIColor.whiteColor()
//        commentsLabel.font = UIFont(name: MegaTheme.fontName, size: 11)
        
        restaurantLabel.textColor = UIColor.whiteColor()
        restaurantLabel.font = UIFont(name: MegaTheme.semiBoldFontName, size: 18)
    }
}