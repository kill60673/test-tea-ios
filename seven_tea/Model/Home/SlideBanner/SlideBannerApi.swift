//
//  SlideBannerApi.swift
//  seven_tea
//
//  Created by harrison on 2020/4/14.
//  Copyright © 2020 harrison公司機. All rights reserved.
//

import Foundation
import SwiftyJSON
var  SDPicture = [String]()
class SlideBannerAPI: NSObject {
    static let SlideBannerInstance = SlideBannerAPI()
    var slidebannerlist = [SlideBanner]()
    func slidebanner() {
        let url = URL(string: ApiUrl.ApiUrlInstance.slideBanner )!
        print("我一直找不到欸")
        print("ㄎㄎbnsl", url, "ㄎㄎbnsl")
        var request = URLRequest(url: url)
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        request.httpMethod = "GET"
        let task = URLSession.shared.dataTask(with: request) {
            data, response, _ in
            let httpStatus = response as! HTTPURLResponse
            do {
                let json = try JSON(data: data!)
                if json["success"].bool! == true {
                    self.slidebannerlist.removeAll()
                    for i in 0..<json["data"].count {
                        let slidebanner = SlideBanner(imageType: json["data"][i]["img_type"].string!, pictureURL: json["data"][i]["picture_url"].string!, linkURL: json["data"][i]["link_url"].string!)
                        self.slidebannerlist.append(slidebanner)
                    }
                } else {
                    print("我有進來4")
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
                SlideBannerTable.reloadData()
            }
        }
        task.resume()
    }
    func getCount() -> Int {
        return slidebannerlist.count
    }
    func getList() -> [SlideBanner] {
        return slidebannerlist
    }

}
