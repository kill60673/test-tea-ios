//
//  SendResetForgotPasswordApi.swift
//  seven_tea
//
//  Created by harrison公司機 on 2020/2/6.
//  Copyright © 2020 harrison公司機. All rights reserved.
//

import Foundation
class SendResetForgotPasswordSmsAPI: NSObject {
static let SendResetForgotPasswordSmsInstance = SendResetForgotPasswordSmsAPI()
    
    func SendResetForgotPasswordSms(Username: String , Phone : String , Validators_code : String) {
    let url = URL(string: ApiUrl.ApiUrlInstance.SendResetForgotPasswordUrl)!
        var request = URLRequest(url: url)
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        request.httpMethod = "POST"
        let postString = "username=\(Username)&phone=\(Phone)&validators_code=\(Validators_code)"
        request.httpBody = postString.data(using: .utf8)
        print(postString)
        let task = URLSession.shared.dataTask(with: request)
        {
            data, response, error in
//            let responseString = String(data: data!, encoding: .utf8)
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .iso8601
            if let data = data, let SendResetPassword = try?
                decoder.decode(SendResetForgotPasswordCodable.self, from: data)
            {   print(data)
                print(SendResetPassword)
                if(SendResetPassword.success == true )
                {
                    //主線程
                    DispatchQueue.main.async
                    {
                       MessageAlert.Instance.message(message: "\(SendResetPassword.message)")
                    }
                }
                else
                {
                    //主線程
                    DispatchQueue.main.async
                    {
                        MessageAlert.Instance.message(message: "\(SendResetPassword.message)")
                    }
                }
            }
            else
            {
                //主線程
                DispatchQueue.main.async
                {
                    MessageAlert.Instance.message(message: "資料解析錯誤")
                }
            }
        }
        task.resume()
    }
}
