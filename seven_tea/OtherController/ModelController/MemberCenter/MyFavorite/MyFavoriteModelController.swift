//
//  MyFavoriteModelController.swift
//  seven_tea
//
//

import Foundation
import UIKit
func getAddFavoriteMessage(item_id: Int, item_name: String, item_category: Int, tmp: String, sugar: String, size: String, add: [String], store_id: Int, price: Int) {
    let postString  = AddMyFavorite(item_id: item_id, item_name: item_name, item_category: item_category, tmp: tmp, sugar: sugar, size: size, add: add, store_id: store_id, price: price)
    let encoder = JSONEncoder()
    if let data = try? encoder.encode(postString) {
        print(postString)
        datas = data
        print(data)
        if UserInfo.UserInfoInstance.preferences.object(forKey: "token") as? String == nil {
            print("is nil")
        }
        print("dddd", UserInfo.UserInfoInstance.preferences.object(forKey: "token") as! String)
        AddMyFavoriteApi.AddMyFavoriteInstance.addmyfavorite(token: UserInfo.UserInfoInstance.preferences.object(forKey: "token") as! String) {(result) in
            if result {

                return
            } else {
            }
        }
    }
}
