//
//  SendVerifyEmailCodable.swift
//  seven_tea
//
//  Created by harrison on 2020/5/3.
//  Copyright © 2020 harrison公司機. All rights reserved.
//

import Foundation
import Foundation
struct SendSetVerifyEmailCodable: Codable {
    var success: Bool
    var message: String
}
struct SendSetVerifyEmail: Codable {
    var email: String
    var email_validate_code: String
}
