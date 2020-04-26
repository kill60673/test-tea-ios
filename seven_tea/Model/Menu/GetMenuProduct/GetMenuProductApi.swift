//
//  GetMenuProductApi.swift
//  seven_tea
//
//  Created by harrison on 2020/4/25.
//  Copyright © 2020 harrison公司機. All rights reserved.
//

import Foundation
import UIKit
import SwiftyJSON

class GetMenuProductApi: NSObject {
    var getmenuproduct = [GetMenuProduct]()
    var urlString = ""
    static let GetStoresApiInstance = GetMenuProductApi()
    func getstores(storeId: Int, catrgoryId: Int) {
        urlString = ApiUrl.ApiUrlInstance.getmenuproduct+"\(storeId)/\(catrgoryId)"
        let url = URL(string: urlString)!
        print(url)
        var request = URLRequest(url: url )
        print("url...", url)
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        request.httpMethod = "GET"
        let task = URLSession.shared.dataTask(with: request) {
            data, _, error in
            do {
                let json = try JSON(data: data!)
                if json["success"].bool! == true {
                    self.getmenuproduct.removeAll()
                    for i in 0..<json["data"].count {
                        //把openingTime的東西 拉出來額外存 直接使用
                        //getstoreslist裡面直接存原本那些東西
                        print(json["data"][i][])
                        print("haha",json["data"][i]["size"][i]["id"].int!)
                        let getmenuproduct = GetMenuProduct(id: json["data"][i]["id"].string!, item_name: json["data"][i]["item_name"].string!, size_id: json["data"][i]["size"][i]["id"].int!, size_name: json["data"][i]["size"][i]["name"].string!, price_size: json["data"][i]["price"][i]["size"].string!, price_temp: json["data"][i]["price"][i]["temp"].string!, product_price: json["data"][i]["price"][i]["price"].string!, temp_name: json["data"][i]["temp"][i]["name"].string!, temp_is_active: json["data"][i]["temp"][i]["is_active"].bool!, sugar_name: json["data"][i]["sugar"][i]["name"].string!, sugar_is_active: json["data"][i]["sugar"][i]["is_active"].bool!, add_id: json["data"][i]["add"][i]["id"].int!, add_name: json["data"][i]["add"][i]["name"].string!)
                        print("yoyoyoyo",getmenuproduct.size)
                        self.getmenuproduct.append(getmenuproduct)
                    }
                    print(self.getmenuproduct.count)

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
                    print("我有進來這裡")
                    NearByStoresTableView.reloadData()
                }
            }
        }
        task.resume()
    }
    func getlist() -> [GetMenuProduct] {
        return getmenuproduct
    }
    func getCount() -> Int {
        return getmenuproduct.count
    }

}
