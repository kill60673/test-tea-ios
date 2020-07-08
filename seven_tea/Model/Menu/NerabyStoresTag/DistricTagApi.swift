//
//  DistricTagApi.swift
//  seven_tea
//
//  Created by harrison on 2020/4/15.
//  Copyright © 2020 harrison公司機. All rights reserved.
//

import Foundation
var districTag = [String]()
class DistricTagAPI: NSObject {
    static let DistricTagInstance = DistricTagAPI()
    var districtaglist = [DistrictTag]()
    func districtag(city: String) {
        let url = URL(string: ApiUrl.ApiUrlInstance.districtTag + "\(city.urlEncoded())")
        var request = URLRequest(url: url!)
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        request.httpMethod = "GET"
        let task = URLSession.shared.dataTask(with: request) { data, response, _ in

            let responseString = String(data: data!, encoding: .utf8)
            let httpStatus = response as? HTTPURLResponse
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .iso8601
            if let data = data, let Info = try?
                decoder.decode(DistrictTagCodable.self, from: data) {
                if Info.success == true {
                    districTag.removeAll()
                    for result in Info.data {
                        districTag.append(result)
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
                //                UIViewController.removeSpinner(spinner: sv as! UIView)

            }
        }
        task.resume()
    }

    func getCount() -> Int {
        print("我有幾個", districtaglist.count)
        return districtaglist.count
    }
    func getList() -> [DistrictTag] {
        return districtaglist
    }
}
