//
//  ConsultationViewController.swift
//  Hackathon
//
//  Created by 築山朋紀 on 2018/11/25.
//  Copyright © 2018 tomoki. All rights reserved.
//

import UIKit

class ConsultationViewController: UIViewController {
    
    private let tableView = UITableView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "相談相手一覧"
        tableView.register(ConsultationTableViewCell.self, forCellReuseIdentifier: "ConsultationCell")
        tableView.frame = self.view.bounds
        tableView.rowHeight = 80
        self.view.addSubview(tableView)
        tableView.dataSource = self
        tableView.delegate = self

    }
}

extension ConsultationViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ConsultationCell", for: indexPath) as! ConsultationTableViewCell
        cell.setUp()
        return cell
    }
}

extension ConsultationViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        print(indexPath.row)
    }
}
