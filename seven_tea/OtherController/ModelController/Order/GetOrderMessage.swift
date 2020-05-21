//
//  GetOrderMessage.swift
//  seven_tea
//
//  Created by harrison on 2020/5/19.
//  Copyright © 2020 harrison公司機. All rights reserved.
//

import Foundation
import UIKit
func ConfirmCartOrderMessage(store_id: Int, total_qty: Int, total_price: Int, get_method: String, arrival_time: String, recipient: String, recipient_tel: String, tax_code: String, pay_method: String, item: [ConfirmCartitem], address: [SynchronizeMemberAddress]) {
    let postString  = ConfirmCartOrder(store_id: store_id, total_qty: total_qty, total_price: total_price, get_method: get_method, arrival_time: arrival_time, recipient: recipient, recipient_tel: recipient_tel, tax_code: tax_code, pay_method: pay_method, item: item, address: address)
    let encoder = JSONEncoder()
    if let data = try? encoder.encode(postString) {
        print("ㄏㄏ", postString)
        datas = data
        print(data)
        if UserInfo.UserInfoInstance.preferences.object(forKey: "token") as? String == nil {
            print("is nil")
        }
        print("dddd", UserInfo.UserInfoInstance.preferences.object(forKey: "token") as! String)
        ConfirmCartOrderApi.ConfirmCartOrderApiInstance.confirmcartorder(token: UserInfo.UserInfoInstance.preferences.object(forKey: "token") as! String) {(result) in
            if result {
                return
            } else {
            }
        }

    }
}
