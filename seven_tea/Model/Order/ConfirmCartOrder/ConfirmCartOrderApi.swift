//
//  ConfirmCartOrderApi.swift
//  seven_tea
//
//  Created by harrison on 2020/5/19.
//  Copyright © 2020 harrison公司機. All rights reserved.
//

import Foundation
class ConfirmCartOrderApi: NSObject {
    static let ConfirmCartOrderApiInstance = ConfirmCartOrderApi()
    var newToken: String!
    func confirmcartorder(token: String, handler : @escaping (Bool) -> Void) {
        let url = URL(string: ApiUrl.ApiUrlInstance.confirmcartorder)!
        var request = URLRequest(url: url)
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue(token, forHTTPHeaderField: "Authorization")
        request.httpMethod = "POST"
        let postString = datas
        request.httpBody = postString
        let task = URLSession.shared.dataTask(with: request) {
            data, response, _ in
            let httpStatus = response as! HTTPURLResponse
            print("為什麼999",httpStatus.allHeaderFields["Authorization"])
            if httpStatus.allHeaderFields["Authorization"] != nil {
                print("我有進來2")
                self.newToken = "\(httpStatus.allHeaderFields["Authorization"]!)"
                UserInfo.UserInfoInstance.update(oldToken: token, newToken: "\(httpStatus.allHeaderFields["Authorization"]!)")
            } else {
                print("tokennnnn",token)
                print("我有進來3")
            }
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .iso8601
            if let data = data {
                do {
                    let confirmcartorder = try decoder.decode(ConfirmCartOrderCodable.self, from: data)
                    if confirmcartorder.success == true {
                        DispatchQueue.main.async {
                            MessageAlert.Instance.message(message: confirmcartorder.message)
                        }
                    } else {
                        DispatchQueue.main.async {
                            MessageAlert.Instance.message(message: confirmcartorder.message)
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
