//
//  GetStoreApi.swift
//  seven_tea
//
//  Created by harrison on 2020/4/17.
//  Copyright © 2020 harrison公司機. All rights reserved.
//

import Foundation
import SwiftyJSON
class GetStoreAPI: NSObject {
    static let GetStoreInstance = GetStoreAPI()
    var getstorelist = [GetStore]()
    var sad = [OpeningTime]()
    func getstore(city: String, district: String) {

        let url = URL(string: ApiUrl.ApiUrlInstance.getstore+"/\(city.urlEncoded())/\(district.urlEncoded())")!
        var request = URLRequest(url: url)
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        request.httpMethod = "GET"

        let task = URLSession.shared.dataTask(with: request) { data, response, _ in

            _ = String(data: data!, encoding: .utf8)
            _ = response as? HTTPURLResponse

            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .iso8601
            if let data = data {
                do {
                    let getstore = try decoder.decode(GetStoreCodable.self, from: data)
                    if getstore.success == true {
                        DispatchQueue.main.async {
                            print("456")
                            MessageAlert.Instance.message(message: getstore.message)
                        }
                    } else {
                        DispatchQueue.main.async {
                            print("123")
                            print(getstore.data)
                            MessageAlert.Instance.message(message: getstore.message)
                        }
                    }
                } catch {
                    print(error)
                }
            }
            //            if let data = data, let Info = try?
            //                decoder.decode(GetStoreCodable.data.self, from: data) {
            //                if Info.id_open == true {
            //                    self.getstorelist.removeAll()
            //                    for result in Info.opening_time {
            //                        let ddd = OpeningTime(date: result.date, end_time: result.end_time, star_time: result.start_time)
            //                        self.sad.append(ddd)
            //                        print("我有近這裡")
            //                        print("這裡有這幾個", result)
            //                    }
            //                } else {
            //                    //主線程
            //                    DispatchQueue.main.async {
            ////                        MessageAlert.Instance.message(message: "\(Info.message)")
            //                    }
            //                }
            //            } else {
            //                //主線程
            //                DispatchQueue.main.async {
            //                    MessageAlert.Instance.message(message: "資料解析錯誤")
            //                }
            //            }
            //            //主線程
            //            DispatchQueue.main.async {
            //                //              UIViewController.removeSpinner(spinner: sv as! UIView)
            //                SlideBannerTable.reloadData()
            //            }
        }
        task.resume()
    }

    func getCount() -> Int {
        print("我有幾個slideList", getstorelist.count)
        return getstorelist.count
    }
}
