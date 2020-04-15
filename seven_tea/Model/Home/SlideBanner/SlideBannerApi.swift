//
//  SlideBannerApi.swift
//  seven_tea
//
//  Created by harrison on 2020/4/14.
//  Copyright © 2020 harrison公司機. All rights reserved.
//

import Foundation
class SlideBannerAPI: NSObject {
    static let SlideBannerInstance = SlideBannerAPI()
    var slidebannerlist = [SlideBanner]()
    func slidebanner() {

        let url = URL(string: ApiUrl.ApiUrlInstance.slideBanner )!

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
                decoder.decode(SlideBannerCodable.self, from: data) {
                if Info.success == true {
                    self.slidebannerlist.removeAll()
                    for result in Info.data {
                        let slideBanner = SlideBanner(imageType: result.img_type, pictureURL: result.picture_url, linkURL: result.link_url)
                        self.slidebannerlist.append(slideBanner)
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
//              UIViewController.removeSpinner(spinner: sv as! UIView)
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
