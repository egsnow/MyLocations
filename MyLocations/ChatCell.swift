//
//  chatMessage.swift
//  MyLocations
//
//  Created by Eric Snow on 6/20/19.
//  Copyright © 2019 Eric Snow. All rights reserved.
//

import UIKit

class ChatCell: UITableViewCell {


    @IBOutlet var messageBackground: UIView!
    @IBOutlet var avatarImageView: UIImageView!
    @IBOutlet var senderUsername: UILabel!
    @IBOutlet var chatBody: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        let avatarImage = UserDefaults.standard.integer(forKey: "avatar")
        
        messageBackground.layer.borderWidth = 2
        messageBackground.layer.borderColor = UIColor.black.cgColor
        messageBackground.layer.cornerRadius = 13
        messageBackground.layer.masksToBounds = true
    
        avatarImageView.layer.borderWidth = 3
        avatarImageView.layer.borderColor = UIColor.black.cgColor
        avatarImageView.layer.cornerRadius = 13
        avatarImageView.layer.masksToBounds = true
        avatarImageView.downloaded(from: "https://api.adorable.io/avatars/285/" + "\(avatarImage)" + ".png")

        
    }

    
    
    
    
    
    
    
    
    
    
}
