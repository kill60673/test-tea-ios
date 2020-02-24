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
