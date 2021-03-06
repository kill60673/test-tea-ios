//
//  CityTagApi.swift
//  seven_tea
//
//  Created by harrison on 2020/4/15.
//  Copyright © 2020 harrison公司機. All rights reserved.
//

import Foundation
var cityTag = [String]()
class CityTagAPI: NSObject {
    static let CityTagInstance = CityTagAPI()
    var citytaglist = [CityTag]()
    func citytag() {
        let url = URL(string: ApiUrl.ApiUrlInstance.cityTag)!
        var request = URLRequest(url: url)
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        request.httpMethod = "GET"
        let task = URLSession.shared.dataTask(with: request) { data, _, _ in
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .iso8601
            if let data = data, let Info = try?
                decoder.decode(CityTagCodable.self, from: data) {
                if Info.success == true {
                    self.citytaglist.removeAll()
                    for result in Info.data {
                        cityTag.append(result)
                    }
                } else {
                    //主線程
                    DispatchQueue.main.async {
                        MessageAlert.Instance.message(message: "\(Info.message)")
                    }
                }
            } else {
                //主線程
                DispatchQueue.main.async {
                    MessageAlert.Instance.message(message: "資料解析錯誤")
                }
            }
            //主線程
            DispatchQueue.main.async {
            }
        }
        task.resume()
    }

    func getCount() -> Int {
        print("我有幾個citytag", citytaglist.count)
        return citytaglist.count
    }
    func getList() -> [CityTag] {
        return citytaglist
    }
}
