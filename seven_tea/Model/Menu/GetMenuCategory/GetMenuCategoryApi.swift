//
//  File.swift
//  seven_tea
//
//  Created by harrison on 2020/4/24.
//  Copyright © 2020 harrison公司機. All rights reserved.
//

import Foundation
import UIKit
import SwiftyJSON

class GetMenuCategoryApi: NSObject {
    var getmenucatrgorylist = [GetMenuCategory]()
    var urlString = ""
    var storeID = 0
    static let GetStoresApiInstance = GetMenuCategoryApi()
    func getstores(storeId: Int) {
        urlString = ApiUrl.ApiUrlInstance.getmenucategory+"\(storeId)"
        let url = URL(string: urlString)!
        self.storeID = storeId
        var request = URLRequest(url: url )
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        request.httpMethod = "GET"
        let task = URLSession.shared.dataTask(with: request) {
            data, _, error in
            do {
                let json = try JSON(data: data!)
                if json["success"].bool! == true {
                    self.getmenucatrgorylist.removeAll()
                    for i in 0..<json["data"].count {
                        let getmenucatrgory = GetMenuCategory(id: json["data"][i]["id"].string!, category_name: json["data"][i]["category_name"].string!)
                        self.getmenucatrgorylist.append(getmenucatrgory)
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
                CategoryTableView.reloadData()
            }
        }
        task.resume()
    }
    func getlist() -> [GetMenuCategory] {
        return getmenucatrgorylist
    }
    func getCount() -> Int {
        return getmenucatrgorylist.count
    }
    func getstoreId() -> Int {
      return storeID
    }
}
