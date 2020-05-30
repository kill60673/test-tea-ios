//
//  MemberNewOrder.swift
//  seven_tea
//
//  Created by harrison on 2020/5/28.
//  Copyright © 2020 harrison公司機. All rights reserved.
//

import Foundation
class MemberNewOrder: Codable {
    var get_method: String
    var order_no: String
    var order_status: String
    var store: String
    var total_qty: Int
    var total_price: Int
    var item: [MemberOrderItem]
    var itemname : [String]
    init(get_method: String, order_no: String, order_status: String, store: String, total_qty: Int, total_price: Int, item: [MemberOrderItem],itemname:[String]) {
        self.get_method = get_method
        self.order_no = order_no
        self.order_status = order_status
        self.store = store
        self.total_qty = total_qty
        self.total_price = total_price
        self.item = item
        self.itemname = itemname
    }
}
