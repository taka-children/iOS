//
//  TechnologyViewController.swift
//  Hackathon
//
//  Created by 築山朋紀 on 2018/11/26.
//  Copyright © 2018 tomoki. All rights reserved.
//

import UIKit
import XLPagerTabStrip

class TechnologyViewController: UIViewController {
    
    @IBOutlet private weak var webView: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let favoriteURL = URL(string: "https://news.google.com/search?q=%E3%83%86%E3%82%AF%E3%83%8E%E3%83%AD%E3%82%B8%E3%83%BC&hl=ja&gl=JP&ceid=JP%3Aja")
        let urlRequest = URLRequest(url: favoriteURL!)
        
        webView.loadRequest(urlRequest)
    }
}

extension TechnologyViewController: IndicatorInfoProvider {
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return "テクノロジー"
    }
}
