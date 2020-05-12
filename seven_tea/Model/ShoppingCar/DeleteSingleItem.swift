//
//  File.swift
//  seven_tea
//
//  Created by harrison on 2020/5/12.
//  Copyright © 2020 harrison公司機. All rights reserved.
//

import Foundation
struct DeleteSingleItemCodable:Codable  {
    var success: Bool
    var message: String
    var data: String
}
struct DeleteSingleItem: Codable{
    var id:Int
}
