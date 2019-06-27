//
//  LoginRegisterVC.swift
//  MyLocations
//
//  Created by Eric Snow on 6/17/19.
//  Copyright © 2019 Eric Snow. All rights reserved.
//

import UIKit
import Firebase
import SVProgressHUD

class LoginRegisterVC: UIViewController {

    @IBOutlet var emailTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    @IBOutlet var registerButton: UIButton!
    
    
    let IS_DEBUG_MODE = true
    var isNewRegistration = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if isNewRegistration {
            title = "Register New User"
            registerButton.setTitle("REGISTER", for: .normal)
        } else {
            title = "Login"
            registerButton.setTitle("LOGIN", for: .normal)
        }
        registerButton.layer.borderWidth = 2
        registerButton.layer.borderColor = UIColor.black.cgColor
        registerButton.layer.cornerRadius = 13
    }
    
    fileprivate func registerNewUser(_ email: String, _ password: String) {
        SVProgressHUD.show()
        Auth.auth().createUser(withEmail: email, password: password) {
            (result, error) in
            if error != nil {
                print(error!)
            } else {
                print("Success")
                self.performSegue(withIdentifier: "GoToChat", sender: nil)
            }
            SVProgressHUD.dismiss()
        }
    }
    
    fileprivate func loginUser(_ email: String, _ password: String) {
        SVProgressHUD.show()
        Auth.auth().signIn(withEmail: email, password: password) {
            (result, error) in
            if error != nil {
                print(error!)
            } else {
                print("Success")
                self.performSegue(withIdentifier: "GoToChat", sender: nil)
            }
            SVProgressHUD.dismiss()
        }
    }
    
    
    @IBAction func enterInfo(_ sender: AnyObject) {
        if IS_DEBUG_MODE{
            SVProgressHUD.show()
            loginUser("me@me.com", "free44")
            return
        }
        guard let email = emailTextField.text else {
            return
        }
        guard let password = passwordTextField.text else {
            return
        }
        if email == "" || password == "" {
            showEmptyAlert()
        }
        if isNewRegistration {
            registerNewUser(email, password)
        } else {
            loginUser(email, password)
        }
    }
    
    func  showEmptyAlert()  {
        let alert = UIAlertController(title: "Empty Field", message: "Fill out a valid email and password", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
            switch action.style {
            case .default:
                print("default")
            case .cancel:
                print("cancel")
            case .destructive:
                print("destructive")
            }
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    
    
}
