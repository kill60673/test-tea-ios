//
//  ADApi.swift
//  seven_tea
//
//  Created by harrison on 2020/4/7.
//  Copyright © 2020 harrison公司機. All rights reserved.
//

import Foundation
import UIKit
class ADAPI: NSObject {
    static let ADInstance = ADAPI()
    
    func AD() {
        let url = URL(string: ApiUrl.ApiUrlInstance.ADUrl)!
        var request = URLRequest(url: url)
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        request.httpMethod = "GET"
        
        //let postString = "type=\(type)&time=\(time)"
        //request.httpBody = postString.data(using: .utf8)
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            
            if let httpStatus = response as? HTTPURLResponse, httpStatus.statusCode != 200 {           // check for http errors
                //print("statusCode should be 200, but is \(httpStatus.statusCode)")
                //print("response = \(response)")
                MessageAlert.Instance.message(message: "\(response)")
            } else {
                
                let decoder = JSONDecoder()
                
                decoder.dateDecodingStrategy = .iso8601
                if let data = data, let Ad = try?
                    decoder.decode(ADCodable.self, from: data)
                {
                    
                    if Ad.result == 0  {
                        ADTitle.removeAll()
                        ADContent.removeAll()
                        ADSendName.removeAll()
                        ADPicture.removeAll()
                        ADSendTime.removeAll()
                        
                        for result in Ad.message! {
                            ADTitle.append(result.title)
                            ADContent.append(result.content)
                            ADSendName.append(result.sender_name)
                            ADPicture.append(result.picture)
                            ADSendTime.append(result.send_time)
                            print("這裡是\(ADPicture.count)")
                        }
                        
                    } else {
                        MessageAlert.Instance.message(message: "\(Ad.message)")
                    }
                   
                } else {
                    MessageAlert.Instance.message(message: "資料解析錯誤")
                }
                
            }
            
            // let responseString = String(data: data, encoding: .utf8)
            DispatchQueue.main.async{
                ADTable.reloadData()
                BCTable.reloadData()
            }
          
        }
        task.resume()
        
    }
    
}
