//
//  UserViewController.swift
//  Hackathon
//
//  Created by 築山朋紀 on 2018/11/26.
//  Copyright © 2018 tomoki. All rights reserved.
//

import UIKit
import SnapKit
import SDWebImage

class UserViewController: UIViewController {
    
    let profileView = UserView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "プロフィール"
        profileView.frame = CGRect(x: 0, y: height.topHeight, width: view.frame.width, height: height.spaceHeight)
        profileView.setUp()
        self.view.addSubview(profileView)
        
        if let tabBarCtrl = self.tabBarController as? TabBarController {
            tabBarCtrl.setHelpButtonHidden(false, animated: true)
        }
    }

}
