//
//  SelectLoginTypeVC.swift
//  MyLocations
//
//  Created by Eric Snow on 6/18/19.
//  Copyright © 2019 Eric Snow. All rights reserved.
//

import UIKit

class SelectLoginTypeVC: UIViewController {
    
    @IBOutlet var registerButton: UIButton!
    @IBOutlet var loginButton: UIButton!
    
    var isNewRegistration = false

    override func viewDidLoad() {
        super.viewDidLoad()
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
}
