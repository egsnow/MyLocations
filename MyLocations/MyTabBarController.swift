//
//  MyTabBarController.swift
//  MyLocations
//
//  Created by Eric Snow on 5/25/19.
//  Copyright © 2019 Eric Snow. All rights reserved.
//

import UIKit
class MyTabBarController: UITabBarController {
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override var childForStatusBarStyle: UIViewController? {
        return nil
    }
}
