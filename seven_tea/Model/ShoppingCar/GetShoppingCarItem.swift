//
//  GetShoppingCar.swift
//  seven_tea
//
//  Created by harrison on 2020/5/7.
//  Copyright © 2020 harrison公司機. All rights reserved.
//

import Foundation
class GetShoppingCarItem {
    var id: Int
    var item_id: Int
    var item_name: String
    var size: String
    var sugar: String
    var tmp: String
    var price: Int
    var qty: Int
    init(id: Int, item_id: Int, item_name: String, size: String, sugar: String, tmp: String, price: Int, qty: Int) {
        self.id = id
        self.item_id = item_id
        self.item_name = item_name
        self.size = size
        self.sugar = sugar
        self.tmp = tmp
        self.price = price
        self.qty = qty
    }
}
