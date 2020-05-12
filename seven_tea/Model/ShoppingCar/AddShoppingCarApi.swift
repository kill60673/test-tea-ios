//
//  AddShopingCar.swift
//  seven_tea
//
//  Created by harrison on 2020/5/3.
//  Copyright © 2020 harrison公司機. All rights reserved.
//

import Foundation
class AddShoppingCarApi: NSObject {
    static let AddShoppingCarInstance = AddShoppingCarApi()
    var newToken: String!
    func addshoppingcar(token: String, handler : @escaping (Bool) -> Void) {
        let url = URL(string: ApiUrl.ApiUrlInstance.addtoshopingcar)!
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
                    let addshoppingcar = try decoder.decode(AddShoppingCarCodable.self, from: data)
                    if addshoppingcar.success == true {
                        DispatchQueue.main.async {
                            MessageAlert.Instance.message(message: addshoppingcar.message)
                        }
                    } else {
                        DispatchQueue.main.async {
                            MessageAlert.Instance.message(message: addshoppingcar.message)
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
