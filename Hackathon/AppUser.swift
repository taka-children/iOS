//
//  AppUser.swift
//  Hackathon
//
//  Created by 築山朋紀 on 2018/11/26.
//  Copyright © 2018 tomoki. All rights reserved.
//

import SwiftyUserDefaults

struct AppUser {
    
    /// ユーザーのメールアドレス
    static var email: String {
        return Defaults[.email]
    }
    
    /// ユーザーのプロフィール画像URL
    static var imageURL: String {
        return Defaults[.imageURL]
    }
    
    /// ユーザーの名前
    static var name: String {
        return Defaults[.name]
    }
    
    /// ユーザーのプロフィール文
    static var profile: String {
        return Defaults[.profile]
    }
    
    /// ユーザーの性別
    static var sex: String {
        return Defaults[.sex]
    }
    
    /// ユーザーの生年月日
    static var birthday: String {
        return Defaults[.birthday]
    }
}

extension AppUser {
    
    /// メールアドレスの保存
    static func saveEmail(email: String) {
        Defaults[.email] = email
    }
    
    /// 基本情報を保存
    static func save(name: String, sex: String, profile: String, birthday: String) {
        Defaults[.name] = name
        Defaults[.sex] = sex
        Defaults[.profile] = profile
        Defaults[.birthday] = birthday
    }
}

private extension DefaultsKeys {
    static let email = DefaultsKey<String>("email")
    static let imageURL = DefaultsKey<String>("user_image_URL")
    static let name = DefaultsKey<String>("user_name")
    static let profile = DefaultsKey<String>("profile_text")
    static let sex = DefaultsKey<String>("user_sex")
    static let birthday = DefaultsKey<String>("user_birthday")
}
