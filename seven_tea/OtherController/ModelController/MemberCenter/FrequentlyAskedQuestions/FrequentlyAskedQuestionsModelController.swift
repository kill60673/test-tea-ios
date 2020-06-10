//
//  FrequentlyAskedQuestionsModelController.swift
//  seven_tea
//
//

import Foundation
import UIKit
class GetCreateFeedBackMessage: UIViewController {
    static let gettCreateFeedBackInstance = GetCreateFeedBackMessage()
    func getCreateFeedBackMessage(title: String, feedback_type_id: Int,content:String,feedback_images:[String]) {
        let postString  = CreateFeedBackmessage(title: title, feedback_type_id: feedback_type_id, content: content, feedback_images: feedback_images    )
        let encoder = JSONEncoder()
        if let data = try? encoder.encode(postString) {
            print(postString)
            datas = data
            print("1234567", data)
            CreateFeedBackApi.CreateFeedBackApiInstance.createfeedback(token: UserInfo.UserInfoInstance.preferences.object(forKey: "token") as! String) {(result) in
                if result {
                    return
                } else {
                }
            }
        }
    }
}
