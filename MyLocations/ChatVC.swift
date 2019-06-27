//
//  ChatVC.swift
//  MyLocations
//
//  Created by Eric Snow on 6/20/19.
//  Copyright © 2019 Eric Snow. All rights reserved.
//

import UIKit
import Firebase
import ChameleonFramework

class ChatVC: UIViewController, UITableViewDataSource, UITableViewDelegate, UITextFieldDelegate {
    
    @IBOutlet var textField: UITextField!
    @IBOutlet var sendButton: UIButton!
    @IBOutlet var chatTableView: UITableView!
    @IBOutlet var senderViewHeight: NSLayoutConstraint!
    @IBOutlet var tableView: UITableView!
    
    let cellIdentifier = "ChatCell"
    let normalSenderViewHeight = 70
    var messageArray : [Message] = [Message]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textField.delegate = self
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tableViewTapped))
        chatTableView.addGestureRecognizer(tapGesture)
        chatTableView.register(UINib(nibName: "ChatCell", bundle: nil), forCellReuseIdentifier: "ChatCell")
        navigationItem.hidesBackButton = true
        borders()
        configureTableView()
        retrieveMessages()
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
        return messageArray.count
    }
    
    @objc func tableViewTapped() {
        textField.endEditing(true)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! ChatCell
        cell.textLabel?.textColor = .white
            cell.chatBody.text = messageArray[indexPath.row].messageBody
            cell.senderUsername.text = messageArray[indexPath.row].senderName
        if cell.senderUsername.text == Auth.auth().currentUser?.email as String? {
            cell.messageBackground.layer.backgroundColor = UIColor.darkGray.cgColor
            cell.messageBackground.layer.borderColor = UIColor.darkGray.cgColor
            cell.chatBody.textColor = UIColor.black
            cell.senderUsername.textColor = UIColor.white
        } else {
            cell.messageBackground.layer.backgroundColor = UIColor.black.cgColor
            cell.messageBackground.layer.borderColor = UIColor.black.cgColor
            cell.chatBody.textColor = UIColor.lightGray
            cell.senderUsername.textColor = UIColor.darkGray
        }
        cell.avatarImageView.downloaded(from: "https://api.adorable.io/avatars/285/" + "\(messageArray[indexPath.row].senderName)" + ".png")
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
    
    @IBAction func sendPressed(_ sender: AnyObject) {
        textField.endEditing(true)
        textField.isEnabled = false
        sendButton.isEnabled = false
        let messageDB = Database.database().reference().child("Messages")
        let messageDictionary = ["Sender": Auth.auth().currentUser?.email, "MessageBody": textField.text!]
        messageDB.childByAutoId().setValue(messageDictionary) {
            (error, reference) in
            if error != nil {
                print(error!)
            } else {
                print("Message saved successfully!")
                self.textField.isEnabled = true
                self.sendButton.isEnabled = true
                self.textField.text = ""
            }
        }
    }
    
    func retrieveMessages() {
        let messageDB = Database.database().reference().child("Messages")
        messageDB.observe(.childAdded, with: { (snapshot) in
            let  snapshotValue =  snapshot.value as! Dictionary<String, String>
            let text = snapshotValue["MessageBody"]!
            let sender = snapshotValue["Sender"]!
            print(text, sender)
            let message = Message(senderName: sender, messageBody: text)
            self.messageArray.append(message)
            self.tableView.reloadData()
            self.scrollToBottom()
        })
    }
    
    func scrollToBottom() {
        DispatchQueue.main.async {
            let indexPath = IndexPath(row: self.messageArray.count-1, section: 0)
            self.tableView.scrollToRow(at: indexPath, at: .bottom, animated: true)
        }
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        UIView.animate(withDuration: 0.25) {
            self.senderViewHeight.constant = CGFloat(263 + self.normalSenderViewHeight)
            self.view.layoutIfNeeded()
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        UIView.animate(withDuration: 0.17) {
            self.senderViewHeight.constant = CGFloat(self.normalSenderViewHeight)
            self.view.layoutIfNeeded()
        }
    }
}
