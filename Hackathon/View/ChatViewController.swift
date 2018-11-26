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

class ChatViewController: UIViewController {
  
    private let tableView = UITableView()
    var ref:DatabaseReference!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = "チャット"
        let nib = UINib(nibName: "ChatTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "chatCell")
        tableView.allowsSelection = false
        tableView.separatorStyle = .none
        self.view.addSubview(tableView)
        tableView.dataSource = self
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        tableView.snp.makeConstraints { make in
            make.size.equalTo(self.view)
        }
    }
}

extension ChatViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "chatCell") as! ChatTableViewCell
        
        cell.userImageView.layer.cornerRadius = 20
        cell.userImageView.clipsToBounds = true
        let imageURL = URL(string: "https://pbs.twimg.com/profile_images/1061520538386915329/ExNUPGbF_400x400.jpg")
        cell.userImageView.sd_setImage(with: imageURL)
        cell.nameLabel.text = "ともき"
        cell.messageLabel.text = "ほげほげほげおｈごえ"
        return cell
    }
}
