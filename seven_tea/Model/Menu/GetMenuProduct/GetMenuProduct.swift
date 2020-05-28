//
//  GetMenuProduct.swift
//  seven_tea
//
//  Created by harrison on 2020/4/25.
//  Copyright © 2020 harrison公司機. All rights reserved.
//

import Foundation
class GetMenuProduct {
    var id = String()
    var item_name = String()
    var picture_url = String()
    var is_fixed = Int()
    var add = [ProductAdd]()
    var size = [ProductSize]()
    var itempricedictionary = [String: Int]()
    var itempricedetail = [ProductPrice]()
    var status = String()

    init(id: String, item_name: String, picture_url: String, is_fixed: Int, add: [ProductAdd], size: [ProductSize], itemprice: [String: Int], itempricedetail: [ProductPrice], status: String) {
        self.id = id
        self.item_name = item_name
        self.picture_url = picture_url
        self.is_fixed = is_fixed
        self.add = add
        self.size = size
        self.itempricedictionary = itemprice
        self.itempricedetail = itempricedetail
        self.status = status
    }
}
