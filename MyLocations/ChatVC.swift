//
//  ChatVC.swift
//  MyLocations
//
//  Created by Eric Snow on 6/20/19.
//  Copyright © 2019 Eric Snow. All rights reserved.
//

import UIKit
import Firebase

class ChatVC: UIViewController, UITableViewDataSource, UITableViewDelegate, UITextFieldDelegate {
    
    @IBOutlet var textField: UITextField!
    @IBOutlet var sendButton: UIButton!
    @IBOutlet var chatTableView: UITableView!
    @IBOutlet var senderViewHeight: NSLayoutConstraint!
    
    let cellIdentifier = "ChatCell"
    let normalSenderViewHeight = 70
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textField.delegate = self
        chatTableView.register(UINib(nibName: "ChatCell", bundle: nil), forCellReuseIdentifier: "ChatCell")
        navigationItem.hidesBackButton = true
        borders()
        configureTableView()

    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    func borders() {
        sendButton.layer.borderWidth = 2
        sendButton.layer.borderColor = UIColor.black.cgColor
        sendButton.layer.cornerRadius = 13
        sendButton.layer.masksToBounds = true
        textField.layer.borderWidth = 2
        textField.layer.borderColor = UIColor.black.cgColor
        textField.layer.cornerRadius = 13
        textField.layer.masksToBounds = true
    }
    
    func configureTableView() {
        chatTableView.rowHeight = UITableView.automaticDimension
        chatTableView.estimatedRowHeight = 120.0
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! ChatCell
        let messageArray = ["REPENT! 1", "REPENT! 2", "REPENT! REPENT! REPENT! REPENT! REPENT! REPENT! REPENT! REPENT! REPENT! REPENT! REPENT! REPENT! REPENT! REPENT! REPENT! REPENT! REPENT! REPENT! REPENT! REPENT! REPENT! REPENT! REPENT! REPENT! REPENT! REPENT! REPENT! REPENT! REPENT! REPENT! REPENT! REPENT! REPENT! REPENT! REPENT! REPENT! REPENT! REPENT! REPENT! REPENT! REPENT! REPENT! REPENT! REPENT! REPENT! REPENT! REPENT! REPENT! REPENT! REPENT!", "Hi"]
        cell.chatBody.text = messageArray[indexPath.row]
        cell.textLabel?.textColor = .white
        cell.senderUsername.text = "fytfbksg fbdsjkgns"
        return cell
    }
    
    @IBAction func logout(_ sender: UIBarButtonItem) {
        do {
            try Auth.auth().signOut()
            navigationController?.popToRootViewController(animated: true)
            
        } catch {
            print("ERROR Signing Out")
        }
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        UIView.animate(withDuration: 0.5) {
            self.senderViewHeight.constant = CGFloat(263 + self.normalSenderViewHeight)
            self.view.layoutIfNeeded()
            
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        UIView.animate(withDuration: 0.5) {
            self.senderViewHeight.constant = CGFloat(self.normalSenderViewHeight)
            self.view.layoutIfNeeded()
            
            
        }

        

        
    }



}
