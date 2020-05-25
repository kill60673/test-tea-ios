//
//  GetShoppingDetail.swift
//  seven_tea
//
//  Created by harrison on 2020/5/7.
//  Copyright © 2020 harrison公司機. All rights reserved.
//

import Foundation
class GetShoppingCarDetail {
    var store_id: Int
    var store_name: String
    var totle_price: Int
    var total_qty: Int
    var can_delivery: Bool
    var gap_to_delivery: Int
    init(store_id: Int, store_name: String, totle_price: Int, can_delivery: Bool, gap_to_delivery: Int, total_qty: Int) {
        self.store_id = store_id
        self.store_name = store_name
        self.totle_price = totle_price
        self.can_delivery = can_delivery
        self.gap_to_delivery = gap_to_delivery
        self.total_qty = total_qty
    }
}
