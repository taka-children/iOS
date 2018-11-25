//
//  AttributeViewController.swift
//  Hackathon
//
//  Created by 築山朋紀 on 2018/11/25.
//  Copyright © 2018 tomoki. All rights reserved.
//

import UIKit

class AttributeViewController: UIViewController {
    
    @IBOutlet private weak var tableView: UITableView!
    @IBOutlet private weak var doneButton: UIButton!

    private let items = ["IT/通信", "インターネット", "広告", "メディア", "サービス", "メーカー", "総合商社", "専門商社", "メディカル", "金融", "建設", "プラント", "不動産", "小売", "外食"]

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        navigationItem.title = "興味関心"
        
        doneButton.backgroundColor = AppColor.main
        doneButton.setTitleColor(AppColor.white, for: .normal)
    }
}

extension AttributeViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AttributeCell", for: indexPath)
        cell.textLabel?.text = items[indexPath.row]
        return cell
    }
}

extension AttributeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        print(indexPath.row)
    }
}
