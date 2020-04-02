//
//  Order.swift
//  seven_tea
//
//  Created by harrison on 2020/4/2.
//  Copyright © 2020 harrison公司機. All rights reserved.
//

import Foundation
class Order: NSObject {
    var orderId = String()
    var orderNumber = String()
    var name = String()
    var phone = String()
    var orderPhone = String()
    var arrivalTime = String()
    var address = String()
    var store = String()
    var orderTime = String()
    var company = String()
    var taxId = String()
    var status = String()
    var payMethod = String()
    var getMethod = String()
    var quantity = Int()
    var price = Int()
    
    init(orderId: String, order_Number: String, name: String, phone: String, orderPhone: String, arrivalTime: String, address: String, store: String, company: String, taxId: String, status: String, payMethod: String, orderTime: String, getMethod: String, quantity: Int, price: Int) {
        self.orderId = orderId
        self.name = name
        self.orderNumber = order_Number
        self.phone = phone
        self.orderPhone = orderPhone
        self.arrivalTime = arrivalTime
        self.address = address
        self.store = store
        self.orderTime = orderTime
        self.company = company
        self.taxId = taxId
        self.status = status
        self.payMethod = payMethod
        self.getMethod = getMethod
        self.quantity = quantity
        self.price = price
    }
    func getMyFavirite() {

    }
}
