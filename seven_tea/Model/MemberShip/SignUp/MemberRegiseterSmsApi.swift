//
//  MemberRegiseterSmsApi.swift
//  seven_tea
//
//  Created by harrison on 2020/2/10.
//  Copyright © 2020 harrison公司機. All rights reserved.
//

import Foundation

class MemberRegiseterSmsApi: NSObject {
    static let MemberRegisterSmsInstance = MemberRegiseterSmsApi()
    var datas = Data()

    //將資料放進object的func
//    func getMemberRegisterSmsMessage(phone:String)
//    {
//        let postSTring  = MemberRegisterSmsMessage(phone: phone)
//        let encoder = JSONEncoder()
//        if let data = try? encoder.encode(postSTring)
//        {
//            print(postSTring)
//            self.datas = data
//            print(data)
//            SendMemberRegisterSms()
//        }
//
//    }
    func sendMemberRegisterSms(phone: String) {
        let url = URL(string: ApiUrl.ApiUrlInstance.sendMemberRegisterSmsUrl)!
        var request = URLRequest(url: url)
        request.setValue("application/json", forHTTPHeaderField: "Accept")
//        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "POST"
        let postString = "phone=\(phone)"
        request.httpBody = postString.data(using: .utf8)
        let task = URLSession.shared.dataTask(with: request) {
            data, response, error in
            let responseString = String(data: data!, encoding: .utf8)
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .iso8601
            if let data = data, let sms = try?
                decoder.decode(MemberRegisterSmsCodable.self, from: data) {
                if sms.success == true {
                    //主線程
                    DispatchQueue.main.async {
                            MessageAlert.Instance.message(message: "\(sms.message)")
                    }
                } else {
                    //主線程
                    DispatchQueue.main.async {
                            MessageAlert.Instance.message(message: "\(sms.message)")
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
