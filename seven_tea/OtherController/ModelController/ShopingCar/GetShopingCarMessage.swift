//
//  GetShopingMessage.swift
//  seven_tea
//
//  Created by harrison on 2020/5/4.
//  Copyright © 2020 harrison公司機. All rights reserved.
//

import Foundation
import UIKit
func getAddShopingCarMessage(item_id: Int, item_name: String, item_category: Int, tmp: String, sugar: String, size: String, add: [String], store_id: Int, qty: Int, total_price: Int) {
    let postString  = AddShoppingCar(item_id: item_id, item_name: item_name, item_category: item_category, tmp: tmp, sugar: sugar, size: size, add: add, store_id: store_id, qty: qty, total_price: total_price)
    let encoder = JSONEncoder()
    if let data = try? encoder.encode(postString) {
        print(postString)
        datas = data
        print(data)
        if UserInfo.UserInfoInstance.preferences.object(forKey: "token") as? String == nil {
            print("is nil")
        }
        print("dddd", UserInfo.UserInfoInstance.preferences.object(forKey: "token") as! String)
        AddShoppingCarApi.AddShoppingCarInstance.addshoppingcar(token: UserInfo.UserInfoInstance.preferences.object(forKey: "token") as! String) {(result) in
            if result {
                   feed.removeAll()
                return
            } else {
            }
        }
    }
}
func upDateShoppingCarMessage(params: [Params]) {
     let postString  = UpdateShoppingParams(params: params)
        let encoder = JSONEncoder()
        if let data = try? encoder.encode(postString) {
            print(postString)
            datas = data
            print(data)
            if UserInfo.UserInfoInstance.preferences.object(forKey: "token") as? String == nil {
                print("is nil")
            }
            print("dddd", UserInfo.UserInfoInstance.preferences.object(forKey: "token") as! String)
            UpdateShoppingCarApi.UpdateShoppingCarInstance.updateshoppingcar(token: UserInfo.UserInfoInstance.preferences.object(forKey: "token") as! String) {(result) in
                if result {

                    return
                } else {
                }
            }
        }
    }
