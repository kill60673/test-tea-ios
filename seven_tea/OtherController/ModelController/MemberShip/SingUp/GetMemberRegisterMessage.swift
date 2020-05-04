//
//  File.swift
//  seven_tea
//
//  Created by harrison on 2020/2/20.
//  Copyright © 2020 harrison公司機. All rights reserved.
//

import Foundation
import UIKit

class GetMemberRegisterMessage: UIViewController {

    //    將資料放進object的func
    func getMemberRegisterMessage(phone: String, validator_code: String, controller: UIViewController) {
        let postString  = MemberRegisterMessage(phone: phone, validator_code: validator_code)
        let encoder = JSONEncoder()
        if let data = try? encoder.encode(postString) {
            print(postString)
            datas = data
            print(data)
            SendMemberRegistrApi.MemberRegisterInstance.sendMemberRegister {(result) in
                if result {
                    return
                        controller.jumpSendMemberRegistr(phone: phone, validatorsCode: validator_code)
                } else {

                }
            }
        }
    }
    //       將資料放進object的func
    func getMemberRegisterMessageInfo(username: String, name: String, sex: String, phone: String, password: String, passwordConfirmation: String, validatorsCode: String) {
        let postString  = MemberRegisterMessageInfo(username: username, name: name, sex: sex, phone: phone, password: password, password_confirmation: passwordConfirmation, validator_code: validatorsCode)
        let encoder = JSONEncoder()
        if let data = try? encoder.encode(postString) {
            print(postString)
            datas = data
            print(data)
            SendMemberRegisterInfoAPI.MemberRegisterInstance.sendMemberRegisterInfo {(result) in
                if result {
                    return
                    //如有跳轉至某頁面之後再補上 現在註冊流程到這邊會註冊完不需要繼續換頁因此不用呼叫jumpfunc
                } else {

                }
            }
        }

    }
    func getForgotPasswordSms(account: String, phone: String) {
        let postString  = ForgotPasswordSms(username: account, phone: phone)
        let encoder = JSONEncoder()
        if let data = try? encoder.encode(postString) {
            print(postString)
            datas = data
            print(data)
            ForgotPasswordSmsAPI.ForgotPasswordSmsInstance.forgotPasswordSms {(result) in
                if result {
                    return
                } else {

                }
            }
        }
    }
    func getResetPassword(userName: String, phone: String, validatorsCode: String, password: String, passwordConfirmation: String) {
        let postString  = ResetPassword(username: userName, phone: phone, validators_code: validatorsCode, password: password, password_confirmation: passwordConfirmation)
        let encoder = JSONEncoder()
        if let data = try? encoder.encode(postString) {
            print(postString)
            datas = data
            print(data)
            RestPasswordApi.RestPasswordApiInstance.restPassword { (result) in
                if result {
                    return
                } else {

                }
            }

        }
    }
    func getSendResetForgotPassword(userName: String, phone: String, validatorsCode: String, controller: UIViewController ) {
        let postString  = SendResetForgorPasswordMessage(username: userName, phone: phone, validator_code: validatorsCode)
        let encoder = JSONEncoder()
        if let data = try? encoder.encode(postString) {
            print(postString)
            datas = data
            SendResetForgotPasswordSmsAPI.SendResetForgotPasswordSmsInstance.sendResetForgotPasswordSms { (result) in
                if result {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                        controller.jumpRestPassword(account: userName, phone: phone, validators_Code: validatorsCode)
                    }
                    return
                } else {
                }
            }
        }
    }
    func getMemberRegisterSmsMessage(phone: String) {
        let postSTring  = MemberRegisterSms(phone: phone)
        let encoder = JSONEncoder()
        if let data = try? encoder.encode(postSTring) {
            print(postSTring)
            datas = data
            print(data)
            MemberRegiseterSmsApi.MemberRegisterSmsInstance.sendMemberRegisterSms { (result) in
                if result {
                    return
                } else {
                }
            }
        }
    }
}
