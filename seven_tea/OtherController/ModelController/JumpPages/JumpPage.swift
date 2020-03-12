//
//  JumpPage.swift
//  seven_tea
//
//  Created by harrison on 2020/2/18.
//  Copyright © 2020 harrison公司機. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    //從忘記密碼頁面送帳號及電話跟電話驗證碼送到重設密碼頁面去
    //2/25目前確認在這個func裡的跳轉方式需要做更改
    func jumpRestPassword(account: String, phone: String, validators_Code: String) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil) //if bundle is nil the main bundle will be used
        let vc = storyboard.instantiateViewController(withIdentifier: "RestPassword") as? ResetPasswordViewController
        print("aaaaa", storyboard, storyboard.instantiateViewController(withIdentifier: "RestPassword"))
        vc?.name = account
        vc?.phonenumber = phone
        vc?.uservalidatorscode = validators_Code
        show(vc!, sender: nil)

       // self.navigationController?.pushViewController(UIViewController(), animated: true)
    }
    //從註冊頁面第二頁送詳細資訊到送出詳細註冊資訊頁面
    func jumpSendMemberRegisterDetail(username: String, name: String, phone: String, sex: String, uservalidatorscode: String) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "SendMemberRegisterInfo") as? SendMemberRegisterInfoViewController
        vc?.account = username
        vc?.name = name
        vc?.phone = phone
        vc?.sex = sex
        vc?.uservalidatorscode = uservalidatorscode
        show(vc!, sender: nil)
    }
    //從註冊開始的電話認證頁面送電話及電話驗證碼到註冊名稱細節的頁面
    func jumpSendMemberRegistr(phone: String, validatorsCode: String) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "SendMemberRegistr") as? SendMemberRegistrViewController
        vc!.phone = phone
        vc!.uservalidatorscode = validatorsCode
        show(vc!, sender: nil)
    }
}
