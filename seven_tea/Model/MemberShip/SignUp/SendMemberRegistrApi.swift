//
//  SandRegistrInfoApi.swift
//  seven_tea
//
//  Created by harrison on 2020/2/10.
//  Copyright © 2020 harrison公司機. All rights reserved.
//

import Foundation
var datas = Data()
class SendMemberRegistrApi: NSObject {
    static let MemberRegisterInstance = SendMemberRegistrApi()
    func sendMemberRegister( handler : @escaping (Bool) -> Void) {
        let url = URL(string: ApiUrl.ApiUrlInstance.sendMemberRegistrUrl)!
        var request = URLRequest(url: url)
//        request.setValue("application/json" , forHTTPHeaderField : "Accept")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "POST"
        let postString = datas
        request.httpBody = postString
        let task = URLSession.shared.dataTask(with: request) {
            data, _, _ in
            let responseString = String(data: data!, encoding: .utf8)
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .iso8601
            if let data = data, let memberRegister = try?
                decoder.decode(MemberRegisterSmsCodable.self, from: data) {
                if memberRegister.success == true {
                    //主線程
                    DispatchQueue.main.async {
//                      MessageAlert.Instance.message(message: "\(memberRegister.message)")
                        handler(true)
                            print("資料成功")
                    }
                } else {
                    //主線程
                    DispatchQueue.main.async {
                            MessageAlert.Instance.message(message: "\(memberRegister.message)")
                            handler(false)
                               print("資料失敗")
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
