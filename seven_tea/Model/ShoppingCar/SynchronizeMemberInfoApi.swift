//
//  SynchronizeMemberInfoApi.swift
//  seven_tea
//
//  Created by harrison on 2020/5/18.
//  Copyright © 2020 harrison公司機. All rights reserved.
//

import Foundation
import UIKit
import SwiftyJSON

class SycchronizeMemberInfoApi {
    var urlString = ""
    var newToken = ""
    var memberinfo = [SynchronizeMemberInfo]()
    var address = [SynchronizeMemberAddress]()
    static let SycchronizeMemberInfoApiInstance = SycchronizeMemberInfoApi()
    func getmemberinfo(token: String) {
        urlString = ApiUrl.ApiUrlInstance.synchornizememberinfo
        let url = URL(string: urlString)!
        var request = URLRequest(url: url )
        print("ㄎㄎ", token)
        print("url...", url)
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        request.setValue(token, forHTTPHeaderField: "Authorization")
        request.httpMethod = "GET"
        let task = URLSession.shared.dataTask(with: request) {
            data, response, error in
            let httpStatus = response as! HTTPURLResponse
            print("為什麼9991", httpStatus.allHeaderFields["Authorization"])
            if httpStatus.allHeaderFields["Authorization"] != nil {
                print("我有進來2")
                self.newToken = "\(httpStatus.allHeaderFields["Authorization"]!)"
                UserInfo.UserInfoInstance.update(oldToken: token, newToken: "\(httpStatus.allHeaderFields["Authorization"]!)")
            } else {
                print("tokennnnn", token)
                print("我有進來3")
            }
            do {
                let json = try JSON(data: data!)
                print("reeeeeeee", json["success"].bool!)
                if json["success"].bool! == true {
                    self.address.removeAll()
                    self.memberinfo.removeAll()
                    print(json["data"][0]["id"].int!)
                    for i in 0..<json["data"].count {
                        let data = json["data"][i]
                        for address in 0..<data["address"].count {
                            let memberaddress = SynchronizeMemberAddress(id: data["address"][address]["id"].string!, zipcode: data["address"][address]["zipcode"].string!, city: data["address"][address]["city"].string!, district: data["address"][address]["district"].string!, address: data["address"][address]["address"].string!)
                            self.address.append(memberaddress)
                            print("eeeeee", memberaddress)
                        }

                        print(data["name"].string!)
                        print(data["phone"].string!)
                        let getmenuproduct = SynchronizeMemberInfo(id: data["id"].int!, name: data["name"].string!, phone: data["phone"].string!)

                        self.memberinfo.append(getmenuproduct)
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
    func getmemberaddress() -> [SynchronizeMemberAddress] {
        return address
    }
    func getmemberinfo() -> [SynchronizeMemberInfo] {
        return memberinfo
    }
}
