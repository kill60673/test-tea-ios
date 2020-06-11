//
//  EditMemberPassword.swift
//  seven_tea
//
//  Created by harrison on 2020/6/11.
//  Copyright © 2020 harrison公司機. All rights reserved.
//

import Foundation
struct EditMemberPasswordCodable: Codable {
    var success: Bool
    var message: String
    var data: String
}
struct EditMemberPasswordMessage: Codable {
    var old_password : String
    var new_password : String
    var new_password_confirmation : String
}
