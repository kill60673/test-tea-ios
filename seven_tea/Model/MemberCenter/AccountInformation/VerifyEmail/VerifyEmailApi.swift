//
//  VerifyEmailApi.swift
//  seven_tea
//
//  Created by harrison on 2020/4/21.
//  Copyright © 2020 harrison公司機. All rights reserved.
//

import Foundation
class VerifyEmailApi: NSObject {
    static let VerifyEmailInstance = VerifyEmailApi()
    var newToken: String!
    func verifyEmailApi(token: String, handler : @escaping (Bool) -> Void) {
        let url = URL(string: ApiUrl.ApiUrlInstance.verifyemail)!
        var request = URLRequest(url: url)
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue(token, forHTTPHeaderField: "Authorization")
        request.httpMethod = "POST"
        let postString = datas
        request.httpBody = postString
        let task = URLSession.shared.dataTask(with: request) {
            data, response, _ in
            let httpStatus = response as? HTTPURLResponse
            if httpStatus!.allHeaderFields["Authorization"] as? String ?? "" != "" {
                self.newToken = httpStatus!.allHeaderFields["Authorization"] as? String ?? ""
                UserInfo.UserInfoInstance.update(oldToken: token, newToken: httpStatus!.allHeaderFields["Authorization"] as? String ?? "")
            } else {
                self.newToken = ""
            }

            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .iso8601
            if let data = data, let verifyEmail = try?
                decoder.decode(VerifyEmailCodable.self, from: data) {
                if verifyEmail.success == true {
                    //主線程
                    DispatchQueue.main.async {
                        MessageAlert.Instance.message(message: "\(verifyEmail.message)")
                    }
                } else {
                    //主線程
                    DispatchQueue.main.async {
                        MessageAlert.Instance.message(message: "\(verifyEmail.message)")
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
