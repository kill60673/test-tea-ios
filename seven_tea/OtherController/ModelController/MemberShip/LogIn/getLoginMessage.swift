//
//  LoginModelController.swift
//  seven_tea
//
//

import Foundation
import UIKit
class GetLoginMessage: UIViewController{
    func getLoginMessage(username: String, password: String) {
          let postSTring  = Loginmessage(username: username, password: password)
          let encoder = JSONEncoder()
          if let data = try? encoder.encode(postSTring) {
              print(postSTring)
              datas = data
              print(data)
            LoginAPI.LoginInstance.login {
                     (result) in
                     if result {
                         return
                     } else {

                     }
             }

          }
      }
}
