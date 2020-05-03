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
           SendMemberRegistrApi.MemberRegisterInstance.sendMemberRegister {(result) in
               if result {
                   return
               } else {
               }
           }
       }
   }
