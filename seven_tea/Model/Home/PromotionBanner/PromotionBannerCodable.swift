//
//  PromotionBannerCodable.swift
//  seven_tea
//
//  Created by harrison on 2020/4/14.
//  Copyright © 2020 harrison公司機. All rights reserved.
//

import Foundation
struct PromotionBannerCodable: Codable {
    var success: Bool
    var message: String
    var data: [picture]

    struct picture: Codable {
        var picture_url: String?
    }
}
