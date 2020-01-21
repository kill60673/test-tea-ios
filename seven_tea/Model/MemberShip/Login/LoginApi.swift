//
//  LoginAPI.swift
//  NewSevenTea
//
//

import Foundation

import UIKit
class LoginAPI: NSObject {
    static let LoginInstance = LoginAPI()
    //登入用API
    func Login(username: String,password :String) {
        let url = URL(string: ApiUrl.ApiUrlInstance.LoginUrl)!
        var request = URLRequest(url: url)
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        request.httpMethod = "POST"
        let postString = "username=\(username)&password=\(password)"
        request.httpBody = postString.data(using: .utf8)
        let task = URLSession.shared.dataTask(with: request)
        { data, response, error in
            let responseString = String(data: data!, encoding: .utf8)
            print("hellloooooooooooo哈囉")
            print(responseString as Any)
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .iso8601
            if let data = data, let Login = try?
            decoder.decode(LoginCodable.self, from: data)
            {
                if Login.success == true
                {
                DispatchQueue.main.async
                    {   print(data.count)
                        print("登入成功")
                    }
                }
            }
        }
        task.resume()
    }    
}




