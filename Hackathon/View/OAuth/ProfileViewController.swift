//
//  ProfileViewController.swift
//  Hackathon
//
//  Created by 松木周 on 2018/11/26.
//  Copyright © 2018年 tomoki. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController, UITextFieldDelegate, UITextViewDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate{

    
    @IBOutlet weak var userImageView: UIImageView!
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var userSexTextField: UITextField!
    @IBOutlet weak var userBirthTextField: UITextField!
    @IBOutlet weak var userIntroduceTextView: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        userNameTextField.delegate = self
        userSexTextField.delegate = self
        userBirthTextField.delegate = self
        
        userImageView.layer.cornerRadius = userImageView.bounds.width / 2.0
        userImageView.layer.masksToBounds = true 
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }

    func textViewShouldEndEditing(_ textView: UITextView) -> Bool {
        textView.resignFirstResponder()
        return true
    }
    
    @IBAction func imageButtonPressed(_ sender: Any) {
        let actionController = UIAlertController(title: "写真の選択", message: "選択して下さい", preferredStyle: .actionSheet)
        let cameraAction = UIAlertAction(title: "写真を撮影する", style: .default) { (action) in
            if UIImagePickerController.isSourceTypeAvailable(.camera) == true {
                let piker = UIImagePickerController()
                piker.sourceType = .camera
                piker.delegate = self
                self.present(piker, animated: true, completion: nil)
            } else {
                print("この機種ではカメラは使用できません")
            }
        }
        let albumAction = UIAlertAction(title: "フォトライブラリから選択する", style: .default) { (action) in
            //ライブラリを使用するには端末に許可を得る必要があるのでinfo.plistで申請許可を書く
            if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) == true  {
                let piker = UIImagePickerController()
                piker.sourceType = .photoLibrary
                piker.delegate = self
                self.present(piker, animated: true, completion: nil)
            } else {
                print("この機種ではフォトライブラリがは使用できません")
            }
        }
        let cancelAction = UIAlertAction(title: "キャンセル", style: .cancel) { (aciton) in
            actionController.dismiss(animated: true, completion: nil)
        }
        actionController.addAction(cameraAction)
        actionController.addAction(albumAction)
        actionController.addAction(cancelAction)
        self.present(actionController, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        let selectedImage = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
        picker.dismiss(animated: true, completion: nil)
        
        //画像データベースに保存する
    }
    

    
    @IBAction func saveButtonPressed(_ sender: Any) {
        
        self.performSegue(withIdentifier: "toTabBar", sender: nil)
    }
    
    
}
