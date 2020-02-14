//
//  ResetPasswordApi.swift
//  seven_tea
//
//  Created by harrison公司機 on 2020/2/6.
//  Copyright © 2020 harrison公司機. All rights reserved.
//

import Foundation
class RestPasswordApi : NSObject{
    static let RestPasswordApiInstance = RestPasswordApi()
    func RestPassword(Username : String , Phone : String , Validators_code : String , Password : String , Password_Confirmation : String ){
        let url = URL(string : ApiUrl.ApiUrlInstance.RestPasswordUrl)!
        var request = URLRequest(url : url)
        request.setValue("application/json", forHTTPHeaderField : "Accept")
//用data放入尚未修改完
//      request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "POST"
        let postString = "username=\(Username)&phone=\(Phone)&validators_code=\(Validators_code)&password=\(Password)&password_confirmation=\(Password_Confirmation)"
        request.httpBody = postString.data(using : .utf8)
        let task = URLSession.shared.dataTask(with : request)
        {
            data, response, error in
            //let responseString = String(data: data!, encoding: .utf8)
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .iso8601
            if let data = data, let ResetPassword = try?
                decoder.decode(RestPasswordCodable.self , from : data)
            {
                if (ResetPassword.success == true )
                {
                    //主線程
                    DispatchQueue.main.async
                    {
                        MessageAlert.Instance.message(message : "\(ResetPassword.message)")
                    }
                }
                else
                {
                    //主線程
                    DispatchQueue.main.async
                    {
                        MessageAlert.Instance.message(message : "\(ResetPassword.message)")
                    }
                }
            }
            else
            {
                //主線程
                DispatchQueue.main.async
                {
                    MessageAlert.Instance.message(message : "資料解析錯誤")
                }
            }
        }
        task.resume()
    }
}


