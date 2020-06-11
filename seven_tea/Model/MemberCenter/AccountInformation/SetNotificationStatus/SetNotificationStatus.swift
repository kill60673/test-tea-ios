//
//  SetNotificationStatus.swift
//  seven_tea
//
//  Created by harrison on 2020/6/11.
//  Copyright © 2020 harrison公司機. All rights reserved.
//

import Foundation
struct SetNotificationStatusCodable: Codable {
    var success: Bool
    var message: String
    var data: String
}
struct SetNotificationStatusMessage: Codable {
    var type : String
    var status : Int
}
