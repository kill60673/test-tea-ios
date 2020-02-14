//
//  SandRegistrInfoApi.swift
//  seven_tea
//
//  Created by harrison on 2020/2/10.
//  Copyright © 2020 harrison公司機. All rights reserved.
//

import Foundation

class SendMemberRegistrApi : NSObject {
    static let MemberRegisterInstance = SendMemberRegistrApi()
    var datas = Data()
    
    //將資料放進object的func
//    func getMemberRegisterMessage(phone:String , validators_code:String)
//    {
//        let postSTring  = MemberRegisterMessage(phone: phone, validators_code: validators_code)
//        let encoder = JSONEncoder()
//        if let data = try? encoder.encode(postSTring)
//        {
//            print(postSTring)
//            self.datas = data
//            print(data)
//            SendMemberRegister()
//        }
//
//    }
    func SendMemberRegister(Phone : String , Validators_code : String , handler : @escaping (Bool)->()) {
        let url = URL(string : ApiUrl.ApiUrlInstance.SendMemberRegistrUrl)!
        var request = URLRequest(url : url)
        request.setValue("application/json" , forHTTPHeaderField : "Accept")
//        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "POST"
        let postString = "phone=\(Phone)&validators_code=\(Validators_code)"
        request.httpBody = postString.data(using : .utf8)
        let task = URLSession.shared.dataTask(with : request)
        {
            data , response , error in
            let responseString = String(data : data! , encoding : .utf8)
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .iso8601
            if let data = data, let MemberRegister = try?
                decoder.decode(MemberRegisterSmsCodable.self, from : data)
            {
                if (MemberRegister.success == true )
                {
                    //主線程
                    DispatchQueue.main.async
                    {
                        MessageAlert.Instance.message(message : "\(MemberRegister.message)")
                        handler(true)
                    }
                }
                else
                {
                    //主線程
                    DispatchQueue.main.async
                    {
                        MessageAlert.Instance.message(message : "\(MemberRegister.message)")
                        handler(false)
                    }
                }
            }
            else
            {
                //主線程
                DispatchQueue.main.async
                {
                      
                }
            }
        }
        task.resume()
    }
}
