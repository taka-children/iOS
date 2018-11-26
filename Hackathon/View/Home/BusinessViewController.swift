//
//  BusinessViewController.swift
//  Hackathon
//
//  Created by 築山朋紀 on 2018/11/26.
//  Copyright © 2018 tomoki. All rights reserved.
//

import UIKit
import XLPagerTabStrip

class BusinessViewController: UIViewController {

    @IBOutlet private weak var webView: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let favoriteURL = URL(string: "https://news.google.com/search?q=%E3%83%93%E3%82%B8%E3%83%8D%E3%82%B9&hl=ja&gl=JP&ceid=JP%3Aja")
        let urlRequest = URLRequest(url: favoriteURL!)
        
        webView.loadRequest(urlRequest)
    }
}

extension BusinessViewController: IndicatorInfoProvider {
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return "ビジネス"
    }
}
