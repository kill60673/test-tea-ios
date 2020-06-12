//
//  ServiceAndPrivacy.swift
//  seven_tea
//
//  Created by harrison on 2020/6/12.
//  Copyright © 2020 harrison公司機. All rights reserved.
//

import Foundation
struct ServiceAndPrivacyCodable: Codable {
    var success: Bool
    var message: String
    var data: ServiceAndPrivacyMessage
}
struct ServiceAndPrivacyMessage: Codable {
    var content : String
}
