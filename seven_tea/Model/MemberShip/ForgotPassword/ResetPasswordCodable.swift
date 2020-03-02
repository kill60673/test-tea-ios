//
//  RestPasswordCodable.swift
//  seven_tea
//
//  Created by harrison公司機 on 2020/2/6.
//  Copyright © 2020 harrison公司機. All rights reserved.
//

import Foundation
struct RestPasswordCodable: Codable {
    var success: Bool?
    var message: String
    var data: Data
}
struct ResetPassword: Codable {
    var username: String
    var phone: String
    var validatorsCode: String
    var password: String
    var passwordConifmation: String
}
//userName: String , phone: String, validatorsCode: String, password: String, passwordConfirmation: String
