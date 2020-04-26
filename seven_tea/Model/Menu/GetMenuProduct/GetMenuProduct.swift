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
    var size: ProductSize?
    var price: ProductPrice?
    var temp: ProductTemp?
    var sugar: ProductSugar?
    var add: ProductAdd?

    init(id: String, item_name: String, size_id: Int, size_name: String, price_size: String, price_temp: String, product_price: String, temp_name: String, temp_is_active: Bool, sugar_name: String, sugar_is_active: Bool, add_id: Int, add_name: String) {
        self.id = id
        self.item_name = item_name
        self.size = ProductSize(id: size_id, name: size_name)
        self.price = ProductPrice(size: price_size, temp: price_temp, price: product_price)
        self.temp = ProductTemp(name: temp_name, is_active: temp_is_active)
        self.sugar = ProductSugar(name: sugar_name, is_active: sugar_is_active)
        self.add = ProductAdd(id: add_id, name: add_name)
    }
}
