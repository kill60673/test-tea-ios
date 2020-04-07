//
//  ADCodable.swift
//  seven_tea
//
//  Created by harrison on 2020/4/7.
//  Copyright © 2020 harrison公司機. All rights reserved.
//

import Foundation

struct ADCodable: Codable {
    var result: Int
    var message: [message]?
    
    struct message: Codable {
        var title: String
        var content: String
        var picture: String
        var sender_name: String
        var send_time: String
    }
}
