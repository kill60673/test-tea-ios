//
//  GetMemberOderdDetailAddress.swift
//  seven_tea
//
//  Created by harrison on 2020/6/1.
//  Copyright © 2020 harrison公司機. All rights reserved.
//

import Foundation
class GetMemberOrderDetailAddress: Codable {
    var zipcode: String?
    var city : String?
    var district : String?
    var address: String
    init(zipcode:String,city:String,district:String,address:String) {
        self.zipcode = zipcode
        self.city = city
        self.district = district
        self.address = address
    }
}
