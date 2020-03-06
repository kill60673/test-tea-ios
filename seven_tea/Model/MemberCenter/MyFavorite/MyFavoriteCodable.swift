//
//  MyFavoriteCodable.swift
//  seven_tea
//
//

import Foundation
struct MyFavoriteInfoCodable: Codable {

    var result: Int
    var message: [Message]?

    struct Message: Codable {

        var id: Int
        var product_name: String
        var product_type: String
        var size: String
        var sugar: String
        var temperature: String
        var quantity: Int
        var total_price: Int
        var single_price: Int
        var store: String
        var store_id: String
        var name: String
        var add: String

    }

}
