//
//  HomeViewController.swift
//  Hackathon
//
//  Created by 築山朋紀 on 2018/11/25.
//  Copyright © 2018 tomoki. All rights reserved.
//

import UIKit
import XLPagerTabStrip

class HomeViewController: ButtonBarPagerTabStripViewController {

    override func viewDidLoad() {
        setBarLayout()
        super.viewDidLoad()
        
        self.navigationItem.title = "記事"
    }
    
    override func viewControllers(for pagerTabStripController: PagerTabStripViewController) -> [UIViewController] {
        return [
            Storyboard.internet.instantiateViewController(),
            Storyboard.financial.instantiateViewController(),
            Storyboard.career.instantiateViewController(),
            Storyboard.social.instantiateViewController(),
            Storyboard.technology.instantiateViewController(),
            Storyboard.business.instantiateViewController()
        ]
    }
    
    private func setBarLayout() {
        settings.style.buttonBarBackgroundColor = AppColor.white
        settings.style.buttonBarItemBackgroundColor = AppColor.white
        settings.style.buttonBarItemTitleColor = AppColor.main
        settings.style.selectedBarBackgroundColor = AppColor.main
        settings.style.selectedBarHeight = 2.5
        changeCurrentIndexProgressive = { (oldCell: ButtonBarViewCell?, newCell: ButtonBarViewCell?, progressPercentage: CGFloat, changeCurrentIndex: Bool, animated: Bool) in
            guard changeCurrentIndex else { return }
            oldCell?.label.textColor = UIColor.gray
            oldCell?.label.font = .systemFont(ofSize: CGFloat(15))
            newCell?.label.textColor = AppColor.main
            newCell?.label.font = .boldSystemFont(ofSize: 15)
        }
    }
}
