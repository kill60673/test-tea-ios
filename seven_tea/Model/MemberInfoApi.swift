//
//  MemberInfoApi.swift
//  seven_tea
//
//  Created by harrison on 2020/3/3.
//  Copyright © 2020 harrison公司機. All rights reserved.
//

import Foundation
import UIKit
import SwiftyJSON
class MemberInfoApi: NSObject {
    var newToken = ""
    var picture_url = ""
    var username = ""
    var name = ""
    var gender =  ""
    var email = ""
    var phone =  ""
    var email_validated = 0
    var address = [MemberInfoAddress]()
    static let MemberInfoInstance = MemberInfoApi()
    func memberInfo(token: String) {
        let url = URL(string: ApiUrl.ApiUrlInstance.memberInfoUrl)!
        var request = URLRequest(url: url)
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        request.setValue(token, forHTTPHeaderField: "Authorization")
        request.httpMethod = "GET"
        let task = URLSession.shared.dataTask(with: request) {
            data, response, error in
            let httpStatus = response as! HTTPURLResponse
            if httpStatus.allHeaderFields["Authorization"] != nil {
                UserInfo.UserInfoInstance.update(oldToken: token, newToken: "\(httpStatus.allHeaderFields["Authorization"])")
            } else {
                print("token is ", token)
            }
            do {
                let json = try JSON(data: data!)
                if json["success"].bool! == true {
                    self.picture_url.removeAll()
                    self.username.removeAll()
                    self.name.removeAll()
                    self.gender.removeAll()
                    self.email.removeAll()
                    self.phone.removeAll()
                    self.address.removeAll()
                    for i in 0..<json["data"].count {
                        let data = json["data"][i]
                        for address in 0..<data["address"].count {
                            let address1 = MemberInfoAddress(id: data["address"][address]["id"].string!, zipcode: data["address"][address]["zipcode"].string!, city: data["address"][address]["city"].string!, district: data["address"][address]["district"].string!, address: data["address"][address]["address"].string!)
                            self.address.append(address1)
                        }
                        self.picture_url = data["picture_url"].string!
                        self.username = data["username"].string!
                        self.name = data["name"].string!
                        self.gender = data["gender"].string!
                        self.phone = data["phone"].string!
                        self.email = data["email"].string!
                        self.email_validated = data["email_validated"].int!
                        print("email is ", self.email)
                    }
                    if self.newToken == "" {
                        UserInfo.UserInfoInstance.save(token: token,
                                                       picture_url: self.picture_url,
                                                       username: self.username,
                                                       name: self.name,
                                                       gender: self.gender,
                                                       email_validated: self.email_validated,
                                                       email: self.email,
                                                       phone: self.phone)

                    } else {
                        UserInfo.UserInfoInstance.save(token: self.newToken,
                                                       picture_url: self.picture_url,
                                                       username: self.username,
                                                       name: self.name,
                                                       gender: self.gender,
                                                       email_validated: self.email_validated,
                                                       email: self.email,
                                                       phone: self.phone)
                    }
                } else {
                    //主線程
                    DispatchQueue.main.async {
                        print("這裡是false", json["success"].bool!)
                        print("這裡是錯誤訊息", json["message"].string!)
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
}
