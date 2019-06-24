//
//  SelectLoginTypeVC.swift
//  MyLocations
//
//  Created by Eric Snow on 6/18/19.
//  Copyright © 2019 Eric Snow. All rights reserved.
//

import UIKit

class SelectLoginTypeVC: UIViewController {
    
    @IBOutlet var avatarImage: UIImageView!
    @IBOutlet var avatarButton: UIButton!
    @IBOutlet var registerButton: UIButton!
    @IBOutlet var loginButton: UIButton!
    
    var isNewRegistration = false
    let defaults = UserDefaults.standard

    override func viewDidLoad() {
        super.viewDidLoad()
        checkForAvatar()
        borders()
    }

    @IBAction func registerTapped(_ sender: UIButton) {
        isNewRegistration = true
        performSegue(withIdentifier: "SelectionType", sender: nil)
    }
    
    @IBAction func loginTapped(_ sender: UIButton) {
        isNewRegistration = false
        performSegue(withIdentifier: "SelectionType", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let nextVC = segue.destination as! LoginRegisterVC
        nextVC.isNewRegistration = self.isNewRegistration
    }

    @IBAction func generateRandomAvatar(_ sender: Any?) {
        let newAvatarNumber = Int.random(in: 0...10000)
        avatarImage.downloaded(from: "https://api.adorable.io/avatars/285/" + "\(newAvatarNumber)" + ".png")
        defaults.set(newAvatarNumber, forKey: "avatar")
    }
    
    func checkForAvatar() {
        if UserDefaults.standard.object(forKey: "avatar") != nil {
            let savedAvatarNumber = UserDefaults.standard.integer(forKey: "avatar")
            avatarImage.downloaded(from: "https://api.adorable.io/avatars/285/" + "\(savedAvatarNumber)" + ".png")
        } else {
            generateRandomAvatar(nil)
        }
    }
    
    func borders() {
        avatarImage.layer.borderWidth = 5
        avatarImage.layer.borderColor = UIColor.white.cgColor
        avatarImage.layer.cornerRadius = 70
        avatarImage.layer.masksToBounds = true
    }
}
