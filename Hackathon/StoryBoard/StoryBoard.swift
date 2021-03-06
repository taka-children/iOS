//
//  StoryBoard.swift
//  Hackathon
//
//  Created by 築山朋紀 on 2018/11/25.
//  Copyright © 2018 tomoki. All rights reserved.
//

import UIKit
class Storyboards {
    
    fileprivate init() {}
    
    static let tabBar = Storyboard<UITabBarController>(name: "TabBar")
    
    static let main = Storyboard<UIViewController>(name: "Main")
    
    static let home = Storyboard<UINavigationController>(name: "Home")
    
    static let mail = Storyboard<UINavigationController>(name: "Consultation")
    
    static let user = Storyboard<UINavigationController>(name: "User")
    
    static let internet = Storyboard<InternetViewController>(name: "Internet")
    static let financial = Storyboard<FinancialViewController>(name: "Financial")
    static let career = Storyboard<CareerViewController>(name: "Career")
    static let social = Storyboard<SocialViewController>(name: "Social")
    static let technology = Storyboard<TechnologyViewController>(name: "Technology")
    static let business = Storyboard<BusinessViewController>(name: "Business")
    
    static let Ofice = Storyboard<UINavigationController>(name: "Ofice")
}
// MARK: - Storyboard -
final class Storyboard<InitialVC: UIViewController>: Storyboards {
    
    let name: String
    
    // MARK: - Initializer
    
    fileprivate init(name: String) {
        self.name = name
    }
    
    // MARK: - Methods
    
    func instantiateViewController() -> InitialVC {
        let storyboard = UIStoryboard(name: self.name, bundle: nil)
        guard let vc = storyboard.instantiateInitialViewController() else {
            assertionFailure("\(self.name).storyboardでinitialVCが設定されていません")
            return InitialVC()
        }
        guard let initialVC = vc as? InitialVC else {
            assertionFailure("\(self.name).storyboardのinitialVCは\(type(of: vc.self))型です")
            return InitialVC()
        }
        return initialVC
    }
    
}

