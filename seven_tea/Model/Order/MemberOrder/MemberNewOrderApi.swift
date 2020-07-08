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
    var memberorderitem = [MemberOrderItem]()
    var memberneworder = [MemberNewOrder]()
    var itemnamelist = [String]()
    var urlString = ""
    var newToken = ""
    static let MemberNewOrderApiInstance = MemberNewOrderApi()
    func getmemberorderitem(token: String, selectStatus: Int) {
        switch selectStatus {
        case  0:
            urlString = ApiUrl.ApiUrlInstance.getmemberneworder
            break
        case  1:
            urlString = ApiUrl.ApiUrlInstance.getmemberconfirmorder
            break
        case 2:
            urlString = ApiUrl.ApiUrlInstance.getmemberindeliveryorder
            break
        case 3:
            urlString = ApiUrl.ApiUrlInstance.getmembercompleteorder
            break
        default:
            urlString = ApiUrl.ApiUrlInstance.getmembercancelorder
            break
        }
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
            }
            do {
                let json = try JSON(data: data!)
                if json["success"].bool! == true {
                    self.memberitemaddlist.removeAll()
                    self.memberorderitem.removeAll()
                    self.memberneworder.removeAll()
                    for i in 0..<json["data"].count {
                        let data = json["data"][i]
                        for item in 0..<data["item"].count {
                            let itemdata = data["item"][item]
                            for add in 0..<itemdata["add"].count {
                                let add = MemberItemAdd(id: itemdata["add"][add]["id"].int!, name: itemdata["add"][add]["name"].string!)
                                self.memberitemaddlist.append(add)
                            }
                            let memberorderitem = MemberOrderItem(id: data["item"][item]["id"].int!, qty: data["item"][item]["qty"].int!, tmp: data["item"][item]["tmp"].string!, size: data["item"][item]["size"].string!, price: data["item"][item]["price"].int!, sugar: data["item"][item]["sugar"].string!, item_id: data["item"][item]["item_id"].int!, item_name: data["item"][item]["item_name"].string!, add: self.memberitemaddlist)
                            self.memberorderitem.append(memberorderitem)
                            let name = data["item"][item]["item_name"].string!
                            self.itemnamelist.append(name)
                        }
                        let memberorder = MemberNewOrder(get_method: data["get_method"].string!, order_no: data["order_no"].string!, order_status: data["order_status"].string!, store: data["store"].string!, total_qty: data["total_qty"].int!, total_price: data["total_price"].int!, item: self.memberorderitem, itemname: self.itemnamelist)
                        self.memberneworder.append(memberorder)
                        self.itemnamelist.removeAll()
                    }
                } else {
                    //主線程
                    self.memberneworder.removeAll()
                    DispatchQueue.main.async {
//                        MessageAlert.Instance.message(message: json["message"].string!)
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
                if OrderTableView != nil {
                    OrderTableView.reloadData()
                }
            }
        }
        task.resume()
    }
    func getmemberneworder() -> [MemberNewOrder] {
        return self.memberneworder
    }
    func getordercount() -> Int {
        return self.memberneworder.count
    }
}
