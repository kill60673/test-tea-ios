//
//  CancelOrderApi.swift
//  seven_tea
//
//  Created by harrison on 2020/6/2.
//  Copyright © 2020 harrison公司機. All rights reserved.
//

import Foundation
class CancelOrderApi: NSObject {
    static let CancelOrderApiInstance = CancelOrderApi()
    var newToken: String!
    func updateshoppingcar(token: String, handler : @escaping (Bool) -> Void) {
        let url = URL(string: ApiUrl.ApiUrlInstance.cancelorder)!
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
            if httpStatus.allHeaderFields["Authorization"] != nil {
                self.newToken = "\(httpStatus.allHeaderFields["Authorization"]!)"
                UserInfo.UserInfoInstance.update(oldToken: token, newToken: "\(httpStatus.allHeaderFields["Authorization"]!)")
            } else {
                print("token is", token)
            }
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .iso8601
            if let data = data {
                do {
                    let cancelorder = try decoder.decode(CancelOrderCodable.self, from: data)
                    if cancelorder.success == true {
                        DispatchQueue.main.async {
                            MessageAlert.Instance.message(message: cancelorder.message)
                            OrderDetailController.navigationController?.popViewController(animated: true)
                            OrderDetailController.tabBarController?.selectedIndex = 0
                        }
                    } else {
                        DispatchQueue.main.async {
                            MessageAlert.Instance.message(message: cancelorder.message)
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
