//
//  MemberInfoApi.swift
//  seven_tea
//
//  Created by harrison on 2020/3/3.
//  Copyright © 2020 harrison公司機. All rights reserved.
//

import Foundation
import UIKit
class MemberInfoApi: NSObject {
    var newToken: String!
    static let MemberInfoInstance = MemberInfoApi()
    func memberInfo(token: String) {
        print("我有進來")
        let url = URL(string: ApiUrl.ApiUrlInstance.memberInfoUrl)!
        var request = URLRequest(url: url)
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        request.setValue(token, forHTTPHeaderField: "Authorization")
        request.httpMethod = "GET"
        //let postString = "type=\(type)&time=\(time)"
        //request.httpBody = postString.data(using: .utf8)
        let task = URLSession.shared.dataTask(with: request) {
            data, response, _ in
            let httpStatus = response as? HTTPURLResponse
            let responseString: String = String(data: data!, encoding: .utf8) ?? ""
            //檢查Token是否要刷新
            if httpStatus!.allHeaderFields["Authorization"] as? String ?? "" != "" {
                self.newToken = httpStatus!.allHeaderFields["Authorization"] as? String ?? ""
                UserInfo.UserInfoInstance.update(oldToken: token, newToken: httpStatus!.allHeaderFields["Authorization"] as? String ?? "")
            } else {
                self.newToken = ""
            }

            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .iso8601
            if let data = data, let memberInfo = try?
                decoder.decode(MemberInfoCodable.self, from: data) {
                if memberInfo.result == 0 {
                    if self.newToken == "" {
                        print("我有進來這裡")
                        UserInfo.UserInfoInstance.save(token: token, username: (memberInfo.message?.username)!,
                                                       email: (memberInfo.message?.email)!,
                                                       phone: (memberInfo.message?.phone)!,
                                                       name: (memberInfo.message?.name)!,
                                                       point: (memberInfo.message?.point)!,
                                                       address: (memberInfo.message?.address)!)
//                                                       loveAddress: (MemberInfo.message?.loveaddress)!)
                        //  ShopCarInfoAPI.ShopCarInfoInstance.ShopCarInfo(Token: Token)
                    } else {
                        UserInfo.UserInfoInstance.save(token: self.newToken,
                                                       username: (memberInfo.message?.username)!,
                                                       email: (memberInfo.message?.email)!,
                                                       phone: (memberInfo.message?.phone)!,
                                                       name: (memberInfo.message?.name)!,
                                                       point: (memberInfo.message?.point)!,
                                                       address: (memberInfo.message?.address)!)
//                                                       loveAddress: (MemberInfo.message?.loveaddress)!)
//                        //ShopCarInfoAPI.ShopCarInfoInstance.ShopCarInfo(Token: self.NewToken)
                    }
                } else {
//                    MessageAlert.Instance.message(message: "\(String(describing: MemberInfo.message))")
                }
            } else {
                DispatchQueue.main.async {
                MessageAlert.Instance.message(message: "資料解析錯誤")
                }
            }
        }
        task.resume()
    }

}
