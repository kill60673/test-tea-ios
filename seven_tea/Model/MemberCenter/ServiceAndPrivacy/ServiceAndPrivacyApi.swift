//
//  ServiceAndPrivacyApi.swift
//  seven_tea
//
//  Created by harrison on 2020/6/12.
//  Copyright © 2020 harrison公司機. All rights reserved.
//

import Foundation
import UIKit
import SwiftyJSON

class ServiceAndPrivacyApi {
    var urlString = ""
    var newToken = ""
    var content = ""
    static let ServiceAndPrivacyApiInstance = ServiceAndPrivacyApi()
    func getfeedback(token: String, reply: Int) {
        urlString = ApiUrl.ApiUrlInstance.privacyandpolicy
        let url = URL(string: urlString)!
        var request = URLRequest(url: url )
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        request.setValue(token, forHTTPHeaderField: "Authorization")
        request.httpMethod = "GET"
        let task = URLSession.shared.dataTask(with: request) {
            data, response, error in
            let httpStatus = response as! HTTPURLResponse
            if httpStatus.allHeaderFields["Authorization"] != nil {
                self.newToken = "\(httpStatus.allHeaderFields["Authorization"]!)"
                UserInfo.UserInfoInstance.update(oldToken: token, newToken: "\(httpStatus.allHeaderFields["Authorization"]!)")
            } else {
                print("token is", token)
                print("我有進來3")
            }
            do {
                let json = try JSON(data: data!)
                if json["success"].bool! == true {
                    DispatchQueue.main.async {
                        self.content = json["data"]["content"].string!
                        MessageAlert.Instance.message(message: json["message"].string!)
                    }
                } else {
                    //主線程
                    DispatchQueue.main.async {
                        MessageAlert.Instance.message(message: json["message"].string!)
                    }
                }
                
            } catch {
                //主線程
                DispatchQueue.main.async {
                    MessageAlert.Instance.message(message: "資料解析錯誤")
                    print("這邊是錯誤", error)
                }
            }
            //主線程
            DispatchQueue.main.async {
            }
        }
        task.resume()
    }
    func getcontent() -> String {
        return self.content
    }
}
