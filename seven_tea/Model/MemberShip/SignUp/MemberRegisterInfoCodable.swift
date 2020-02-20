//
//  RegisterCodable.swift
//  seven_tea
//
//  Created by harrison on 2020/2/10.
//  Copyright © 2020 harrison公司機. All rights reserved.
//

import Foundation
struct MemberRegisterInfoCodable : Codable {
    var success : Bool?
    var message : String
}

struct MemberRegisterMessageInfo : Codable {
    var username : String
    var name : String
    var sex : String
    var phone : String
    var password : String
    var password_confirmation : String
    var validators_code : String
}
