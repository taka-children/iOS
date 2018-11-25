//
//  LoginViewController.swift
//  Hackathon
//
//  Created by 岸下和樹 on 2018/11/25.
//  Copyright © 2018 tomoki. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet private weak var mailInput: UITextField!
    @IBOutlet private weak var password: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setLayout()
    }
    
    private func setLayout() {
        mailInput.layer.cornerRadius = 25
        mailInput.layer.borderWidth = 1
        mailInput.layer.borderColor = AppColor.main.cgColor
        mailInput.backgroundColor = AppColor.white
        
        password.layer.cornerRadius = 25
        password.layer.borderWidth = 1
        password.layer.borderColor = AppColor.main.cgColor
        password.backgroundColor = AppColor.white
    }
    
    @IBAction func loginButton(_ sender: UIButton) {
        
    }
}
