//
//  HomeViewController.swift
//  Hackathon
//
//  Created by 築山朋紀 on 2018/11/25.
//  Copyright © 2018 tomoki. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import XLPagerTabStrip

class HomeViewController: ButtonBarPagerTabStripViewController {

    let helpButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "mailPage"), for: .normal)
        button.backgroundColor = AppColor.main
        return button
    }()
    let disposeBag = DisposeBag()

    override func viewDidLoad() {
        setBarLayout()
        super.viewDidLoad()
        
        self.navigationItem.title = "記事"
        setHelp()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        
        if let tabBarCtrl = self.tabBarController as? TabBarController {
            tabBarCtrl.setHelpButtonHidden(false, animated: true)
        }
    }
    
    private func setHelp() {
        let tellMeButtonOriginY = self.view.bounds.height - self.tabBarController!.tabBar.bounds.height - 95
        let tellMeButtonWidth: CGFloat = 80
        self.helpButton.frame = CGRect(x: self.view.bounds.width - 95,
                                         y: tellMeButtonOriginY,
                                         width: tellMeButtonWidth,
                                         height: tellMeButtonWidth)
        self.helpButton.layer.cornerRadius = tellMeButtonWidth / 2
        self.tabBarController?.view.addSubview(self.helpButton)
        
        self.helpButton.rx.tap.subscribe(onNext: { _ in
            UIView.animate(withDuration: 0.4, delay: 0.0, animations: {
                self.helpButton.frame.origin.y += 200
            }, completion: { _ in
                /// LINEに遷移
                let contactURL = URL(string: "https://line.me/R/ti/p/%40czy8284g")!
                if UIApplication.shared.canOpenURL(contactURL) {
                    UIApplication.shared.open(contactURL)
                }
            })
        }).disposed(by: self.disposeBag)
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
