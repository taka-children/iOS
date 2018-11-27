//
//  ProfileViewController.swift
//  Hackathon
//
//  Created by 松木周 on 2018/11/26.
//  Copyright © 2018年 tomoki. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseDatabase

class ProfileViewController: UIViewController, UITextViewDelegate {

    @IBOutlet private weak var userImageView: UIImageView!
    @IBOutlet private weak var userNameTextField: UITextField!
    @IBOutlet private weak var userSexTextField: UITextField!
    @IBOutlet private weak var userBirthTextField: UITextField!
    @IBOutlet private weak var userIntroduceTextView: UITextView!
    
    let pickerView = UIPickerView()
    let datepicker = UIDatePicker()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        userNameTextField.delegate = self
        userSexTextField.delegate = self
        userBirthTextField.delegate = self
        
        userImageView.layer.cornerRadius = userImageView.bounds.width / 2.0
        userImageView.layer.masksToBounds = true
        setLayout()
        
    }
    
    @IBAction private func saveButtonPressed(_ sender: Any) {
        guard let name = userNameTextField.text else { return }
        guard let sex = userSexTextField.text else { return }
        guard let profile = userIntroduceTextView.text else { return }
        guard let birthday = userBirthTextField.text else { return }

        if name.isEmpty { return }
        if sex.isEmpty { return }
        if profile.isEmpty { return }
        if birthday.isEmpty { return }
        
        postUserData(name: name, profile: profile, birthday: birthday, sex: sex)
        AppUser.save(name: name, profile: profile, birthday: birthday, sex: sex)
        self.performSegue(withIdentifier: "toTabBar", sender: nil)
    }
    
    private func setLayout() {
        let timeZone = datepicker.timeZone
        datepicker.timeZone = timeZone
        datepicker.datePickerMode = UIDatePicker.Mode.date
        
        let vi = UIView(frame: datepicker.bounds)
        vi.backgroundColor = UIColor.white
        vi.addSubview(datepicker)
        
        userBirthTextField.inputView = vi
        
        let toolBar = UIToolbar()
        toolBar.barStyle = UIBarStyle.default
        toolBar.isTranslucent = true
        toolBar.tintColor = AppColor.black
        let doneButton   = UIBarButtonItem(title: "決定", style: UIBarButtonItem.Style.done, target: self, action: #selector(ProfileViewController.donePressed))
        let cancelButton = UIBarButtonItem(title: "キャンセル", style: UIBarButtonItem.Style.plain, target: self, action: #selector(ProfileViewController.cancelPressed))
        let spaceButton  = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
        toolBar.setItems([cancelButton, spaceButton, doneButton], animated: false)
        toolBar.isUserInteractionEnabled = true
        toolBar.sizeToFit()
        userBirthTextField.inputAccessoryView = toolBar
    }
    
    @objc func donePressed() {
        view.endEditing(true)
        userBirthTextField.text = self.format(date: datepicker.date)
    }
    
    @objc func cancelPressed() {
        userBirthTextField.text = ""
        view.endEditing(true)
    }
    
    /// Stringに変換
    private func format(date: Date) -> String {
        let dateformatter = DateFormatter()
        dateformatter.dateFormat = "yyyy-MM-dd"
        let strDate = dateformatter.string(from: date)
        return strDate
    }
    
    /// ユーザー情報をFirebaseに保存
    private func postUserData(name: String, profile: String, birthday: String, sex: String) {
        var ref: DatabaseReference!
        ref = Database.database().reference()
        let user = Auth.auth().currentUser
        guard let uuid = user?.uid else { return }
        ref.child("users").child(uuid).updateChildValues([
            "UUID": uuid,
            "name": name,
            "profile": profile,
            "birthday": birthday,
            "sex": sex
            ])
    }
    
    @IBAction private func imageButtonPressed() {
        imagePicker()
    }
}

extension ProfileViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

extension ProfileViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    private func imagePicker() {
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
    
    private func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let selectedImage = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
        picker.dismiss(animated: true, completion: nil)
        
        //画像データベースに保存する
    }
}
