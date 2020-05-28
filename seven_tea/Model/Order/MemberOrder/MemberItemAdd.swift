//
//  MemberItemAdd.swift
//  seven_tea
//
//  Created by harrison on 2020/5/28.
//  Copyright © 2020 harrison公司機. All rights reserved.
//

import Foundation
class MemberItemAdd: Codable {
    var id: Int
    var name: String
    init(id: Int, name: String) {
        self.id = id
        self.name = name
    }
}
