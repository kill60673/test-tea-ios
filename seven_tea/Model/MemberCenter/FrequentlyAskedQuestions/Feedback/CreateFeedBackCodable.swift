//
//  CreateFeedBack.swift
//  seven_tea
//
//  Created by harrison on 2020/6/10.
//  Copyright © 2020 harrison公司機. All rights reserved.
//

import Foundation
struct CreateFeedBackCodable: Codable {
    var success: Bool
    var message: String
    var data: String
}
struct CreateFeedBackmessage: Codable {
    var title: String
    var feedback_type_id: Int
    var content: String
    var feedback_images:[String]
}

