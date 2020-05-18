//
//  GetFeedList.swift
//  seven_tea
//
//  Created by harrison on 2020/5/18.
//  Copyright © 2020 harrison公司機. All rights reserved.
//

import Foundation
class GetFeedList{
    var feed = [String]()
    var itemIndexId = Int()
    init(feed:[String],itemIndexId:Int) {
        self.feed = feed
        self.itemIndexId = itemIndexId
    }
}
