//
//  ForgerPassword.swift
//  seven_tea
//
//  Created by harrison公司機 on 2020/2/6.
//  Copyright © 2020 harrison公司機. All rights reserved.
//

import Foundation
import UIKit
class ForgotPasswordSmsAPI: NSObject {
    static let ForgotPasswordSmsInstance = ForgotPasswordSmsAPI()

    func forgotPasswordSms(handler : @escaping (Bool) -> Void) {
        let url = URL(string: ApiUrl.ApiUrlInstance.forgotPasswordSmsUrl)!
        var request = URLRequest(url: url)
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "POST"
        let postString = datas
        request.httpBody = postString
        let task = URLSession.shared.dataTask(with: request) {
            data, response, error in
            //let responseString = String(data: data!, encoding: .utf8)
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .iso8601
            if let data = data, let sms = try?
                decoder.decode(ForgotPasswordSmsCodable.self, from: data) {
                if sms.success == true {
                    //主線程
                    DispatchQueue.main.async {
                        MessageAlert.Instance.message(message: "\(sms.message)")
                        handler(true)
                    }
                } else {
                    //主線程
                    DispatchQueue.main.async {
                        MessageAlert.Instance.message(message: "\(sms.message)")
                        handler(false)
                    }
                }
            } else {
                //主線程
                DispatchQueue.main.async {
                        MessageAlert.Instance.message(message: "資料解析錯誤")
                }
            }
        }
        task.resume()
    }
}
