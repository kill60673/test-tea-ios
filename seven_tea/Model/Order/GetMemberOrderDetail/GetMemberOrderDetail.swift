//
//  GetMemberOrderDetail.swift
//  seven_tea
//
//  Created by harrison on 2020/6/1.
//  Copyright © 2020 harrison公司機. All rights reserved.
//

import Foundation
class GetMemberOrderDetail: Codable {
    var order_no: String
    var order_status: String
    var store: String
    var total_qty: Int
    var total_price: Int
    var recipient: String
    var recipient_tel: String
    var tax_code: String?
    var pay_method: String
    var note: String?
    var created_at: String
    var item: [GetMemberOrderDetailItem]
    var address: [GetMemberOrderDetailAddress]
    init(order_no: String, order_status: String, store: String, total_qty: Int, total_price: Int, item: [GetMemberOrderDetailItem], recipient: String, recipient_tel: String, tax_code: String, pay_method: String, note: String, created_at: String, address: [GetMemberOrderDetailAddress]) {
        self.order_no = order_no
        self.order_status = order_status
        self.store = store
        self.total_qty = total_qty
        self.total_price = total_price
        self.item = item
        self.recipient = recipient
        self.recipient_tel = recipient_tel
        self.tax_code = tax_code
        self.pay_method = pay_method
        self.note = note
        self.created_at = created_at
        self.address = address
    }
}
