//
//  LoadingBannerApi.swift
//  seven_tea
//
//  Created by harrison on 2020/4/14.
//  Copyright © 2020 harrison公司機. All rights reserved.
//

import Foundation
class LoadingBannerAPI: NSObject {
    static let LoadingBannerInstance = LoadingBannerAPI()
    var loadingbannerlist = [LoadingBanner]()
    func loadingbanner() {

        let url = URL(string: ApiUrl.ApiUrlInstance.loadingBanner )!

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
                decoder.decode(LoadingBannerCodable.self, from: data) {
                if Info.success == true {
                    self.loadingbannerlist.removeAll()
                    for result in Info.data {
                        let loadingBanner = LoadingBanner(imageType: result.img_type, pictureURL: result.picture_url, linkURL: result.link_url)
                        self.loadingbannerlist.append(loadingBanner)
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
        return loadingbannerlist.count
    }
    func getList() -> [LoadingBanner] {
        return loadingbannerlist
    }

}
