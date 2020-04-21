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
class GetStoresApi : NSObject{
    var getstorelist = [GetStore]()
    static let GetStoresApiInstance = GetStoresApi()
    func getstores(city:String,district:String){
        let url = URL(string: ApiUrl.ApiUrlInstance.getstore+"\(city.urlEncoded())/\(district.urlEncoded())")!
        var request = URLRequest(url: url )
        print("url...",url)
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        request.httpMethod = "GET"
        let task = URLSession.shared.dataTask(with: request) {
            data, response, error in
            do {
                let json = try JSON(data: data!)
                if json["success"].bool! == true {
                    self.getstorelist.removeAll()
                    for i in 0..<json["data"].count {
                        let getstores = GetStore(getstore_id: json["data"][i]["id"].int!, storename: json["data"][i]["storename"].string!, address: json["data"][i]["address"].string!, id_open: json["data"][i]["id_open"].bool!, opening_time: json["data"][i]["opening_time"])
                        self.getstorelist.append(getstores)
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
                    print("這邊是錯誤",error)
                }
            }
            //主線程
            DispatchQueue.main.async {
               
            }
            
        }
        task.resume()
    }

}
