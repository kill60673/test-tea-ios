//
//  LoginModelController.swift
//  seven_tea
//
//

import Foundation
import UIKit
class GetLoginMessage: UIViewController {
    func getLoginMessage(username: String, password: String) {
        let postString  = Loginmessage(username: username, password: password)
        let encoder = JSONEncoder()
        if let data = try? encoder.encode(postString) {
            print(postString)
            datas = data
            print("1234567", data)

            LoginAPI.LoginInstance.login {(result) in
                if result {
                    return
                } else {
                }
            }
        }
    }
}
