//
//  UpdateShoppingCar.swift
//  seven_tea
//
//  Created by harrison on 2020/5/7.
//  Copyright © 2020 harrison公司機. All rights reserved.
//

import Foundation
struct UpdateShoppingCarCodable: Codable {
    var success: Bool
    var message: String
    var data: String
}

struct UpdateShoppingParams: Codable {
    var params = [data]()
}
struct data: Codable {
    var id: Int
    var qty: Int
    init(id: Int, qty: Int) {
        self.id = id
        self.qty = qty
    }
}
