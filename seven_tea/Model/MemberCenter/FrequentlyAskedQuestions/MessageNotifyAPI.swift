//
//  MessageNotifyAPI.swift
//  NewSevenTea
//
//  Created by 資訊部 on 2019/2/7.
//  Copyright © 2019年 Future Third Party Payment. All rights reserved.
//

import Foundation
import UIKit
class MessageNotifyAPI: NSObject {
    static let MessageNotifyInstance = MessageNotifyAPI()
    
    func MessageNotify(Token: String) {
        
        let url = URL(string: ApiUrl.ApiUrlInstance.MessageNotifyUrl)!
        var request = URLRequest(url: url)
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        request.setValue(Token, forHTTPHeaderField: "Authorization")
        request.httpMethod = "GET"

        let task = URLSession.shared.dataTask(with: request) {
            data, response, error in

            let httpStatus = response as? HTTPURLResponse
            //檢查Token是否要刷新
            if httpStatus!.allHeaderFields["Authorization"] as? String ?? "" != "" {
                UserInfo.UserInfoInstance.update(oldToken: Token, newToken: httpStatus!.allHeaderFields["Authorization"] as? String ?? "")
            }
            
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .iso8601
            if let data = data, let Info = try? decoder.decode(MessageNotifyCodable.self, from: data) {
                
                if Info.result == 0 {
                    Id.removeAll()
                    Topic.removeAll()
                    Content.removeAll()
                    Time.removeAll()
                    UserName.removeAll()
                    SendName.removeAll()
                    
                    for result in Info.message! {
                        Id.append(result.id)
                        Topic.append(result.title )
                        Content.append(result.content )
                        Time.append(result.send_time )
                        UserName.append(result.username)
                        SendName.append(result.sender_name)
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
                PersonalMessageTableView.reloadData()
            }
            
        }
        task.resume()
        
    }
}
