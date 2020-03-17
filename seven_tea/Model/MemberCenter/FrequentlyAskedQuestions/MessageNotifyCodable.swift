//
//  MessageNotifyCodable.swift
//  NewSevenTea
//
//  Created by 資訊部 on 2019/2/7.
//  Copyright © 2019年 Future Third Party Payment. All rights reserved.
//

import Foundation
struct  MessageNotifyCodable: Codable {
    var result: Int
    var message: [message]?

    struct message: Codable {
        var id: Int
        var username: String
        var title: String
        var content: String
        var sender_name: String
        var send_time: String
    }

}
