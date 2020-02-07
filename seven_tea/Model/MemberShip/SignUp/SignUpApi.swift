//
//  MemberRegisterAPI.swift
//

import Foundation
import  UIKit
class MemberRegisterAPI: NSObject {
    static let MemberRegisterInstance = MemberRegisterAPI()
    
    func MemberRegister(username: String , password: String , password_confirmation: String , validators_code: String , email: String , phone: String , name: String) {
        let url = URL(string: ApiUrl.ApiUrlInstance.MemberRegisterUrl)!
        var request = URLRequest(url: url)
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        request.httpMethod = "POST"
        let postString =
        """
            username=\(username)&
            password=\(password)&
            password_confirmation=\(password_confirmation)&
            validators_code=\(validators_code)&
            email=\(email)&
            phone=\(phone)&
            name=\(name)
        """
// 把東西放成obj 
//        var obj : {
//            name: "name",
//            password: "test123456",
//        }
        request.httpBody = postString.data(using: .utf8)
        let task = URLSession.shared.dataTask(with: request) {
            data, response, error in
            let responseString = String(data: data!, encoding: .utf8)
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .iso8601
            if let data = data, let Sms = try?
                decoder.decode(MemberRegisterSmsCodable.self, from: data)
            {
                if(Sms.result == 0 ){
                    
                    
                    //主線程
                    DispatchQueue.main.async{
                        
//                        RegisterPhone.text = ""
//                        RegisterPassWord.text = ""
//                        RegisterRePassWord.text = ""
//                        RegisterUserName.text = ""
//                        RegisterName.text = ""
//                        RegisterEmail.text = ""
//                        RegisterVerifyCode.text = ""
//
//                        MessageAlert.Instance.message(message: "\(Sms.message)")
                        
                        
                        
                    }
                    
                    
                }else{
                    //主線程
                    DispatchQueue.main.async{
//                        MessageAlert.Instance.message(message: "\(Sms.message)")
                        
                    }
                    
                }
                
                
            } else {
                //主線程
                DispatchQueue.main.async{
                    
//                    MessageAlert.Instance.message(message: "資料解析錯誤")
                    
                    
                }
                
                
                
            }
            
            
//            UIViewController.removeSpinner(spinner: sv as! UIView)
            
            
        }
        
        task.resume()
        
        
    }
    
    
    
    
}
