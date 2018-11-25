//
//  UIViewController.swift
//  Hackathon
//
//  Created by 築山朋紀 on 2018/11/26.
//  Copyright © 2018 tomoki. All rights reserved.
//

import UIKit

struct height {
    
    static var navigationHeight: CGFloat {
        return UINavigationController().navigationBar.frame.height
    }
    
    static var statusHeight: CGFloat {
        return UIApplication.shared.statusBarFrame.size.height
    }
    
    static var topHeight: CGFloat {
        return navigationHeight + statusHeight
    }
    
    static var tabBarheight: CGFloat {
        return UITabBarController().tabBar.frame.height
    }
    
    static var spaceHeight: CGFloat {
        return UIViewController().view.frame.height - (topHeight - tabBarheight)
    }
}
