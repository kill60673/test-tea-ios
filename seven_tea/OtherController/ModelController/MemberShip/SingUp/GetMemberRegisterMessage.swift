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
            SendMemberRegistrApi.MemberRegisterInstance.SendMemberRegister { (result) in
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
}
