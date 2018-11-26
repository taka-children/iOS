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
    
    @IBOutlet private weak var webView: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let favoriteURL = URL(string: "https://news.google.com/search?q=%E6%95%99%E8%82%B2&hl=ja&gl=JP&ceid=JP%3Aja")
        let urlRequest = URLRequest(url: favoriteURL!)
        
        webView.loadRequest(urlRequest)
    }
}

extension CareerViewController: IndicatorInfoProvider {
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return "キャリア・教育"
    }
}
