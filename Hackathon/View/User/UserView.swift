//
//  UserView.swift
//  Hackathon
//
//  Created by 築山朋紀 on 2018/11/26.
//  Copyright © 2018 tomoki. All rights reserved.
//

import UIKit
import SDWebImage

class UserView: UIView {
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.textColor = AppColor.main
        label.font = .systemFont(ofSize: 30)
        label.textAlignment = .center
        return label
    }()
    
    private let userImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.backgroundColor = AppColor.main
        return imageView
    }()
    
    required override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.addSubview(nameLabel)
        self.addSubview(userImageView)
    }
    
    func setUp() {
        nameLabel.text = "ともき"
        let imageURL = URL(string: "https://pbs.twimg.com/profile_images/1061520538386915329/ExNUPGbF_400x400.jpg")
        userImageView.sd_setImage(with: imageURL!)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        nameLabel.snp.makeConstraints { make in
            make.top.equalTo(self).offset(40)
            make.left.equalTo(self).offset(20)
            make.width.equalTo(self).dividedBy(2)
            make.height.equalTo(30)
        }
        
        userImageView.snp.makeConstraints { make in
            make.top.equalTo(self).offset(20)
            make.right.equalTo(self).offset(-20)
            make.width.height.equalTo(self.snp.width).dividedBy(3)
        }
        userImageView.layer.cornerRadius = userImageView.frame.width / 2
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError()
    }
}
