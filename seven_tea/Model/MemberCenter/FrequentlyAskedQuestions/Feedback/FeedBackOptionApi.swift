//
//  FeedBackOptionApi.swift
//  seven_tea
//
//  Created by harrison on 2020/5/3.
//  Copyright © 2020 harrison公司機. All rights reserved.
//

import Foundation
var feedBackOption = [String]()
class FeedBackOptionApi: NSObject {
    static let CityTagInstance = FeedBackOptionApi()
    lazy var feedbackoptionlist = [FeedBackOption]()
    func feedbackoption() {

        let url = URL(string: ApiUrl.ApiUrlInstance.feedbackoption)!

        var request = URLRequest(url: url)
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        request.httpMethod = "GET"

        let task = URLSession.shared.dataTask(with: request) { data, _, _ in
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .iso8601
            if let data = data, let Info = try?
                decoder.decode(CityTagCodable.self, from: data) {
                if Info.success == true {
                    for result in Info.data {
                        feedBackOption.append(result)
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
        print("我有幾個", feedbackoptionlist.count)
        return feedbackoptionlist.count
    }
}
