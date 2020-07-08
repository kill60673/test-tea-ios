//
//  AddLoveAddressApi.swift
//  seven_tea
//
//  Created by harrison on 2020/6/16.
//  Copyright © 2020 harrison公司機. All rights reserved.
//

import Foundation
class AddLoveAddressApi: NSObject {
    static let AddLoveAddressApiInstance = AddLoveAddressApi()
    var newToken: String!
    func verifyEmailApi(token: String, handler : @escaping (Bool) -> Void) {
        let url = URL(string: ApiUrl.ApiUrlInstance.addloveaddress)!
        var request = URLRequest(url: url)
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue(token, forHTTPHeaderField: "Authorization")
        request.httpMethod = "POST"
        let postString = datas
        request.httpBody = postString
        let task = URLSession.shared.dataTask(with: request) {
            data, response, _ in
            let httpStatus = response as! HTTPURLResponse
            if httpStatus.allHeaderFields["Authorization"] != nil {
                self.newToken = "\(httpStatus.allHeaderFields["Authorization"]!)"
                UserInfo.UserInfoInstance.update(oldToken: token, newToken: "\(httpStatus.allHeaderFields["Authorization"]!)")
            } else {
                print("token is", token)
            }
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .iso8601
            if let data = data, let addloveaddress = try?
                decoder.decode(AddLoveAddressCodable.self, from: data) {
                if addloveaddress.success == true {
                    //主線程
                    DispatchQueue.main.async {
                        MessageAlert.Instance.message(message: "\(addloveaddress.message)")
                    }
                } else {
                    //主線程
                    DispatchQueue.main.async {
                        MessageAlert.Instance.message(message: "\(addloveaddress.message)")
                    }
                }
            } else {
                //主線程
                DispatchQueue.main.async {
                }
            }
        }
        task.resume()
    }
}
