//
//  OpeningTime.swift
//  seven_tea
//
//  Created by harrison on 2020/4/17.
//  Copyright © 2020 harrison公司機. All rights reserved.
//

import Foundation
class OpeningTime: NSObject {
    var date = String()
    var end_time = String()
    var star_time = String()
    

    init(date : String , end_time : String, star_time : String) {
        self.date = date
        self.end_time = end_time
        self.star_time = star_time
    }
}
