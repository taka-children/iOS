//
//  ChatViewController.swift
//  Hackathon
//
//  Created by 松木周 on 2018/11/25.
//  Copyright © 2018年 tomoki. All rights reserved.
//

import UIKit
import Firebase
import SDWebImage

struct chat {
    let user: User
    let message: String
    
    init(user: User, message: String) {
        self.user = user
        self.message = message
    }
}

class ChatViewController: UIViewController {
    
    private let tableView = UITableView()
    var ref:DatabaseReference!
    var roomKey: String!
    var messages = [chat]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "チャット"
        let nib = UINib(nibName: "ChatTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "chatCell")
        tableView.allowsSelection = false
        tableView.separatorStyle = .none
        self.view.addSubview(tableView)
        tableView.dataSource = self
        
        createTalkRoomIfNeeded()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        tableView.snp.makeConstraints { make in
            make.size.equalTo(self.view)
        }
    }
}

extension ChatViewController {
    func createTalkRoomIfNeeded(){
        ref = Database.database().reference()
        let roomRef = ref.child("rooms")
        roomRef.observeSingleEvent(of: DataEventType.value) { (snapshot) in
            print("create room")
            let newRoomRef = roomRef.childByAutoId()
            self.observe()
        }
    }
    
    func observe(){
        print(self.roomKey)
        let chatRef = ref.child("chats")
        chatRef.queryOrdered(byChild: "roodId").queryEqual(toValue: self.roomKey).observe(DataEventType.value) { (snapshot) in
            for item in snapshot.children {
                if let chatSnap = item as? DataSnapshot {
                    let user = chatSnap.childSnapshot(forPath: "User").value as? User
                    let message = chatSnap.childSnapshot(forPath: "text").value as? String
                    let text = chat(user: user!, message: message!)
                    self.messages.append(text)
                }
            }
        }
    }
}

extension ChatViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "chatCell") as! ChatTableViewCell
        
        cell.userImageView.layer.cornerRadius = 20
        cell.userImageView.clipsToBounds = true
        let imageURL = URL(string: messages[indexPath.row].user.imageURL)
        cell.userImageView.sd_setImage(with: imageURL)
        cell.nameLabel.text = messages[indexPath.row].user.name
        cell.messageLabel.text = messages[indexPath.row].message
        return cell
    }
}
