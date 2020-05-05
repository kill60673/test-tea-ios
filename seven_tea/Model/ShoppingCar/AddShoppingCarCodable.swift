//
//  AddShopingCarCodable.swift
//  seven_tea
//
//  Created by harrison on 2020/5/3.
//  Copyright © 2020 harrison公司機. All rights reserved.
//

import Foundation
struct AddShoppingCarCodable: Codable {
    var success: Bool
    var message: String
    var data: Datas?
}
struct AddShoppingCar: Codable {
    var item_id: String
    var item_name: String
    var item_category: String
    var tmp: String
    var sugar: String
    var size: String
    var add: [String]
    var store_id: String
    var qty: Int
    var total_price: Int
}
