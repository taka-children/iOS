//
//  InternetViewController.swift
//  Hackathon
//
//  Created by 築山朋紀 on 2018/11/26.
//  Copyright © 2018 tomoki. All rights reserved.
//

import UIKit
import XLPagerTabStrip

class InternetViewController: UIViewController {
    
    @IBOutlet private weak var webView: UIWebView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let favoriteURL = URL(string: "https://news.google.com/search?q=%E3%82%A4%E3%83%B3%E3%82%BF%E3%83%BC%E3%83%8D%E3%83%83%E3%83%88&hl=ja&gl=JP&ceid=JP%3Aja")
        let urlRequest = URLRequest(url: favoriteURL!)
        
     webView.loadRequest(urlRequest)
    }
}

extension InternetViewController: IndicatorInfoProvider {
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return "インターネット"
    }
}
