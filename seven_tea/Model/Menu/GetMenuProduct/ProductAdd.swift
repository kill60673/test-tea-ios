//
//  ProductAdd.swift
//  seven_tea
//
//  Created by harrison on 2020/4/26.
//  Copyright © 2020 harrison公司機. All rights reserved.
//

import Foundation
class ProductAdd {
    var id = Int()
    var name = String()
    var price = String()

    init(id: Int, name: String, price: String) {
        self.id = id
        self.name = name
        self.price = price
    }
}