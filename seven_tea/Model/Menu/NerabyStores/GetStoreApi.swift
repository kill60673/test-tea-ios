//
//  GetStoreApi.swift
//  seven_tea
//
//  Created by harrison on 2020/4/17.
//  Copyright © 2020 harrison公司機. All rights reserved.
//

import Foundation

class GetStoreAPI: NSObject {
    static let GetStoreInstance = GetStoreAPI()
    var getstorelist = [GetStore]()
    var sad = [OpeningTime]()
    func getstore() {
        
        let url = URL(string: ApiUrl.ApiUrlInstance.getstore)!
        
        var request = URLRequest(url: url)
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        request.httpMethod = "GET"
        
        let task = URLSession.shared.dataTask(with: request) { data, response, _ in
            
            let responseString = String(data: data!, encoding: .utf8)
            let httpStatus = response as? HTTPURLResponse
            
            //            print(responseString)
            
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .iso8601
            if let data = data, let Info = try?
                decoder.decode(GetStoreCodable.self, from: data) {
                if Info.success == true {
                    self.getstorelist.removeAll()
                    for result in Info.data {
                        let getstore = GetStore(getstore_id: result.id, storename: result.storename, address: result.address, id_open: result.id_open, opening_timer: self.sad)
                        self.getstorelist.append(getstore)
                        //                        sad.append(result.opening_time)
                        print("我有近這裡")
                        print("這裡有這幾個", result)
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
            if let data = data, let Info = try?
                decoder.decode(GetStoreCodable.data.self, from: data) {
                if Info.id_open == true {
                    self.getstorelist.removeAll()
                    for result in Info.opening_time {
                        let ddd = OpeningTime(date: result.date, end_time: result.end_time, star_time: result.start_time)
                        self.sad.append(ddd)
                        print("我有近這裡")
                        print("這裡有這幾個", result)
                    }
                } else {
                    //主線程
                    DispatchQueue.main.async {
//                        MessageAlert.Instance.message(message: "\(Info.message)")
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
                //              UIViewController.removeSpinner(spinner: sv as! UIView)
                SlideBannerTable.reloadData()
            }
        }
        task.resume()
    }
    
    func getCount() -> Int {
        print("我有幾個slideList", getstorelist.count)
        return getstorelist.count
    }
    //    func getList() -> [SlideBanner] {
    //        return slidebannerlist
    //    }
    
}
