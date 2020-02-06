//
//  LoginAPI.swift
//  NewSevenTea
//
//

import Foundation

import UIKit
class LoginAPI: NSObject {
    static let LoginInstance = LoginAPI()
    var datas = Data()
    func getLoginMessage(username: String,password : String)
    {
        let postSTring  = Loginmessage(username: username, password: password)
               let encoder = JSONEncoder()
               if let data = try? encoder.encode(postSTring)
               {
                print(postSTring)
                self.datas = data
                //Login()
                print(data)
               }
    }
    // 登入用API
    func Login(username: String,password : String) {
        let url = URL(string: ApiUrl.ApiUrlInstance.LoginUrl)!
        var request = URLRequest(url: url)
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        request.httpMethod = "POST"
        print(datas)
        let postString = "username=\(username)&password=\(password)"
        request.httpBody = postString.data(using: .utf8)
        let task = URLSession.shared.dataTask(with: request)
        {
            data, response, error in
            let responseString = String(data: data!, encoding: .utf8)
            print(responseString as Any)
            let decoder = JSONDecoder()
            print(postString)
            decoder.dateDecodingStrategy = .iso8601
            // 做 do catch 如果任何例外事件 就在catch print出error 
            if let data = data
            {
                do
                {
                    print(data)
                    let login = try decoder.decode(LoginCodable.self, from: data)
                    if login.success == true
                    {
                        DispatchQueue.main.async
                        {
                            MessageAlert.Instance.message(message: "登入成功")
                        }
                    }
                    else
                    {
                        DispatchQueue.main.async
                        {
                            print(error)
                            MessageAlert.Instance.message(message: "登入失敗")
                        }
                    }
                }
                catch
                {
                    print(error)
                }
            }
        }
        task.resume()
    }    
}


