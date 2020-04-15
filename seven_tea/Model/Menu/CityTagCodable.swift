//
//  CityTagCodable.swift
//  seven_tea
//
//  Created by harrison on 2020/4/15.
//  Copyright © 2020 harrison公司機. All rights reserved.
//

import Foundation
struct CityTagCodable: Codable {
    var success: Bool
    var message: String
    var data: [String]
}
