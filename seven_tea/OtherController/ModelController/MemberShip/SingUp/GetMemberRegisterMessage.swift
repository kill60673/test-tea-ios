//
//  File.swift
//  seven_tea
//
//  Created by harrison on 2020/2/20.
//  Copyright © 2020 harrison公司機. All rights reserved.
//

import Foundation
import UIKit

class GetMemberRegisterMessage : UIViewController{
    
    
    //    將資料放進object的func
    func getMemberRegisterMessage(phone : String , validators_code : String)
    {
        let postSTring  = MemberRegisterMessage(phone: phone, validators_code: validators_code)
        let encoder = JSONEncoder()
        if let data = try? encoder.encode(postSTring)
        {
            print(postSTring)
            datas = data
            print(data)
            SendMemberRegistrApi.MemberRegisterInstance.SendMemberRegister
                {
                    (result) in
                    if result
                    {
                        return
                            self.jump_SendMemberRegistr(phone: phone, validators_code: validators_code)
                    }
                    else
                    {
                        
                    }
            }
        }
    }
    //       將資料放進object的func
    func getMemberRegisterMessageInfo(username : String , name : String , sex : String , phone: String , password : String,  password_confirmation: String , validators_code: String)
    {
        let postSTring  = MemberRegisterMessageInfo(username: username, name: name, sex: sex, phone: phone, password: password, password_confirmation: password_confirmation, validators_code: validators_code)
        let encoder = JSONEncoder()
        if let data = try? encoder.encode(postSTring)
        {
            print(postSTring)
            datas = data
            print(data)
            SendMemberRegisterInfoAPI.MemberRegisterInstance.SendMemberRegisterInfo
                {
                    (result) in
                    if result
                    {
                        return
                        //如有跳轉至某頁面之後再補上 現在註冊流程到這邊會註冊完不需要繼續換頁因此不用呼叫jumpfunc
                    }
                    else
                    {
                        
                    }
            }
        }
        
    }
    
}
