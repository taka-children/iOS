//
//  LoginViewController.swift
//  Hackathon
//
//  Created by 岸下和樹 on 2018/11/25.
//  Copyright © 2018 tomoki. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class LoginViewController: UIViewController {
    
    @IBOutlet private weak var mailInput: UITextField!
    @IBOutlet private weak var passwordInput: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = "ログイン"
        mailInput.delegate = self
        passwordInput.delegate = self
        setLayout()
    }
    
    private func setLayout() {
        mailInput.layer.cornerRadius = 25
        mailInput.layer.borderWidth = 1
        mailInput.layer.borderColor = AppColor.main.cgColor
        mailInput.backgroundColor = AppColor.white
        
        passwordInput.layer.cornerRadius = 25
        passwordInput.layer.borderWidth = 1
        passwordInput.layer.borderColor = AppColor.main.cgColor
        passwordInput.backgroundColor = AppColor.white
        passwordInput.isSecureTextEntry = true
    }
    
    @IBAction func loginButton(_ sender: UIButton) {
        guard let email = mailInput.text else { return }
        guard let pass = passwordInput.text else { return }
        if email.isEmpty { return }
        if pass.isEmpty { return }
        
        Auth.auth().signIn(withEmail: email, password: pass) { user, error in
            if let error = error {
                print(error)
                return
            } else {
                print("ログイン成功")
                self.performSegue(withIdentifier: "toTabBar", sender: nil)
            }
        }
    }
}

extension LoginViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == mailInput {
            passwordInput.becomeFirstResponder()
        } else {
            textField.resignFirstResponder()
        }
        return true
    }
}
