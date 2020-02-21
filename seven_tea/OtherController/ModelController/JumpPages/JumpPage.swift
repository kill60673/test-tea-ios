//
//  JumpPage.swift
//  seven_tea
//
//  Created by harrison on 2020/2/18.
//  Copyright © 2020 harrison公司機. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController{
    //從忘記密碼頁面送帳號及電話跟電話驗證碼送到重設密碼頁面去
    func jump_RestPassword(account : String  , phone : String , validators_code : String){
        let vc = storyboard?.instantiateViewController(withIdentifier : "RestPassword") as! ResetPasswordViewController
        vc.name = account
        vc.phonenumber = phone
        vc.uservalidatorscode = validators_code
        show(vc , sender : self)
    }
    //從註冊頁面第二頁送詳細資訊到送出詳細註冊資訊頁面
    func jump_SendMemberRegisterInfo(username : String , name : String , phone : String , sex : String , uservalidatorscode : String){
        let vc = storyboard?.instantiateViewController(withIdentifier : "SendMemberRegisterInfo") as! SendMemberRegisterInfoViewController
        vc.account = username
        vc.name = name
        vc.phone = phone
        vc.sex = sex
        vc.uservalidatorscode = uservalidatorscode
        show(vc , sender : self)
    }
    //從註冊開始的電話認證頁面送電話及電話驗證碼到註冊名稱細節的頁面
    func jump_SendMemberRegistr(phone : String , validators_code : String){
        let vc = storyboard?.instantiateViewController(withIdentifier: "SendMemberRegistr") as! SendMemberRegistrViewController
        vc.phone = phone
        vc.uservalidatorscode = validators_code
        show(vc , sender : self)
    }
}
