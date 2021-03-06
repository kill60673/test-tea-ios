//
//  SetVerifyEmail.swift
//  seven_tea
//
//  Created by harrison on 2020/5/3.
//  Copyright © 2020 harrison公司機. All rights reserved.
//

import Foundation
import Foundation
class SendSetVerifyEmailApi: NSObject {
    static let SetVerifyEmailInstance = SendSetVerifyEmailApi()
    var newToken: String!
    func setverifyEmailApi(token: String, handler : @escaping (Bool) -> Void) {
        let url = URL(string: ApiUrl.ApiUrlInstance.setverifyemail)!
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
            }
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .iso8601
            if let data = data, let SendSetVerifyEmail = try?
                decoder.decode(SendSetVerifyEmailCodable.self, from: data) {
                if SendSetVerifyEmail.success == true {
                    //主線程
                    DispatchQueue.main.async {
                        MessageAlert.Instance.message(message: "\(SendSetVerifyEmail.message)")
                    }
                } else {
                    //主線程
                    DispatchQueue.main.async {
                        MessageAlert.Instance.message(message: "\(SendSetVerifyEmail.message)")
                    }
                }
            } else {
                //主線程
                DispatchQueue.main.async {
                }
            }
        }
        task.resume()
    }
}
