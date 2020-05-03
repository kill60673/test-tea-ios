//
//  FeedBackOptionCodable.swift
//  seven_tea
//
//  Created by harrison on 2020/5/3.
//  Copyright © 2020 harrison公司機. All rights reserved.
//

import Foundation
struct FeedBackOptionCodable: Codable {
    var success: Bool
    var message: String
    var data: [String]?
}
