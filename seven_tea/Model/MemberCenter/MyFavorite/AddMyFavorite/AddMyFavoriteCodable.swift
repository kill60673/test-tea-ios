//
//  AddShopingCarCodable.swift
//  seven_tea
//
//  Created by harrison on 2020/5/3.
//  Copyright © 2020 harrison公司機. All rights reserved.
//

import Foundation
struct AddMyFavoriteCodable: Codable {
    var success: Bool
    var message: String
    var data: String
}
struct AddMyFavorite: Codable {
    var item_id: Int
    var item_name: String
    var item_category: Int
    var tmp: String
    var sugar: String
    var size: String
    var add: [String]
    var store_id: Int
    var price: Int
}
