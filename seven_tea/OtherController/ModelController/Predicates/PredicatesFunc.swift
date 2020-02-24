//
//  File.swift
//  seven_tea
//
//  Created by harrison on 2020/2/18.
//  Copyright © 2020 harrison公司機. All rights reserved.
//

import Foundation
import UIKit
//var ver = VerificationCodeTimer()
class PredicatesFunc: UIViewController {
    // 2/18修正完確定不會爆
    func restPassword(password: String, againenterpassword: String, lbPrompt: UILabel, uservalidatorscode: String, name: String, phonenumber: String) {
        //如果密碼輸入是錯誤的不管是空值還是格式錯誤regex_message都會回傳回來正確的錯誤訊息
        if checkValidPassword(input: password) == false {
            lbPrompt.text = regexmessage
            lbPrompt.shake()
        }
            //如果密碼輸入兩次不一樣 回傳訊息告知
        else if againenterpassword != password {
            lbPrompt.text = "兩次密碼輸入不同請確認"
            lbPrompt.shake()
        }
            //當判斷兩個都不是false的時候進入
        else if (checkValidPassword(input: password) == false) && ((againenterpassword == password)) {
            RestPasswordApi.RestPasswordApiInstance.restPassword(userName: name, phone: phonenumber, validatorsCode: uservalidatorscode, password: password, passwordConfirmation: againenterpassword)
        }
    }

    func sendResetForgotPasswordSms(account: String, phone: String, validatorsCode: String, lbUserName: UILabel, lbPhone: UILabel, lbValidatorsCode: UILabel) {
        // 2/18修正完成
        //如果帳號輸入是錯誤的不管是空值還是格式錯誤regex_message都會回傳回來正確的錯誤訊息
        if checkValidAccount(input: account) == false {
            lbUserName.text = regexmessage
            lbUserName.shake()
        }
            //如果電話號碼輸入是錯誤的不管是空值還是格式錯誤regex_message都會回傳回來正確的錯誤訊息
        else if checkValidPhoneNumber(input: phone) == false {
            lbUserName.text = regexmessage
            lbUserName.shake()
        }
            //如果電話驗證碼輸入是錯誤的不管是空值還是格式錯誤regex_message都會回傳回來正確的錯誤訊息
        else if checkValidVerificationCode(input: validatorsCode) == false {
            lbPhone.text = regexmessage
            lbPhone.shake()
        } else if (checkValidAccount(input: account) == false ) && (checkValidPhoneNumber(input: phone) == false) && (checkValidVerificationCode(input: validatorsCode) == false) {
            SendResetForgotPasswordSmsAPI.SendResetForgotPasswordSmsInstance.sendResetForgotPasswordSms(userName: account, phone: phone, validatorsCode: validatorsCode) {
                (result) in
                if result {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                        self.jumpRestPassword(account: account, phone: phone, validatorsCode: validatorsCode)
                    }
                }
            }
        }

    }

    func forgotPasswordSms(account: String, phone: String, btSendVerifyCode: UIButton, lbUserName: UILabel, lbPhone: UILabel) {
        //      let verificationcode = VerificationCodeTimer()
        //如果帳號輸入是錯誤的不管是空值還是格式錯誤regex_message都會回傳回來正確的錯誤訊息
        if checkValidAccount(input: account) == false {
            lbPhone.text = regexmessage
            lbPhone.shake()
        }
            //如果電話號碼輸入是錯誤的不管是空值還是格式錯誤regex_message都會回傳回來正確的錯誤訊息
        else if checkValidPhoneNumber(input: phone) == false {
            lbUserName.text = regexmessage
            lbUserName.shake()
        } else if (checkValidAccount(input: account) == true) && (checkValidPhoneNumber(input: phone) == true) {
                      ForgotPasswordSmsAPI.ForgotPasswordSmsInstance.forgotPasswordSms(username: account, phone: phone)
            // 計時器
//            ver.triggerTimer(button: btSendVerifyCode)
        }
    }

    func login(account: String, userpassword: String, lbName: UILabel, lbPassword: UILabel ) {

        //如果帳號輸入是錯誤的不管是空值還是格式錯誤regex_message都會回傳回來正確的錯誤訊息
        if checkValidAccount(input: account) == false {
            lbName.text = regexmessage
            lbName.shake()
        }
            //如果密碼輸入是錯誤的不管是空值還是格式錯誤regex_message都會回傳回來正確的錯誤訊息
        else if checkValidPassword(input: userpassword) == false {
            lbPassword.text = regexmessage
            lbPassword.shake()
        }
            //當兩個都為true進入API登入
        else if (checkValidAccount(input: account) == true) && (checkValidPassword(input: userpassword) == true) {
            LoginAPI.LoginInstance.getLoginMessage(username: account, password: userpassword)
        }
    }

    func sendMemberRegisterInfo(password: String, againEnterpassword: String, account: String, name: String, sex: String, phone: String, uservalidatorscode: String, lbMessage: UILabel) {
        //如果密碼輸入是錯誤的不管是空值還是格式錯誤regex_message都會回傳回來正確的錯誤訊息
        if checkValidPassword(input: password) == false {
            lbMessage.text = regexmessage
            lbMessage.shake()
        }
            //如果密碼輸入兩次不一樣 回傳訊息告知
        else if password == againEnterpassword {
            lbMessage.text = "＊兩次密碼輸入不同"
            lbMessage.shake()
        }
            //如果判斷兩個都不是錯的 那就可以進到下面的判斷
        else if (checkValidPassword(input: password) == true) && (password == againEnterpassword ) {
            memberRegisterMessage.getMemberRegisterMessageInfo(username: account, name: name, sex: sex, phone: phone, password: password, passwordConfirmation: againEnterpassword, validatorsCode: uservalidatorscode)
        }
    }
    func jumpSendMemberRegisterInfo(username: String, name: String, lbUserName: UILabel, lbName: UILabel, phone: String, sex: String, uservalidatorscode: String) {
        //如果帳號輸入是錯誤的不管是空值還是格式錯誤regex_message都會回傳回來正確的錯誤訊息
        if checkValidAccount(input: username) == false {
            lbUserName.text = regexmessage
            lbUserName.shake()

        }
        //如果使用著名稱為空值提醒請輸入使用者名稱
        else if name == "" {
            lbName.text = "＊請輸入使用者名稱"
            lbName.shake()
        }
        //當兩個都為規定以後即可進入
        else if  (checkValidAccount(input: username) == true) && (name != "") {
            jumpSendMemberRegisterInfo(username: username, name: name, phone: phone, sex: sex, uservalidatorscode: uservalidatorscode)
        }
    }

    func sendMemberRegistr(validatorsCode: String, phone: String, lbMessage: UILabel) {
        if checkValidPhoneNumber(input: phone) == false {
            lbMessage.text = regexmessage
            lbMessage.shake()
        } else if  checkValidVerificationCode(input: validatorsCode) == false {
            lbMessage.text = regexmessage
            lbMessage.shake()
        } else if (checkValidVerificationCode(input: validatorsCode) == true) && (checkValidPhoneNumber(input: phone) == true) {
            memberRegisterMessage.getMemberRegisterMessage(phone: phone, validatorsCode: validatorsCode)
        }
    }
}
