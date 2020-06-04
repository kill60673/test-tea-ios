//
//  GetFeedBack.swift
//  seven_tea
//
//  Created by harrison on 2020/6/3.
//  Copyright © 2020 harrison公司機. All rights reserved.
//

import Foundation
class GetFeedBack{
    var id : Int
    var update_time: String
    var title: String
    var content: String
    var reply: String
    var type: String
    var create_time: String
    init(id:Int,update_time:String,title:String,content:String,reply:String,type:String,create_time:String){
        self.id = id
        self.update_time = update_time
        self.title = title
        self.content = content
        self.reply = reply
        self.type = type
        self.create_time = create_time
    }
}
