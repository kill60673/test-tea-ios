//
//  AddLoveAddress.swift
//  seven_tea
//
//  Created by harrison on 2020/6/16.
//  Copyright © 2020 harrison公司機. All rights reserved.
//

import Foundation
struct AddLoveAddressCodable: Codable {
    var success: Bool
    var message: String
}
struct AddLoveAddress: Codable {
    var city: String
    var district: String
    var address: String
}
