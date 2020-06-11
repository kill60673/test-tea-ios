//
//  Accountinfomation.swift
//  seven_tea
//
//

import Foundation
import UIKit
func getVerifyEmailMessage(email: String) {
    let postString  = SendVerifyEmail(email: email)
    let encoder = JSONEncoder()
    if let data = try? encoder.encode(postString) {
        print(postString)
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
func getSetVerifyEmailMessage(email: String, email_vaildate_code: String) {
    let postString  = SendSetVerifyEmail(email: email, email_validate_code: email_vaildate_code)
    let encoder = JSONEncoder()
    if let data = try? encoder.encode(postString) {
        print(postString)
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
func getEditNameMessage(type:String,name:String){
    let postString = EdifMemberInfoMessage(type: type, params: name)
    let encoder = JSONEncoder()
    if let data = try? encoder.encode(postString) {
        print(postString)
        datas = data
        print(data)
        EditMemberInfoApi.EditMemberInfoApiInstance.createfeedback(token: UserInfo.UserInfoInstance.preferences.object(forKey: "token") as! String) {(result) in
            if result {
                return
            } else {
            }
        }
    }
}
func getEditSexMessage(type:String,sex:String){
    let postString = EdifMemberInfoMessage(type: type, params: sex)
    let encoder = JSONEncoder()
    if let data = try? encoder.encode(postString) {
        print(postString)
        datas = data
        print(data)
        EditMemberInfoApi.EditMemberInfoApiInstance.createfeedback(token: UserInfo.UserInfoInstance.preferences.object(forKey: "token") as! String) {(result) in
            if result {
                return
            } else {
            }
        }
    }
}
