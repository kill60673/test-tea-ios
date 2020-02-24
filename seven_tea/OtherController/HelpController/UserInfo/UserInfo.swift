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
    func save(token: String, username: String, email: String, phone: String, name: String, point: Int, address: String, loveAddress: [String]) {
        preferences.set(token, forKey: "token")
        preferences.set(username, forKey: "username")
        preferences.set(email, forKey: "email")
        preferences.set(phone, forKey: "phone")
        preferences.set(name, forKey: "name")
        preferences.set(point, forKey: "point")
        preferences.set(address, forKey: "address")
        preferences.set(loveAddress, forKey: "love_address")
    }

    func delete() {
        preferences.removeObject(forKey: "token")
        preferences.removeObject(forKey: "username")
        preferences.removeObject(forKey: "email")
        preferences.removeObject(forKey: "phone")
        preferences.removeObject(forKey: "name")
        preferences.removeObject(forKey: "point")
        preferences.removeObject(forKey: "address")
        preferences.removeObject(forKey: "love_address")
        preferences.removeObject(forKey: "CommonAddress")
    }
    func update(oldToken: String, newToken: String) {
        print("老\(oldToken)")
        print("新\(newToken)")
        if newToken != "" && oldToken != newToken {
            preferences.set(newToken, forKey: "token")
            // 建立新的Token
        }
    }
}
