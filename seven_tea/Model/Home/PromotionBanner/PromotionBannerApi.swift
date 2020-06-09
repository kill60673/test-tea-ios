//
//  PromotionBannerApi.swift
//  seven_tea
//
//  Created by harrison on 2020/4/14.
//  Copyright © 2020 harrison公司機. All rights reserved.
//

import Foundation
import SwiftyJSON
class PromotionBannerAPI: NSObject {
    static let PromotionBannerInstance = PromotionBannerAPI()
    lazy var promotionbannerlist = [PromotionBanner]()
    func promotionbanner() {
        let url = URL(string: ApiUrl.ApiUrlInstance.promotionBanner)!
        var request = URLRequest(url: url)
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        request.httpMethod = "GET"
        let task = URLSession.shared.dataTask(with: request) {
            data, response, _ in
            let httpStatus = response as! HTTPURLResponse
            do {
                let json = try JSON(data: data!)
                if json["success"].bool! == true {
                    self.promotionbannerlist.removeAll()
                    for i in 0..<json["data"].count {
                        let promotionBanner = PromotionBanner(pictureURL: json["data"][i]["picture_url"].string!)
                        self.promotionbannerlist.append(promotionBanner)
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
                PromotionBannerTable.reloadData()
            }
        }
        task.resume()
    }
    func getCount() -> Int {
        return promotionbannerlist.count
    }
    func getList() -> [PromotionBanner] {
        return promotionbannerlist
    }
    //    func getImageURL() -> String{
    //    }
    
}
