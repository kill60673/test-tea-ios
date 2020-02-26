//
//  ResetPasswordApi.swift
//  seven_tea
//
//  Created by harrison公司機 on 2020/2/6.
//  Copyright © 2020 harrison公司機. All rights reserved.
//

import Foundation
class RestPasswordApi: NSObject {
    static let RestPasswordApiInstance = RestPasswordApi()
    func restPassword(handler : @escaping (Bool) -> Void ) {
        let url = URL(string: ApiUrl.ApiUrlInstance.restPasswordUrl)!
        var request = URLRequest(url: url)
//        request.setValue("application/json", forHTTPHeaderField: "Accept")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "POST"
        let postString = datas
        request.httpBody = postString
        let task = URLSession.shared.dataTask(with: request) {
            data, response, error in
            //let responseString = String(data: data!, encoding: .utf8)
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .iso8601
            if let data = data, let resetPassword = try?
                decoder.decode(RestPasswordCodable.self, from: data) {
                if resetPassword.success == true {
                    //主線程
                    DispatchQueue.main.async {
                        MessageAlert.Instance.message(message: "\(resetPassword.message)")
                        handler(true)
                    }
                } else {
                    //主線程
                    DispatchQueue.main.async {
                        MessageAlert.Instance.message(message: "\(resetPassword.message)")
                        handler(false)
                    }
                }
            } else {
                //主線程
                DispatchQueue.main.async {
                    MessageAlert.Instance.message(message: "資料解析錯誤")
                    handler(false)
                }
            }
        }
        task.resume()
    }
}
