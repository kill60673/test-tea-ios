//
//  GetStoresApi.swift
//  seven_tea
//
//  Created by harrison on 2020/4/21.
//  Copyright © 2020 harrison公司機. All rights reserved.
//

import Foundation
import UIKit
import SwiftyJSON

class GetStoresApi: NSObject {
    var getstorelist = [GetStore]()
    var urlString = ""
    static let GetStoresApiInstance = GetStoresApi()
    func getstores(city: String, district: String) {

        if city == "" {
            urlString = ApiUrl.ApiUrlInstance.getstore
        } else {
            urlString = ApiUrl.ApiUrlInstance.getstore+"\(city.urlEncoded())/\(district.urlEncoded())"
        }
        let url = URL(string: urlString)!
        var request = URLRequest(url: url )
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        request.httpMethod = "GET"
        let task = URLSession.shared.dataTask(with: request) {
            data, _, error in
            do {
                let json = try JSON(data: data!)
                if json["success"].bool! == true {
                    self.getstorelist.removeAll()
                    for i in 0..<json["data"].count {
                        //把openingTime的東西 拉出來額外存 直接使用
                        //getstoreslist裡面直接存原本那些東西
                        let getstores = GetStore(getstore_id: json["data"][i]["id"].int!, tel: json["data"][i]["tel"].string!, storename: json["data"][i]["storename"].string!, address: json["data"][i]["address"].string!, is_open: json["data"][i]["is_open"].bool!, open_time_date: json["data"][i]["opening_time"][0]["date"].string!, end_time: json["data"][i]["opening_time"][0]["end_time"].string!, start_time: json["data"][i]["opening_time"][0]["start_time"].string!)
                        self.getstorelist.append(getstores)
                    }
                    print(self.getstorelist.count)

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
                    NearByStoresTableView.reloadData()
                }
            }
        }
        task.resume()
    }
    func getlist() -> [GetStore] {
        return getstorelist
    }
    func getCount() -> Int {
        return getstorelist.count
    }

}
