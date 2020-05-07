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
            data, response , error in
            let httpStatus = response as? HTTPURLResponse
            if httpStatus!.allHeaderFields["Authorization"] as? String ?? "" != "" {
                self.newToken = httpStatus!.allHeaderFields["Authorization"] as? String ?? ""
                UserInfo.UserInfoInstance.update(oldToken: token, newToken: httpStatus!.allHeaderFields["Authorization"] as? String ?? "")
                print("有進來這裡")
            } else {
                self.newToken = ""
            }
            do {
                let json = try JSON(data: data!)
                if json["success"].bool! == true {
                    self.getcaritem.removeAll()
                    self.getcardetail.removeAll()
                    for i in 0..<json["data"].count {
                        let data = json["data"][i]
                        for item1 in 0..<data["item"].count {
                            let item = GetShoppingCarItem(id: data["item"][item1]["id"].int!, item_id: data["item"][item1]["item_id"].int!, item_name: data["item"][item1]["item_name"].string!, size: data["item"][item1]["size"].string!, sugar: data["item"][item1]["sugar"].string!, tmp: data["item"][item1]["tmp"].string!, price: data["item"][item1]["price"].int!, qty: data["item"][item1]["qty"].int!)
                            self.getcaritem.append(item)
                            self.add.append( data["item"][item1]["add"].string!)
                        }
                        let getcardetail = GetShoppingCarDetail(store_id: data["store_id"].int!, store_name: data["store_name"].string!, totle_price: data["totle_price"].int!, can_delivery: data["can_delivery"].bool!, gap_to_delivery: data["gap_to_delivery"].int!)
                        self.getcardetail.append(getcardetail)
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
                if NearByStoresTableView == nil {
                    
                } else {
                    ItemTableView.reloadData()
                }
            }
        }
        task.resume()
    }
    func getshoppingcardetail() -> [GetShoppingCarDetail] {
        return getcardetail
    }
    func getshoppingcaritem() -> [GetShoppingCarItem]{
        return getcaritem
    }
    func getshoppingcaradd() -> [String]{
        return add
    }
}
