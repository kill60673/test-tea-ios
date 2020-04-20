//
//  GetStore.swift
//  seven_tea
//
//  Created by harrison on 2020/4/17.
//  Copyright © 2020 harrison公司機. All rights reserved.
//

import Foundation
class GetStore: NSObject {
    var getstore_id = String()
    var storename = String()
    var address = String()
    var id_open = Bool()
    var opening_timer = [OpeningTime]()

    init(getstore_id : String , storename : String, address : String ,id_open : Bool , opening_timer: [OpeningTime]) {
        self.getstore_id = getstore_id
        self.storename = storename
        self.address = address
        self.id_open = id_open
        self.opening_timer = opening_timer
    }
}
