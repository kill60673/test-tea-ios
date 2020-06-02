//
//  CancelOrderCodable.swift
//  seven_tea
//
//  Created by harrison on 2020/6/2.
//  Copyright © 2020 harrison公司機. All rights reserved.
//

import Foundation
struct CancelOrderCodable: Codable {
    var success: Bool
    var message: String
    var data: String
}
struct ordernumber: Codable {
    var order_no: String
    init(order_no: String) {
        self.order_no = order_no
    }
}
