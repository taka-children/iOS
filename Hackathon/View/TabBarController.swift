//
//  TabBarController.swift
//  Hackathon
//
//  Created by 築山朋紀 on 2018/11/25.
//  Copyright © 2018 tomoki. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tabBar.tintColor = AppColor.main
        let viewControllers = Tab.allCases.map { $0.instantiateViewController() }
        setViewControllers(viewControllers, animated: false)
    }
}

extension TabBarController {
    
    private enum Tab: CaseIterable {
        case home
        case mail
        case user
        
        func instantiateViewController() -> UINavigationController {
            let nav: UINavigationController
            let tabBarItem: UITabBarItem
            switch self {
            case .home:
                nav = Storyboard.home.instantiateViewController()
                tabBarItem = UITabBarItem(title: "", image: UIImage(named: "home"), selectedImage: UIImage(named: "home"))
            case .mail:
                nav = Storyboard.mail.instantiateViewController()
                tabBarItem = UITabBarItem(title: "", image: UIImage(named: "mailPage"), selectedImage: UIImage(named: "mailPage"))
            case .user:
                nav = Storyboard.user.instantiateViewController()
                tabBarItem = UITabBarItem(title: "", image: UIImage(named: "myPage"), selectedImage: UIImage(named: "myPage"))
            }
            tabBarItem.imageInsets = UIEdgeInsets(top: 6, left: 0, bottom: -6, right: 0)
            nav.tabBarItem = tabBarItem
            return nav
        }
    }
}
