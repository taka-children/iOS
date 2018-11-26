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
    
    func setHelpButtonHidden(_ hidden: Bool, animated: Bool, completion: @escaping (Bool) -> Void = { _ in }) {
        guard let navCtrl = self.viewControllers?.first as? UINavigationController, let homeVC = navCtrl.viewControllers.first as? HomeViewController else { return }
        let helpButton = homeVC.helpButton
        guard helpButton.isHidden != hidden else { return }
        if animated {
            let displayedButtonOriginY = helpButton.frame.minY
            let hiddenButtonOriginY = self.view.bounds.maxY
            if !hidden {
                helpButton.isHidden = false
                helpButton.frame.origin.y = hiddenButtonOriginY
            }
            UIView.animate(withDuration: 0.4, animations: {
                helpButton.frame.origin.y = hidden ? hiddenButtonOriginY : displayedButtonOriginY
            }, completion: { _ in
                helpButton.isHidden = hidden
                helpButton.frame.origin.y = displayedButtonOriginY
            })
        } else {
            helpButton.isHidden = hidden
        }
    }
}

extension TabBarController {
    
    private enum Tab: CaseIterable {
        case home
        case Ofice
        case user
        
        func instantiateViewController() -> UINavigationController {
            let nav: UINavigationController
            let tabBarItem: UITabBarItem
            switch self {
            case .home:
                nav = Storyboard.home.instantiateViewController()
                tabBarItem = UITabBarItem(title: "", image: UIImage(named: "home"), selectedImage: UIImage(named: "home"))
            case .Ofice:
                nav = Storyboard.Ofice.instantiateViewController()
                tabBarItem = UITabBarItem(title: "", image: UIImage(named: "MacBook@1"), selectedImage: UIImage(named: "MacBook@1"))
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
