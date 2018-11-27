//
//  User.swift
//  Hackathon
//
//  Created by 築山朋紀 on 2018/11/26.
//  Copyright © 2018 tomoki. All rights reserved.
//

import Foundation
import Firebase
import FirebaseDatabase

struct User {
    let UUID: String
    let name: String
    let profile: String
    let birthday: String
    let sex: String
    let imageURL: String
    
    init(snapshot: DataSnapshot) {
        self.UUID = snapshot.childSnapshot(forPath: "UUID").value as! String
        self.name = snapshot.childSnapshot(forPath: "name").value as! String
        self.profile = snapshot.childSnapshot(forPath: "profile").value as! String
        self.birthday = snapshot.childSnapshot(forPath: "birthday").value as! String
        self.sex = snapshot.childSnapshot(forPath: "sex").value as! String
        self.imageURL = snapshot.childSnapshot(forPath: "imageURL").value as? String ?? "https://pbs.twimg.com/profile_images/1061520538386915329/ExNUPGbF_400x400.jpg"
    }
}
