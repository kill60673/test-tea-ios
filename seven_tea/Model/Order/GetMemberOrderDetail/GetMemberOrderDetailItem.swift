//
//  GetMemberOrderItemDetail.swift
//  seven_tea
//
//  Created by harrison on 2020/6/1.
//  Copyright © 2020 harrison公司機. All rights reserved.
//

import Foundation
class GetMemberOrderDetailItem: Codable {
    var id: Int
    var qty: Int
    var tmp: String
    var size: String
    var price: Int
    var sugar: String
    var item_id: Int
    var item_name: String
    var add: [MemberItemAdd]
    init(id: Int, qty: Int, tmp: String, size: String, price: Int, sugar: String, item_id: Int, item_name: String, add: [MemberItemAdd]) {
        self.id = id
        self.qty = qty
        self.tmp = tmp
        self.size = size
        self.price = price
        self.sugar = sugar
        self.item_id = item_id
        self.item_name = item_name
        self.add = add
    }
}
