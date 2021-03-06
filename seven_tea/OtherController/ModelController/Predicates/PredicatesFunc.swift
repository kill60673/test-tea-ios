//
//  File.swift
//  seven_tea
//
//  Created by harrison on 2020/2/18.
//  Copyright © 2020 harrison公司機. All rights reserved.
//

import Foundation
import UIKit
var ver = VerificationCodeTimer()
var loginMessage = GetLoginMessage()
class PredicatesFunc {
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
        else if (checkValidPassword(input: password) == true) && ((againenterpassword == password)) {
            memberRegisterMessage.getResetPassword(userName: name, phone: phonenumber, validatorsCode: uservalidatorscode, password: password, passwordConfirmation: againenterpassword)
        }
    }

    func sendResetForgotPasswordSms(account: String, phone: String, validatorsCode: String, lbUserName: UILabel, lbPhone: UILabel, lbValidatorsCode: UILabel, controller: UIViewController) {
        // 2/18修正完成
        //如果帳號輸入是錯誤的不管是空值還是格式錯誤regex_message都會回傳回來正確的錯誤訊息
        if checkValidAccount(input: account) == false {
            lbUserName.text = regexmessage
            lbUserName.shake()
        }
            //如果電話號碼輸入是錯誤的不管是空值還是格式錯誤regex_message都會回傳回來正確的錯誤訊息
        else if checkValidPhoneNumber(input: phone) == false {
            lbPhone.text = regexmessage
            lbPhone.shake()
        }
            //如果電話驗證碼輸入是錯誤的不管是空值還是格式錯誤regex_message都會回傳回來正確的錯誤訊息
        else if checkValidVerificationCode(input: validatorsCode) == false {
            lbValidatorsCode.text = regexmessage
            lbValidatorsCode.shake()
        } else if (checkValidAccount(input: account) == true ) && (checkValidPhoneNumber(input: phone) == true) && (checkValidVerificationCode(input: validatorsCode) == true) {
            memberRegisterMessage.getSendResetForgotPassword(userName: account, phone: phone, validatorsCode: validatorsCode, controller: controller)
        }

    }

    func forgotPasswordSms(account: String, phone: String, btSendVerifyCode: UIButton, lbUserName: UILabel, lbPhone: UILabel) {
        //      let verificationcode = VerificationCodeTimer()
        //如果帳號輸入是錯誤的不管是空值還是格式錯誤regex_message都會回傳回來正確的錯誤訊息
        if checkValidAccount(input: account) == false {
            lbUserName.text = regexmessage
            lbUserName.shake()
        }
            //如果電話號碼輸入是錯誤的不管是空值還是格式錯誤regex_message都會回傳回來正確的錯誤訊息
        else if checkValidPhoneNumber(input: phone) == false {
            lbPhone.text = regexmessage
            lbPhone.shake()
        } else if (checkValidAccount(input: account) == true) && (checkValidPhoneNumber(input: phone) == true) {
            memberRegisterMessage.getForgotPasswordSms(account: account, phone: phone)
            // 計時器
            ver.triggerTimer(button: btSendVerifyCode)
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
            loginMessage.getLoginMessage(username: account, password: userpassword)
        }
    }

    func sendMemberRegisterInfo(password: String, againEnterpassword: String, account: String, name: String, sex: String, phone: String, uservalidatorscode: String, lbMessage: UILabel) {
        //如果密碼輸入是錯誤的不管是空值還是格式錯誤regex_message都會回傳回來正確的錯誤訊息
        if checkValidPassword(input: password) == false {
            lbMessage.text = regexmessage
            lbMessage.shake()
        }
            //如果密碼輸入兩次不一樣 回傳訊息告知
        else if password != againEnterpassword {
            lbMessage.text = "＊兩次密碼輸入不同"
            lbMessage.shake()
        }
            //如果判斷兩個都不是錯的 那就可以進到下面的判斷
        else if (checkValidPassword(input: password) == true) && (password == againEnterpassword ) {
            memberRegisterMessage.getMemberRegisterMessageInfo(username: account, name: name, sex: sex, phone: phone, password: password, passwordConfirmation: againEnterpassword, validatorsCode: uservalidatorscode)
        }
    }

    func jumpSendMemberRegisterInfo(username: String, name: String, lbUserName: UILabel, lbName: UILabel, phone: String, sex: String, uservalidatorscode: String, controller: UIViewController) {
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
            controller.jumpSendMemberRegisterDetail(username: username, name: name, phone: phone, sex: sex, uservalidatorscode: uservalidatorscode)
        }
    }

    func sendMemberRegistr(validator_code: String, phone: String, lbMessage: UILabel, controller: UIViewController) {
        if checkValidPhoneNumber(input: phone) == false {
            lbMessage.text = regexmessage
            lbMessage.shake()
        } else if  checkValidVerificationCode(input: validator_code) == false {
            lbMessage.text = regexmessage
            lbMessage.shake()
        } else if (checkValidVerificationCode(input: validator_code) == true) && (checkValidPhoneNumber(input: phone) == true) {
            memberRegisterMessage.getMemberRegisterMessage(phone: phone, validator_code: validator_code, controller: controller)
        }
    }

    func getMemberSmsApi(phone: String, lbMessage: UILabel, btSendVerifyCode: UIButton) {
        if checkValidPhoneNumber(input: phone) == true {
            memberRegisterMessage.getMemberRegisterSmsMessage(phone: phone)
            ver.triggerTimer(button: btSendVerifyCode)
        } else {
            lbMessage.text = regexmessage
            lbMessage.shake()
        }
    }
    func getEmailSmsApi(email: String, lbMessage: UILabel, btSendVerifyCode: UIButton) {
        if checkValidEmail(input: email) == true {
//           要放EmailSmsApi
            // 計時器
            ver.triggerTimer(button: btSendVerifyCode)
            getVerifyEmailMessage(email: email)
        } else {
            lbMessage.text = regexmessage
            lbMessage.shake()
        }
    }
    func setEmail(email: String, emailVerfiCode: String, lbMessage: UILabel) {
         //      let verificationcode = VerificationCodeTimer()
         //如果帳號輸入是錯誤的不管是空值還是格式錯誤regex_message都會回傳回來正確的錯誤訊息
         if checkValidEmail(input: email) == false {
             lbMessage.text = regexmessage
             lbMessage.shake()
         }
             //如果電話號碼輸入是錯誤的不管是空值還是格式錯誤regex_message都會回傳回來正確的錯誤訊息
         else if checkValidVerificationCode(input: emailVerfiCode) == false {
             lbMessage.text = regexmessage
             lbMessage.shake()
         } else if (checkValidAccount(input: email) == true) && (checkValidPhoneNumber(input: emailVerfiCode) == true) {
             getSetVerifyEmailMessage(email: email, email_vaildate_code: emailVerfiCode)
            //這邊要放設定EmailApi
         }
     }
}
