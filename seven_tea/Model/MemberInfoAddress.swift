//
//  MemberInfoAddress.swift
//  seven_tea
//
//  Created by harrison on 2020/5/5.
//  Copyright © 2020 harrison公司機. All rights reserved.
//

import Foundation
class MemberInfoAddress{
    var id: String
    var zipcode: String
    var city: String
    var district: String
    var address: String
    init(id:String,zipcode:String,city:String,district:String,address:String) {
        self.id = id
        self.zipcode = zipcode
        self.city = city
        self.district = district
        self.address = address
    }
}