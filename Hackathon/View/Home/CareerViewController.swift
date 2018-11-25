//
//  CareerViewController.swift
//  Hackathon
//
//  Created by 築山朋紀 on 2018/11/26.
//  Copyright © 2018 tomoki. All rights reserved.
//

import UIKit
import XLPagerTabStrip

class CareerViewController: UIViewController {

    private let tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(HomeTableViewCell.self, forCellReuseIdentifier: "homeCell")
        self.view.addSubview(tableView)
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        tableView.snp.makeConstraints { make in
            make.size.equalTo(self.view)
        }
    }
}

extension CareerViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "homeCell", for: indexPath) as! HomeTableViewCell
        cell.textLabel?.text = String(indexPath.row)
        return cell
    }
}

extension CareerViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
    }
}

extension CareerViewController: IndicatorInfoProvider {
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return "キャリア・教育"
    }
}
