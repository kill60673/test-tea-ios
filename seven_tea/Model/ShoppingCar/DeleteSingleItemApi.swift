//
//  DeleteSingleItemApi.swift
//  seven_tea
//
//  Created by harrison on 2020/5/12.
//  Copyright © 2020 harrison公司機. All rights reserved.
//

import Foundation
import UIKit

class DeleteSingleItemApi: NSObject {
    static let DeleteSingleItemInstance = DeleteSingleItemApi()
    var newToken: String!
        func deletesingleitem(token: String, handler : @escaping (Bool) -> Void) {
            let url = URL(string: ApiUrl.ApiUrlInstance.updateitemtozero)!
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
                    print("token", token)
                }
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .iso8601
                if let data = data {
                    do {
                        let deletesingleitem = try decoder.decode(DeleteSingleItemCodable.self, from: data)
                        if deletesingleitem.success == true {
                            DispatchQueue.main.async {
                                handler(true)
                                MessageAlert.Instance.message(message: deletesingleitem.message)
                            }
                        } else {
                            DispatchQueue.main.async {
                                handler(false)
                                MessageAlert.Instance.message(message: deletesingleitem.message)
                            }
                        }
                    } catch {
                    }
                }
            }
            task.resume()
        }
    }
