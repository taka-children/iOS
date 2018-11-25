//
//  OficeViewController.swift
//  Hackathon
//
//  Created by 松木周 on 2018/11/26.
//  Copyright © 2018年 tomoki. All rights reserved.
//

import UIKit

class OficeViewController: UIViewController {

    
    @IBOutlet weak var OficeImageView: UIImageView!
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

        // Do any additional setup after loading the view.
    }
    @IBAction func playButtonPressed(_ sender: Any) {
    }
    
}
