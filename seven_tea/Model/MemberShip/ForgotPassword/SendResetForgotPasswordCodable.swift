//
//  SendResetForgotPasswordCodable.swift
//  seven_tea
//
//  Created by harrison公司機 on 2020/2/6.
//  Copyright © 2020 harrison公司機. All rights reserved.
//

import Foundation
struct SendResetForgotPasswordCodable: Codable {
    var success: Bool?
    var message: String
    var data: Data
}

struct SendResetForgorPasswordMessage: Codable {
    var username: String
    var phone: String
    var validator_code: String
}
