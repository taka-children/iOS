//
//  ConsultationTableViewCell.swift
//  Hackathon
//
//  Created by 築山朋紀 on 2018/11/25.
//  Copyright © 2018 tomoki. All rights reserved.
//

import UIKit
import SnapKit
import SDWebImage

class ConsultationTableViewCell: UITableViewCell {
    
    private let userImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 30
        return imageView
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 15)
        label.textColor = AppColor.black
        return label
    }()
    
    private let profileLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 2
        label.font = .systemFont(ofSize: 12)
        label.textColor = AppColor.black
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.addSubview(userImageView)
        self.addSubview(nameLabel)
        self.addSubview(profileLabel)
    }
    
    func setUp() {
        let imageURL = URL(string: "https://pbs.twimg.com/profile_images/1061520538386915329/ExNUPGbF_400x400.jpg")
        userImageView.sd_setImage(with: imageURL!)
        nameLabel.text = "ともき"
        profileLabel.text = "デザインできないiOSエンジニア。コード書くのが大好き！"
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        userImageView.snp.makeConstraints { make in
            make.top.left.equalTo(self).offset(10)
            make.width.height.equalTo(60)
        }
        
        nameLabel.snp.makeConstraints { make in
            make.top.equalTo(self).offset(10)
            make.left.equalTo(userImageView.snp.right).offset(10)
            make.right.equalTo(self).offset(-10)
            make.height.equalTo(15)
        }
        
        profileLabel.snp.makeConstraints { make in
            make.top.equalTo(nameLabel.snp.bottom).offset(5)
            make.left.equalTo(userImageView.snp.right).offset(10)
            make.right.equalTo(self).offset(-10)
            make.height.greaterThanOrEqualTo(12)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
