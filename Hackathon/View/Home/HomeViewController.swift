//
//  HomeViewController.swift
//  Hackathon
//
//  Created by 築山朋紀 on 2018/11/25.
//  Copyright © 2018 tomoki. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet private weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "記事"
        tableView.delegate = self
        tableView.dataSource = self

    }
}

extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HomeCell", for: indexPath)
        cell.textLabel?.text = String(indexPath.row)
        return cell
    }
}

extension HomeViewController: UITableViewDelegate {
    
}
