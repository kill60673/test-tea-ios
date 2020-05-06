//
//  UserInfo.swift
//  seven_tea
//
//

import Foundation
import UIKit

class UserInfo: NSObject {
    var preferences = UserDefaults.standard
    static let UserInfoInstance = UserInfo()

    private override init() {
    }
    func save(token: String,picture_url:String, username: String,name: String,gender:String,email_validated:Int, email: String, phone: String) {
        print("我有近來這邊")
        preferences.set(token, forKey: "token")
        preferences.set(username, forKey: "username")
        preferences.set(email, forKey: "email")
        preferences.set(phone, forKey: "phone")
        preferences.set(name, forKey: "name")
        preferences.set(picture_url, forKey: "picture_url")
//        preferences.set(address, forKey: "address")
        preferences.set(gender, forKey: "gender")
        preferences.set(email_validated, forKey: "email_validated")
    }

    func delete() {
        preferences.removeObject(forKey: "token")
        preferences.removeObject(forKey: "username")
        preferences.removeObject(forKey: "email")
        preferences.removeObject(forKey: "phone")
        preferences.removeObject(forKey: "name")
        preferences.removeObject(forKey: "picture_url")
//        preferences.removeObject(forKey: "address")
        preferences.removeObject(forKey: "gender")
        preferences.removeObject(forKey: "email_validated")
//        preferences.removeObject(forKey: "CommonAddress")
    }
    func update(oldToken: String, newToken: String) {
        print("老\(oldToken)")
        print("新\(newToken)")
        print("我有進來")
        if newToken != "" && oldToken != newToken {
            preferences.set(newToken, forKey: "token")
            // 建立新的Token
        }
    }
}
