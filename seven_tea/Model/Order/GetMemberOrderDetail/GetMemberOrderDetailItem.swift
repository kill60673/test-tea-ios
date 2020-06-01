//
//  GetMemberOrderItemDetail.swift
//  seven_tea
//
//  Created by harrison on 2020/6/1.
//  Copyright © 2020 harrison公司機. All rights reserved.
//

import Foundation
class GetMemberOrderDetailItem: Codable {
    var id: String
    var qty: Int
    var tmp: String
    var size: String
    var total_price: Int
    var sugar: String
    var item_id: Int
    var store_id : Int
    var item_name: String
    var item_category : String
    var add: [MemberItemAdd]
    init(id: String, qty: Int, tmp: String, size: String, total_price: Int, sugar: String, item_id: Int, item_name: String, add: [MemberItemAdd],store_id:Int,item_category:String) {
        self.id = id
        self.qty = qty
        self.tmp = tmp
        self.size = size
        self.total_price = total_price
        self.sugar = sugar
        self.item_id = item_id
        self.item_name = item_name
        self.add = add
        self.store_id = store_id
        self.item_category = item_category
    }
}
