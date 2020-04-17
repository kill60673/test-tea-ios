//
//  MarketingBannerApi.swift
//  seven_tea
//
//  Created by harrison on 2020/4/14.
//  Copyright © 2020 harrison公司機. All rights reserved.
//

import Foundation
var marketingImageUrl = String()
class MarketingBannerAPI: NSObject {
    static let MarketingBannerInstance = MarketingBannerAPI()
    var marketingbannerlist = [MarkeringBanner]()
    func marketingbanner() {

        let url = URL(string: ApiUrl.ApiUrlInstance.marketingBanner )!

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
                decoder.decode(MarketingBannerCodable.self, from: data) {
                if Info.success == true {
                    self.marketingbannerlist.removeAll()
                    for result in Info.data {
                        let marketingBanner = MarkeringBanner(imageType: result.img_type, pictureURL: result.picture_url, linkURL: result.link_url)
                        self.marketingbannerlist.append(marketingBanner)
                        marketingImageUrl.append(result.picture_url)
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
        return marketingbannerlist.count
    }
    func getList() -> [MarkeringBanner] {
        return marketingbannerlist
    }

}
