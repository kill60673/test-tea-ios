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
    
    //將資料放進object的func
    func getLoginMessage(username: String,password : String)
    {
        let postSTring  = Loginmessage(username : username , password : password)
        let encoder = JSONEncoder()
        if let data = try? encoder.encode(postSTring)
        {
            print(postSTring)
            self.datas = data
            print(data)
            Login
                {
                    (result) in
                    if result
                    {
                        return
                    }
                    else
                    {
                        
                    }
            }
        }
    }
    // 登入用API
    func Login(handler : @escaping (Bool)->()) {
        
        let url = URL(string : ApiUrl.ApiUrlInstance.LoginUrl)!
        var request = URLRequest(url : url)
        
        request.setValue("application/json" , forHTTPHeaderField : "Accept")
        request.setValue("application/json" , forHTTPHeaderField : "Content-Type")
        request.httpMethod = "POST"
        request.httpBody = datas
        
        let task = URLSession.shared.dataTask(with : request)
        {
            data , response , error in
            let responseString = String(data : data!, encoding : .utf8)
            print(responseString as Any)
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .iso8601
            // 做 do catch 如果任何例外事件 就在catch print出error
            if let data = data
            {
                do
                {
                    print(data)
                    let login = try decoder.decode(LoginCodable.self , from : data)
                    if login.success == true
                    {
                        DispatchQueue.main.async
                            {
                                MessageAlert.Instance.message(message : "登入成功")
                                handler(true)
                                
                        }
                    }
                    else
                    {
                        DispatchQueue.main.async
                            {
                                MessageAlert.Instance.message(message : "登入失敗")
                                handler(false)
                        }
                    }
                }
                catch
                {
                    
                }
            }
        }
        task.resume()
    }
}


