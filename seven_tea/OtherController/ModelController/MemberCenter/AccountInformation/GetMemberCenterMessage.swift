//
//  Accountinfomation.swift
//  seven_tea
//
//

import Foundation
import UIKit
func getVerifyEmailMessage(email:String) {
    let postSTring  = SendVerifyEmail(email: email)
    let encoder = JSONEncoder()
    if let data = try? encoder.encode(postSTring) {
        print(postSTring)
        datas = data
        print(data)
        VerifyEmailApi.VerifyEmailInstance.verifyEmailApi(token: UserInfo.UserInfoInstance.preferences.object(forKey: "token") as! String) {(result) in
            if result {
                return
            } else {
            }
        }
    }
}
func getSetVerifyEmailMessage(email:String,email_vaildate_code:String) {
    let postSTring  = SendSetVerifyEmail(email: email, email_validate_code: email_vaildate_code)
    let encoder = JSONEncoder()
    if let data = try? encoder.encode(postSTring) {
        print(postSTring)
        datas = data
        print(data)
        SendSetVerifyEmailApi.SetVerifyEmailInstance.setverifyEmailApi(token: UserInfo.UserInfoInstance.preferences.object(forKey: "token") as! String) {(result) in
            if result {
                return
            } else {
            }
        }
    }
}
