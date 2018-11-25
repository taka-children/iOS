//
//  OficeViewController.swift
//  Hackathon
//
//  Created by 松木周 on 2018/11/26.
//  Copyright © 2018年 tomoki. All rights reserved.
//

import UIKit
import SDWebImage

class OficeViewController: UIViewController {

    
    @IBOutlet weak var oficeImageView: UIImageView!
    @IBOutlet weak var oficeNameLabel: UILabel!
    @IBOutlet weak var headLineTextView: UITextView!
    
    @IBOutlet weak var placeLabel: UILabel!
    @IBOutlet weak var personLabel: UILabel!
    @IBOutlet weak var dayCountLabel: UILabel!
    
    @IBOutlet weak var presidentImageView: UIImageView!
    @IBOutlet weak var presidentNameLabel: UILabel!
    @IBOutlet weak var positionNameLabel: UITextView!
    @IBOutlet weak var presidentIntroTextView: UITextView!
    
    @IBOutlet weak var headLine2Label: UILabel!
    @IBOutlet weak var intro2TextView: UITextView!
    
    
    @IBOutlet weak var headLine3Label: UILabel!
    @IBOutlet weak var intro3TextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "株式会社taliki"
        
        let oficeURL = URL(string: "https://taliki.org/wp-content/uploads/2017/05/IMG_5945.jpg")
        oficeImageView.sd_setImage(with: oficeURL)
        let presidentURL = URL(string: "https://scontent-nrt1-1.xx.fbcdn.net/v/t1.0-9/30443186_804034783136035_4901413405550947549_n.jpg?_nc_cat=102&_nc_ht=scontent-nrt1-1.xx&oh=058c0be0cfeac6137c9a143440e884e2&oe=5CA79DC8")
        presidentImageView.sd_setImage(with: presidentURL)
        presidentImageView.layer.cornerRadius = presidentImageView.frame.width / 2
        presidentImageView.clipsToBounds = true
    }
    
}
