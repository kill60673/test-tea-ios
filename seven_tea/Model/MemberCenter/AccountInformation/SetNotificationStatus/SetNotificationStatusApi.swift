//
//  SetNotifiStatusApi.swift
//  seven_tea
//
//  Created by harrison on 2020/6/11.
//  Copyright © 2020 harrison公司機. All rights reserved.
//

import Foundation
import UIKit
class SetNotificationStatusApi: NSObject {
    static let SetNotificationStatusApiInstance = SetNotificationStatusApi()
    var newToken = ""
    //將資料放進object的func
    // 登入用API
    func setnotificationstatus(token: String,handler : @escaping (Bool) -> Void) {
        let url = URL(string: ApiUrl.ApiUrlInstance.setnotificationstatus)!
        var request = URLRequest(url: url)
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue(token, forHTTPHeaderField: "Authorization")
        request.httpMethod = "POST"
        request.httpBody = datas
        let task = URLSession.shared.dataTask(with: request) {
            data, response, _ in
            let httpStatus = response as! HTTPURLResponse
            if httpStatus.allHeaderFields["Authorization"] != nil {
                self.newToken = "\(httpStatus.allHeaderFields["Authorization"]!)"
                UserInfo.UserInfoInstance.update(oldToken: token, newToken: "\(httpStatus.allHeaderFields["Authorization"]!)")
            } else {
                print("token is", token)
            }
            let responseString = String(data: data!, encoding: .utf8)
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .iso8601
            if let data = data {
                do {
                    let setnotificationstatus = try decoder.decode(SetNotificationStatusCodable.self, from: data)
                    if setnotificationstatus.success == true {
                        DispatchQueue.main.async {
                            MessageAlert.Instance.message(message: setnotificationstatus.message)
                            handler(true)
                        }
                    } else {
                        DispatchQueue.main.async {
                            print(setnotificationstatus.data)
                            MessageAlert.Instance.message(message: setnotificationstatus.message)
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
