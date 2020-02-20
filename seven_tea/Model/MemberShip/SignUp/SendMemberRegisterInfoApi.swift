//
//  MemberRegisterAPI.swift
//

import Foundation
import UIKit
class SendMemberRegisterInfoAPI : NSObject {
    static let MemberRegisterInstance = SendMemberRegisterInfoAPI()
    var datas = Data()
    
    //將資料放進object的func
//    func getMemberRegisterMessageInfo(Username: String , Name : String ,Sex : String , Phone: String ,Password : String,  Password_confirmation: String , Validators_code: String)
//    {
//        let postSTring  = MemberRegisterMessageInfo(username: username, name: name, sex: sex, phone: phone, password: password, password_confirmation: password_confirmation, validators_code: validators_code)
//               let encoder = JSONEncoder()
//               if let data = try? encoder.encode(postSTring)
//               {
//                print(postSTring)
//                self.datas = data
//                print(data)
//                SendMemberRegisterInfo()
//               }
//
//    }
    func SendMemberRegisterInfo(Username : String , Name : String , Sex : String , Phone: String , Password : String ,  Password_confirmation : String , Validators_code : String) {
        let url = URL(string : ApiUrl.ApiUrlInstance.SendMemberRegisterInfoUrl)!
        var request = URLRequest(url : url)
        request.setValue("application/json", forHTTPHeaderField : "Accept")
//        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "POST"
        let postString = "username=\(Username)&name=\(Name)&sex=\(Sex)&phone=\(Phone)&password=\(Password)&password_confirmation=\(Password_confirmation)&validators_code=\(Validators_code)"
        request.httpBody = postString.data(using : .utf8)
        let task = URLSession.shared.dataTask(with : request)
        {
            data, response, error in
            let responseString = String(data : data! , encoding : .utf8)
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .iso8601
            if let data = data, let MemberRegisterInfo = try?
                decoder.decode(MemberRegisterSmsCodable.self , from: data)
            {
                if (MemberRegisterInfo.success == true )
                {
                    //主線程
                    DispatchQueue.main.async
                    {
                        MessageAlert.Instance.message(message : "\(MemberRegisterInfo.message)")
                    }
                }
                else
                {
                    //主線程
                    DispatchQueue.main.async
                    {
                        MessageAlert.Instance.message(message : "\(MemberRegisterInfo.message)")
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
