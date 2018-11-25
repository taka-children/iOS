//
//  GoogleFormViewController.swift
//  Hackathon
//
//  Created by 松木周 on 2018/11/26.
//  Copyright © 2018年 tomoki. All rights reserved.
//

import UIKit

class GoogleFormViewController: UIViewController {
    
    @IBOutlet weak var googleWebView: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let favoriteURL = URL(string: "https://docs.google.com/forms/d/e/1FAIpQLSdUcKLnomVMI3L81TXVHX-LW8VB32tRzSDpajRrDIFkQxBIcw/viewform?usp=sf_link")
        let urlRequest = URLRequest(url: favoriteURL!)
        
        googleWebView.loadRequest(urlRequest)
    }
}
