//
//  UserInfo.swift
//  seven_tea
//
//

import Foundation
import UIKit

class UserInfo: NSObject{
    var preferences = UserDefaults.standard
    
    static let UserInfoInstance = UserInfo()
    
    private override init() {
        
    }
    
    func save(token: String,username: String,email: String,phone: String,name: String,point: Int,address: String,love_address: Array<String>) {
        preferences.set(token, forKey: "token")
        preferences.set(username, forKey: "username")
        preferences.set(email, forKey: "email")
        preferences.set(phone, forKey: "phone")
        preferences.set(name, forKey: "name")
        preferences.set(point, forKey: "point")
        preferences.set(address, forKey: "address")
        preferences.set(love_address , forKey: "love_address")
        
    }
    
    func delete(){
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
    
    func Update(OldToken :String,NewToken :String){
        print("老\(OldToken)")
        print("新\(NewToken)")
        
        if(NewToken != "" && OldToken != NewToken ){
            preferences.set(NewToken, forKey: "token")
            // 建立新的Token
        }
        
    }
    
}
