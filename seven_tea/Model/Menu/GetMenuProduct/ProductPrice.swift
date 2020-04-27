//
//  ProductPrice.swift
//  seven_tea
//
//  Created by harrison on 2020/4/26.
//  Copyright © 2020 harrison公司機. All rights reserved.
//

import Foundation
class ProductPrice {
    var size = String()
    var temp = String()
    var price = String()
    var area = String()
    
    init(size: String, temp: String?, price: String, area: String?) {
        self.size = size
        self.temp = temp ?? ""
        self.price = price
        self.area = area ?? ""
    }
}
