//
//  SendRegistrtInfo.swift
//  seven_tea
//
//  Created by harrison on 2020/2/10.
//  Copyright © 2020 harrison公司機. All rights reserved.
//

import Foundation
struct SendRegisterInfoCodable: Codable {
    var success: Bool?
    var message: String
}

struct MemberRegisterMessage: Codable {
    var phone: String
    var validatorsCode: String
}
