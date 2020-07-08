//
//  FeedBackOptionApi.swift
//  seven_tea
//
//  Created by harrison on 2020/5/3.
//  Copyright © 2020 harrison公司機. All rights reserved.
//

import Foundation
import SwiftyJSON
class FeedBackOptionApi: NSObject {
    static let FeedBackOptionApiInstance = FeedBackOptionApi()
    var feedbackoptionlist = [FeedBackOption]()
    func feedbackoption() {
        let url = URL(string: ApiUrl.ApiUrlInstance.feedbackoption)!
        
        var request = URLRequest(url: url)
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        request.httpMethod = "GET"
        
        let task = URLSession.shared.dataTask(with: request) {
            data, response, error in
            let httpStatus = response as! HTTPURLResponse
            do {
                let json = try JSON(data: data!)
                if json["success"].bool! == true {
                    DispatchQueue.main.async {
                        self.feedbackoptionlist.removeAll()
                        for i in 0..<json["data"].count {
                            let data = json["data"][i]
                            let feedback = FeedBackOption(name: data["name"].string!, id: data["id"].int!)
                            self.feedbackoptionlist.append(feedback)
                        }
                        MessageAlert.Instance.message(message: json["message"].string!)
                    }
                } else {
                    //主線程
                    self.feedbackoptionlist.removeAll()
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
                if PersonalMessageTableView != nil {
                    PersonalMessageTableView.reloadData()
                }
            }
        }
        task.resume()
    }
    
    func getCount() -> Int {
        print("我有幾個feed back option count", feedbackoptionlist.count)
        return feedbackoptionlist.count
    }
    func  getlist() ->[FeedBackOption]{
        return feedbackoptionlist
    }
}
