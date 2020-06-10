//
//  CreateFeedBackApi.swift
//  seven_tea
//
//  Created by harrison on 2020/6/10.
//  Copyright © 2020 harrison公司機. All rights reserved.
//

import Foundation
import UIKit
class CreateFeedBackApi: NSObject {
    static let CreateFeedBackApiInstance = CreateFeedBackApi()
    //將資料放進object的func
    // 登入用API
    func createfeedback(handler : @escaping (Bool) -> Void) {
        let url = URL(string: ApiUrl.ApiUrlInstance.createfeedback)!
        var request = URLRequest(url: url)
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "POST"
        request.httpBody = datas
        let task = URLSession.shared.dataTask(with: request) {
            data, _, _ in
            let responseString = String(data: data!, encoding: .utf8)
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .iso8601
            // 做 do catch 如果任何例外事件 就在catch print出error
            if let data = data {
                do {
                    let createfeedback = try decoder.decode(LoginCodable.self, from: data)
                    if createfeedback.success == true {
                        DispatchQueue.main.async {
                            MessageAlert.Instance.message(message: createfeedback.message)
                            handler(true)
                        }
                    } else {
                        DispatchQueue.main.async {
                            print(createfeedback.data)
                            MessageAlert.Instance.message(message: createfeedback.message)
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
