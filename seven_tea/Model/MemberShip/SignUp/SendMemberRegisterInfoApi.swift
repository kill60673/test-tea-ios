//
//  MemberRegisterAPI.swift
//

import Foundation
import UIKit
class SendMemberRegisterInfoAPI : NSObject {
    static let MemberRegisterInstance = SendMemberRegisterInfoAPI()
    var datas = Data()
    
    
    func SendMemberRegisterInfo( handler : @escaping (Bool)->()) {
        let url = URL(string : ApiUrl.ApiUrlInstance.SendMemberRegisterInfoUrl)!
        var request = URLRequest(url : url)
        request.setValue("application/json", forHTTPHeaderField : "Accept")
        //        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "POST"
        let postString = datas
        request.httpBody = postString
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
