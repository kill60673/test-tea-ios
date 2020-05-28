//
//  MemberNewOrderApi.swift
//  seven_tea
//
//  Created by harrison on 2020/5/28.
//  Copyright © 2020 harrison公司機. All rights reserved.
//

import Foundation
import UIKit
import SwiftyJSON
class MemberNewOrderApi {
    var memberitemaddlist = [MemberItemAdd]()
    var urlString = ""
    var memberorderitem = [MemberOrderItem]()
    var memberneworder = [MemberNewOrder]()
    var newToken = ""
    static let MemberNewOrderApiInstance = MemberNewOrderApi()
    func getmemberorderitem(token: String) {
        urlString = ApiUrl.ApiUrlInstance.getmemberneworder
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
                    self.memberitemaddlist.removeAll()
                    self.memberorderitem.removeAll()
                    self.memberneworder.removeAll()
                    for i in 0..<json["data"].count {
                        let data = json["data"][i]
                        for item in 0..<data["item"].count {
                            let itemdata = data["item"][i]
                            for add in 0..<itemdata["add"].count{
                                let add = MemberItemAdd(id: itemdata["add"][add]["id"].int!, name: itemdata["add"][add]["name"].string!)
                                self.memberitemaddlist.append(add)
                            }
                            let memberorderitem = MemberOrderItem(id: data["item"][item]["id"].string!, qty:  data["item"][item]["qty"].int!, tmp:  data["item"][item]["tmp"].string!, size:  data["item"][item]["size"].string!, price:  data["item"][item]["price"].int!, sugar:  data["item"][item]["sugar"].string!, item_id:  data["item"][item]["item_id"].int!, item_name:  data["item"][item]["item_name"].string!, add: self.memberitemaddlist)
                            self.memberorderitem.append(memberorderitem)
                            print("eeeeee", memberorderitem)
                        }
                        let memberorder = MemberNewOrder(get_method: data["get_method"].string!, order_no: data["order_no"].string!, order_status: data["order_status"].string!, store: data["store"].string!, total_qty: data["total_qty"].int!, total_price: data["total_price"].int!, item: self.memberorderitem)
                        self.memberneworder.append(memberorder)
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
    func getmemberneworder() -> [MemberNewOrder] {
        return self.memberneworder
    }
}
