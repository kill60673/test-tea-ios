//
//  SlideBanner.swift
//  seven_tea
//
//  Created by harrison on 2020/4/14.
//  Copyright © 2020 harrison公司機. All rights reserved.
//

import Foundation
class SlideBanner: NSObject {
    var imageType = String()
    var pictureURL = String()
    var linkURL = String()
    
    init(imageType: String, pictureURL: String, linkURL: String) {
        self.imageType = imageType
        self.pictureURL = pictureURL
        self.linkURL = linkURL
    }
}
