//
//  FrequentlyAskedQuestionsModelController.swift
//  seven_tea
//
//

import Foundation
import UIKit
class GetCreateFeedBackMessage: UIViewController {
    func getCreateFeedBackMessage(title: String, feedback_type_id: Int,content:String,feedback_images:[String]) {
        let postString  = CreateFeedBackmessage(title: title, feedback_type_id: feedback_type_id, content: content, feedback_images: feedback_images    )
        let encoder = JSONEncoder()
        if let data = try? encoder.encode(postString) {
            print(postString)
            datas = data
            print("1234567", data)
            CreateFeedBackApi.CreateFeedBackApiInstance.createfeedback {(result) in
                if result {
                    return
                } else {
                }
            }
        }
    }
}
