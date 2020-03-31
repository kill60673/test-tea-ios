//
//  OrderColabale.swift
//  seven_tea
//
//  Created by harrison on 2020/3/31.
//  Copyright © 2020 harrison公司機. All rights reserved.
//

import Foundation
struct OrderCodable: Codable {

    var result: Int
    var message: [message]?

    struct message: Codable {

        var id: String
        var order_no: String
        var name: String
        var phone: String
        var orderer_phone: String
        var arrival_time: String
        var address: String
        var store: String
        var order_time: String
        var company: String
        var tax_id: String
        var status: String
        var pay_method: String
        var get_method: String
        var quantity: Int
        var price: Int

    }
}
