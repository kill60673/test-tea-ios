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
            print(responseString as Any)
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .iso8601
            // 做 do catch 如果任何例外事件 就在catch print出error
            if let data = data {
                do {
                    print(data)
                    let login = try decoder.decode(LoginCodable.self, from: data)
                    if login.success == true {
                        DispatchQueue.main.async {
                                MessageAlert.Instance.message(message: "登入成功")
                                handler(true)

                        }
                    } else {
                        DispatchQueue.main.async {
                                MessageAlert.Instance.message(message: "登入失敗")
                                handler(false)
                        }
                    }
                } catch {

                }
            }
        }
        task.resume()
    }
}
