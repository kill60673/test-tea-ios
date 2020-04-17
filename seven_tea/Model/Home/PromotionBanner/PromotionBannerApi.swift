//
//  PromotionBannerApi.swift
//  seven_tea
//
//  Created by harrison on 2020/4/14.
//  Copyright © 2020 harrison公司機. All rights reserved.
//

import Foundation
class PromotionBannerAPI: NSObject {
    static let PromotionBannerInstance = PromotionBannerAPI()
    lazy var promotionbannerlist = [PromotionBanner]()
    func promotionbanner() {

        let url = URL(string: ApiUrl.ApiUrlInstance.promotionBanner )!

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
                decoder.decode(PromotionBannerCodable.self, from: data) {
                if Info.success == true {
                    self.promotionbannerlist.removeAll()
                    for result in Info.data {
                        let promotionBanner = PromotionBanner(pictureURL: (result.picture_url)!)
                        self.promotionbannerlist.append(promotionBanner)
                        print("我有近這裡promotion")
                        print("這裡有這幾個promotion", result.picture_url)
                    }
                } else {
                    //主線程
                    DispatchQueue.main.async {
                        MessageAlert.Instance.message(message: "\(Info.message)")
                        print("沒來")
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
                PromotionBannerTable.reloadData()
            }
        }
        task.resume()
    }

    func getCount() -> Int {
        print("我有幾個promotionbannerList", promotionbannerlist.count)
        return promotionbannerlist.count
    }
    func getList() -> [PromotionBanner] {
        return promotionbannerlist
    }
    //    func getImageURL() -> String{
    //    }

}
