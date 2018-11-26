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
    static var birthday: Data {
        return Defaults[.birthday]
    }
}

extension AppUser {
    
    /// メールアドレスの保存
    static func saveEmail(email: String) {
        Defaults[.email] = email
    }
    
    static func save(name: String, sex: String, birthday: Data, profile: String) {
        Defaults[.name] = name
        Defaults[.sex] = sex
        Defaults[.birthday] = birthday
        Defaults[.profile] = profile
    }
}

private extension DefaultsKeys {
    static let email = DefaultsKey<String>("email", defaultValue: "")
    static let imageURL = DefaultsKey<String>("user_image_URL", defaultValue: "")
    static let name = DefaultsKey<String>("user_name", defaultValue: "")
    static let profile = DefaultsKey<String>("profile_text", defaultValue: "")
    static let sex = DefaultsKey<String>("user_sex", defaultValue: "")
    static let birthday = DefaultsKey<Data>("user_birthday")
}
