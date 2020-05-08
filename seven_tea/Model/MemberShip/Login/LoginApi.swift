//
//  LoginAPI.swift
//  NewSevenTea
//
//

import Foundation
import UIKit

class LoginAPI: NSObject {
    static let LoginInstance = LoginAPI()

    //將資料放進object的func
    // 登入用API
    func login(handler : @escaping (Bool) -> Void) {

        let url = URL(string: ApiUrl.ApiUrlInstance.loginUrl)!
        var request = URLRequest(url: url)

        request.setValue("application/json", forHTTPHeaderField: "Accept")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "POST"
        request.httpBody = datas
        let task = URLSession.shared.dataTask(with: request) {
            data, _, _ in
            let responseString = String(data: data!, encoding: .utf8)
            //            print(responseString as Any)
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .iso8601
            // 做 do catch 如果任何例外事件 就在catch print出error
            if let data = data {
                do {
                    let login = try decoder.decode(LoginCodable.self, from: data)
                    if login.success == true {
                        DispatchQueue.main.async {
                            MemberInfoApi.MemberInfoInstance.memberInfo(token: "Bearer \(login.data.token)")
                            loginView.dismiss(animated: true, completion: nil)
                            loginView.navigationController?.popViewController(animated: true)
                            //tab 切換的第0個
                            loginView.tabBarController?.selectedIndex = 0
                            print(login.data.token)
                            MessageAlert.Instance.message(message: login.message)
                            handler(true)
                        }
                    } else {
                        DispatchQueue.main.async {
                            print(login.data)
                            MessageAlert.Instance.message(message: login.message)
                            handler(false)
                        }
                    }
                } catch {
                    print(error)
                }
            }
        }
        task.resume()
    }
}
