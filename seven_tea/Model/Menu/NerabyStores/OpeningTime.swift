//
//  openingtime.swift
//  seven_tea
//
//  Created by harrison on 2020/4/21.
//  Copyright © 2020 harrison公司機. All rights reserved.
//

import Foundation
class OpeningTime {
    var date = String()
    var end_time = String()
    var start_time = String()

    init(date: String, end_time: String, start_time: String) {
        self.date = date
        self.end_time = end_time
        self.start_time = start_time
    }
    public func getOpentime() -> String {

        return "hello"

    }

}
