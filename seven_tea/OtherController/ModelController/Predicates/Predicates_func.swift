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
class Predicates_func : UIViewController {
    // 2/18修正完確定不會爆
    func RestPassword(password : String , againenterpassword : String , lbPrompt : UILabel , uservalidatorscode : String , Password_Confirmation : String , name : String , phonenumber : String) {
        //如果密碼輸入是錯誤的不管是空值還是格式錯誤regex_message都會回傳回來正確的錯誤訊息
        if (checkValidPassword(input : password) == false)
        {
            lbPrompt.text = regex_message
            lbPrompt.shake()
        }
            //如果密碼輸入兩次不一樣 回傳訊息告知
        else if (againenterpassword != password)
        {
            lbPrompt.text = "兩次密碼輸入不同請確認"
            lbPrompt.shake()
        }
            //當判斷兩個都不是false的時候進入
        else if ((checkValidPassword(input : password) == false) && ((againenterpassword == password)))
        {
            RestPasswordApi.RestPasswordApiInstance.RestPassword(Username : name , Phone : phonenumber , Validators_code : uservalidatorscode , Password : password , Password_Confirmation : againenterpassword)
        }
    }
    
    func SendResetForgotPasswordSms(account : String , phone : String , validators_code : String , lbUserName : UILabel , lbPhone : UILabel , lbValidators_Code : UILabel) {
        // 2/18修正完成
        //如果帳號輸入是錯誤的不管是空值還是格式錯誤regex_message都會回傳回來正確的錯誤訊息
        if (checkValidAccount(input : account) == false )
        {
            lbUserName.text = regex_message
            lbUserName.shake()
        }
            //如果電話號碼輸入是錯誤的不管是空值還是格式錯誤regex_message都會回傳回來正確的錯誤訊息
        else if (checkValidPhoneNumber(input : phone) == false)
        {
            lbUserName.text = regex_message
            lbUserName.shake()
        }
            //如果電話驗證碼輸入是錯誤的不管是空值還是格式錯誤regex_message都會回傳回來正確的錯誤訊息
        else if (checkValidVerificationCode(input : validators_code) == false)
        {
            lbPhone.text = regex_message
            lbPhone.shake()
        }
            
        else if ((checkValidAccount(input : account) == false ) && (checkValidPhoneNumber(input : phone) == false) && (checkValidVerificationCode(input : validators_code) == false))
        {
            SendResetForgotPasswordSmsAPI.SendResetForgotPasswordSmsInstance.SendResetForgotPasswordSms(Username : account , Phone : phone , Validators_code : validators_code)
            {
                (result) in
                if result
                {
                    DispatchQueue.main.asyncAfter(deadline : .now() + 0.5)
                    {
                        self.jump_RestPassword(account : account, phone : phone, validators_code : validators_code)
                    }
                }
            }
        }
        
    }
    
    func ForgotPasswordSms(account : String , phone : String , btSendVerifyCode : UIButton , lbUserName : UILabel , lbPhone : UILabel) {
        //      let verificationcode = VerificationCodeTimer()
        //如果帳號輸入是錯誤的不管是空值還是格式錯誤regex_message都會回傳回來正確的錯誤訊息
        if (checkValidAccount(input : account) == false)
        {
            lbPhone.text = regex_message
            lbPhone.shake()
        }
            //如果電話號碼輸入是錯誤的不管是空值還是格式錯誤regex_message都會回傳回來正確的錯誤訊息
        else if (checkValidPhoneNumber(input : phone) == false)
        {
            lbUserName.text = regex_message
            lbUserName.shake()
        }
            
        else if ((checkValidAccount(input : account) == true) && (checkValidPhoneNumber(input : phone) == true))
        {
            //          ForgotPasswordSmsAPI.ForgotPasswordSmsInstance.ForgotPasswordSms(Username: account , Phone : phone)
            // 計時器
            ver.triggerTimer(button : btSendVerifyCode)
        }
    }
    
    func Login(account : String , userpassword : String , lbName : UILabel , lbPassword : UILabel ) {
        
        //如果帳號輸入是錯誤的不管是空值還是格式錯誤regex_message都會回傳回來正確的錯誤訊息
        if (checkValidAccount(input : account) == false )
        {
            lbName.text = regex_message
            lbName.shake()
        }
            //如果密碼輸入是錯誤的不管是空值還是格式錯誤regex_message都會回傳回來正確的錯誤訊息
        else if (checkValidPassword(input : userpassword) == false)
        {
            lbPassword.text = regex_message
            lbPassword.shake()
        }
            //當兩個都為true進入API登入
        else if ((checkValidAccount(input: account) == true) && (checkValidPassword(input : userpassword) == true))
        {
            LoginAPI.LoginInstance.getLoginMessage(username : account , password : userpassword)
        }
    }
    
    func SendMemberRegisterInfo(password : String , againEnterpassword : String , account : String , name : String , sex : String , phone : String , uservalidatorscode : String , lbMessage : UILabel){
        //如果密碼輸入是錯誤的不管是空值還是格式錯誤regex_message都會回傳回來正確的錯誤訊息
        if (checkValidPassword(input : password) == false)
        {
            lbMessage.text = regex_message
            lbMessage.shake()
        }
            //如果密碼輸入兩次不一樣 回傳訊息告知
        else if (password == againEnterpassword)
        {
            lbMessage.text = "＊兩次密碼輸入不同"
            lbMessage.shake()
        }
            //如果判斷兩個都不是錯的 那就可以進到下面的判斷
        else if ((checkValidPassword(input : password) == true) && (password == againEnterpassword ))
        {
            SendMemberRegisterInfoAPI.MemberRegisterInstance.SendMemberRegisterInfo(Username : account, Name : name, Sex : sex , Phone : phone, Password : password , Password_confirmation : againEnterpassword , Validators_code : uservalidatorscode)
        }
    }
    
    func jumpSendMemberRegisterInfo(username : String , name : String , lbUserName : UILabel , lbName : UILabel , phone : String , sex : String , uservalidatorscode : String){
        //如果帳號輸入是錯誤的不管是空值還是格式錯誤regex_message都會回傳回來正確的錯誤訊息
        if(checkValidAccount(input : username) == false)
        {
            lbUserName.text = regex_message
            lbUserName.shake()
            
        }
        //如果使用著名稱為空值提醒請輸入使用者名稱
        else if (name == "")
        {
            lbName.text = "＊請輸入使用者名稱"
            lbName.shake()
        }
        //當兩個都為規定以後即可進入
        else if  ((checkValidAccount(input : username) == true) && (name != ""))
        {
            jump_SendMemberRegisterInfo(username : username , name : name , phone : phone , sex : sex , uservalidatorscode : uservalidatorscode)
        }
    }
    
    func SendMemberRegistr(validators_code : String , phone : String , lbMessage : UILabel){
        if (checkValidPhoneNumber(input : phone) == false)
        {
            lbMessage.text = regex_message
            lbMessage.shake()
        }
        else if ( checkValidVerificationCode(input : validators_code) == false)
        {
            lbMessage.text = regex_message
            lbMessage.shake()
        }
        else if ((checkValidVerificationCode(input : validators_code) == true) && (checkValidPhoneNumber(input: phone) == true))
        {
            memberRegisterMessage.getMemberRegisterMessage(phone: phone, validators_code: validators_code)
        }
    }
}


