//
//  GpsGetStoresApi.swift
//  seven_tea
//
//  Created by harrison on 2020/4/24.
//  Copyright © 2020 harrison公司機. All rights reserved.
//

import Foundation
import UIKit
import SwiftyJSON

class GpsGetStoresApi: NSObject {
    var getgpsstorelist = [GetStore]()
    var urlString = ""
    static let GpsGetStoresApiInstance = GpsGetStoresApi()
    func gpsgetstores(latitude: Double, longitude: Double) {

        if latitude == 0.0 {
            urlString = ApiUrl.ApiUrlInstance.gpsgetstore
        } else {
            urlString = ApiUrl.ApiUrlInstance.gpsgetstore+"\(latitude)/\(longitude)"
        }
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
                    self.getgpsstorelist.removeAll()
                    for i in 0..<json["data"].count {
                        //把openingTime的東西 拉出來額外存 直接使用
                        //getstoreslist裡面直接存原本那些東西
                        let getgpsstores = GetStore(getstore_id: json["data"][0]["id"].int!, tel: json["data"][0]["tel"].string!, storename: json["data"][0]["storename"].string!, address: json["data"][0]["address"].string!, is_open: json["data"][0]["is_open"].bool!, open_time_date: json["data"][0]["opening_time"][0]["date"].string!, end_time: json["data"][0]["opening_time"][0]["end_time"].string!, start_time: json["data"][0]["opening_time"][0]["start_time"].string!)
                        self.getgpsstorelist.append(getgpsstores)
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
                    print("我有進來這裡")
                    NearByStoresTableView.reloadData()
                }
            }
        }
        task.resume()
    }
    func getgpslist() -> [GetStore] {
        return getgpsstorelist
    }
    func getgpscount() -> Int {
        return getgpsstorelist.count
    }

}
