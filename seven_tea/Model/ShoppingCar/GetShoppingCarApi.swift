//
//  GetShoppingCarApi.swift
//  seven_tea
//
//  Created by harrison on 2020/5/7.
//  Copyright © 2020 harrison公司機. All rights reserved.
//

import Foundation
import SwiftyJSON

class GetShoppingCarApi {
    var getcaritem = [GetShoppingCarItem]()
    var getcardetail = [GetShoppingCarDetail]()
    var add = [String]()
    var urlString = ""
    var newToken = ""
    static let GetShoppingCarInstance = GetShoppingCarApi()
    func getstores(token: String) {
        urlString = ApiUrl.ApiUrlInstance.getshoppingcar
        let url = URL(string: urlString)!
        var request = URLRequest(url: url )
        print("url...", url)
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        request.setValue(token, forHTTPHeaderField: "Authorization")
        request.httpMethod = "GET"
        let task = URLSession.shared.dataTask(with: request) {
            data, response, _ in
            let httpStatus = response as! HTTPURLResponse
            print("為什麼999",httpStatus.allHeaderFields["Authorization"])
            if httpStatus.allHeaderFields["Authorization"] != nil {
                print("我有進來2")
                self.newToken = "\(httpStatus.allHeaderFields["Authorization"]!)"
                UserInfo.UserInfoInstance.update(oldToken: token, newToken: "\(httpStatus.allHeaderFields["Authorization"]!)")
            } else {
                print("tokennnnn",token)
                print("我有進來3")
            }
            do {
                let json = try JSON(data: data!)
                if json["success"].bool! == true {
                    self.getcaritem.removeAll()
                    self.getcardetail.removeAll()
                    print("tolkda", json["data"]["item"].count)
                    for item1 in 0..<json["data"]["item"].count {
                        let item = GetShoppingCarItem(id: json["data"]["item"][item1]["id"].int!, item_id: json["data"]["item"][item1]["item_id"].int!, item_name: json["data"]["item"][item1]["item_name"].string!, size: json["data"]["item"][item1]["size"].string!, sugar: json["data"]["item"][item1]["sugar"].string!, tmp: json["data"]["item"][item1]["tmp"].string!, price: json["data"]["item"][item1]["price"].int!, qty: json["data"]["item"][item1]["qty"].int!)
                        self.getcaritem.append(item)
                        print("有", item.qty)
                        self.add.append( json["data"]["item"][item1]["add"].string ?? "")
                    }
                    for i in 0..<json["data"].count {
                        let getcardetail = GetShoppingCarDetail(store_id: json["data"]["store_id"].int!, store_name: json["data"]["store_name"].string!, totle_price: json["data"]["total_price"].int!, can_delivery: json["data"]["can_delivery"].bool!, gap_to_delivery: json["data"]["gap_to_delivery"].int!)
                        self.getcardetail.append(getcardetail)
                    }
                } else {
                    print("我有進來4")
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
    func getshoppingcardetail() -> [GetShoppingCarDetail] {
        return getcardetail
    }
    func getshoppingcaritem() -> [GetShoppingCarItem] {
        return getcaritem
    }
    func getcaritemcount() -> Int {
        return getcaritem.count
    }
    func getshoppingcaradd() -> [String] {
        return add
    }
}
