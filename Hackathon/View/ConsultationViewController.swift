//
//  ConsultationViewController.swift
//  Hackathon
//
//  Created by 築山朋紀 on 2018/11/25.
//  Copyright © 2018 tomoki. All rights reserved.
//

import UIKit
import Firebase

class ConsultationViewController: UIViewController {
    
    private let tableView = UITableView()
    var users = [User]()
    var ref: DatabaseReference!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "相談相手一覧"
        tableView.register(ConsultationTableViewCell.self, forCellReuseIdentifier: "ConsultationCell")
        tableView.frame = self.view.bounds
        tableView.tableFooterView = UIView()
        tableView.rowHeight = 80
        self.view.addSubview(tableView)
        tableView.dataSource = self
        tableView.delegate = self
        observe()
    }
    
    func observe(){
        ref = Database.database().reference()
        ref.child("users").observe(DataEventType.value) { (snapshot) in
            self.users = [User]()
            for item in snapshot.children{
                if let snap = item as? DataSnapshot{
                    let user = User(snapshot: snap)
                    self.users.append(user)
                }
            }
            self.tableView.reloadData()
        }
    }
}

extension ConsultationViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ConsultationCell", for: indexPath) as! ConsultationTableViewCell
        cell.setUp(user: users[indexPath.row])
        return cell
    }
}

extension ConsultationViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        performSegue(withIdentifier: "toChat", sender: nil)
    }
}
