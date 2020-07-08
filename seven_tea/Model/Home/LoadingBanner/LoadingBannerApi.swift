//
//  LoadingBannerApi.swift
//  seven_tea
//
//  Created by harrison on 2020/4/14.
//  Copyright © 2020 harrison公司機. All rights reserved.
//

import Foundation
import SwiftyJSON
class LoadingBannerAPI: NSObject {
    static let LoadingBannerInstance = LoadingBannerAPI()
    var loadingbannerlist = [LoadingBanner]()
    func loadingbanner() {
        let url = URL(string: ApiUrl.ApiUrlInstance.loadingBanner )!
        var request = URLRequest(url: url)
            request.setValue("application/json", forHTTPHeaderField: "Accept")
            request.httpMethod = "GET"
            let task = URLSession.shared.dataTask(with: request) {
                data, response, _ in
                let httpStatus = response as! HTTPURLResponse
                do {
                    let json = try JSON(data: data!)
                    if json["success"].bool! == true {
                        self.loadingbannerlist.removeAll()
                        for i in 0..<json["data"].count {
                            let loadingbanner = LoadingBanner(imageType: json["data"][i]["img_type"].string!, pictureURL: json["data"][i]["picture_url"].string!, linkURL: json["data"][i]["link_url"].string ?? "")
                            self.loadingbannerlist.append(loadingbanner)
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
                }
            }
            task.resume()
        }
    func getCount() -> Int {
        return loadingbannerlist.count
    }
    func getList() -> [LoadingBanner] {
        return loadingbannerlist
    }
}
