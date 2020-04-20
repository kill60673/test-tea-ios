//
//  GetStore.swift
//  seven_tea
//
//  Created by harrison on 2020/4/17.
//  Copyright © 2020 harrison公司機. All rights reserved.
//

import Foundation
class GetStore: NSObject {
    var getstore_id = Int()
    var storename = String()
    var address = String()
    var id_open = Bool()
    var opening_timer = [Any]()

    init(getstore_id: Int, storename: String, address: String, id_open: Bool, opening_time: Any) {
        self.getstore_id = getstore_id
        self.storename = storename
        self.address = address
        self.id_open = id_open
        self.opening_timer = [opening_time]
    }
}
