//
//  EditMemberInfo.swift
//  seven_tea
//
//  Created by harrison on 2020/6/11.
//  Copyright © 2020 harrison公司機. All rights reserved.
//

import Foundation
struct EditMemberInfoCodable: Codable {
    var success: Bool
    var message: String
    var data: String
}
struct EdifMemberInfoMessage: Codable {
    var type : String
    var params : String
}
