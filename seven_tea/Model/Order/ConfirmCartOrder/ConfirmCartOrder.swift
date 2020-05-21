//
//  ConfirmCartOrder.swift
//  seven_tea
//
//  Created by harrison on 2020/5/19.
//  Copyright © 2020 harrison公司機. All rights reserved.
//

import Foundation
struct ConfirmCartOrderCodable: Codable {
    var success: Bool
    var message: String
    var data: String
}

struct ConfirmCartOrder: Codable {
    var store_id: Int
    var total_qty: Int
    var total_price: Int
    var get_method: String
    var arrival_time: String
    var recipient: String
    var recipient_tel: String
    var tax_code: String
    var pay_method: String?
    var item: [ConfirmCartitem]
    var address: [SynchronizeMemberAddress]
}
struct ConfirmCartitem: Codable {
    var id: String
    var qty: Int
    var item_id: Int
    var item_name: String
    var size: String
    var sugar: String
    var tmp: String
    var add: [String]
    var price: Int
    init(id: String, qty: Int, item_id: Int, item_name: String, size: String, sugar: String, tmp: String, add: [String], price: Int) {
        self.id = id
        self.qty = qty
        self.item_id = item_id
        self.item_name = item_name
        self.size = size
        self.sugar = sugar
        self.tmp = tmp
        self.add = add
        self.price = price
    }
}

