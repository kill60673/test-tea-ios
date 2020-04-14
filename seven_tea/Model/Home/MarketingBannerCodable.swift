//
//  MarketingBannerCodable.swift
//  seven_tea
//
//  Created by harrison on 2020/4/14.
//  Copyright © 2020 harrison公司機. All rights reserved.
//

import Foundation
struct MarketingBanner: Codable {
    var success: Bool
    var message: String
    var data: [data]
    
    struct data: Codable {
        var img_type: String
        var picture_url: String
        var link_url: String
    }
}
