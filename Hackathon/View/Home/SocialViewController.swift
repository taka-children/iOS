//
//  SocialViewController.swift
//  Hackathon
//
//  Created by 築山朋紀 on 2018/11/26.
//  Copyright © 2018 tomoki. All rights reserved.
//

import UIKit
import XLPagerTabStrip

class SocialViewController: UIViewController {
    
    @IBOutlet private weak var webView: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let favoriteURL = URL(string: "https://news.google.com/search?q=%E7%A4%BE%E4%BC%9A&hl=ja&gl=JP&ceid=JP%3Aja")
        let urlRequest = URLRequest(url: favoriteURL!)
        
        webView.loadRequest(urlRequest)
    }
}

extension SocialViewController: IndicatorInfoProvider {
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return "社会・スポーツ"
    }
}
