//
//  GetMenuProduct.swift
//  seven_tea
//
//  Created by harrison on 2020/4/25.
//  Copyright © 2020 harrison公司機. All rights reserved.
//

import Foundation
class GetMenuProduct {
    var id = String()
    var item_name = String()
    var picture_url = String()

    init(id: String, item_name: String, picture_url: String) {
        self.id = id
        self.item_name = item_name
        self.picture_url = picture_url
    }
}
