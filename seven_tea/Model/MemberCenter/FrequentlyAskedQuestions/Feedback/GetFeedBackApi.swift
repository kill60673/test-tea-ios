//
//  GetFeedBackApi.swift
//  seven_tea
//
//  Created by harrison on 2020/6/3.
//  Copyright © 2020 harrison公司機. All rights reserved.
//

import Foundation
import UIKit
import SwiftyJSON

class GetFeedBackApi {
    var getfeedback = [GetFeedBack]()
    var urlString = ""
    var newToken = ""
    static let GetFeedBackApiInstance = GetFeedBackApi()
    func getfeedback(token: String, reply: Int) {
        urlString = ApiUrl.ApiUrlInstance.getfeedback+"\(reply)"
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
                    DispatchQueue.main.async {
                        self.getfeedback.removeAll()
                        for i in 0..<json["data"].count {
                            let data = json["data"][i]
                            let feedback = GetFeedBack(id: data["id"].int!, update_time: data["update_time"].string!, title: data["title"].string!, content: data["content"].string!, reply: data["reply"].string!, type: data["type"].string!, create_time: data["create_time"].string!)
                            self.getfeedback.append(feedback)
                        }
                        MessageAlert.Instance.message(message: json["message"].string!)
                    }
                } else {
                    //主線程
                    self.getfeedback.removeAll()
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
                if PersonalMessageTableView != nil {
                    print("有近Reload")
                    PersonalMessageTableView.reloadData()
                }
            }
        }
        task.resume()
    }
    func getfeedbacklist() -> [GetFeedBack] {
        print("＝＝／／／\(self.getfeedback)")
        return self.getfeedback
    }
    func getfeedbackcount() -> Int {
        return getfeedback.count
    }
}
