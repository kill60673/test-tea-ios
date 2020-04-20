//
//  getStoreCodable.swift
//  seven_tea
//
//  Created by harrison on 2020/4/17.
//  Copyright © 2020 harrison公司機. All rights reserved.
//

import Foundation
struct GetStoreCodable: Codable {
    var success: Bool
    var message: String
    var data: [data]
    
    struct data: Codable {
        var id: String
        var storename: String
        var address: String
        var id_open: Bool
        var opening_time: [opentimeData]
        
        struct opentimeData: Codable {
            var date: String
            var end_time: String
            var start_time: String
        }
    }
}
