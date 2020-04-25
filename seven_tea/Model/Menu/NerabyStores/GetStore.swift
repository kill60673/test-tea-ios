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
    var tel = String()
    var address = String()
    var is_open = Bool()
    var opening_timer: OpeningTime?

    init(getstore_id: Int, tel: String, storename: String, address: String, is_open: Bool, open_time_date: String, end_time: String, start_time: String) {
        self.getstore_id = getstore_id
        self.storename = storename
        self.tel = tel
        self.address = address
        self.is_open = is_open
        self.opening_timer = OpeningTime(date: open_time_date, end_time: end_time, start_time: start_time)
    }

   func getOpentime() -> String {

        return opening_timer!.getOpentime()

    }

}
