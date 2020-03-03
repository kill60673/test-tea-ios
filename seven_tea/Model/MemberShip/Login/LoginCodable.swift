//
//  LoginCodable.swift
//  seven_tea
//
//

import UIKit

import Foundation
struct LoginCodable: Codable {
    var success: Bool?
    var message: String
    var data: Datas
}
struct Datas: Codable {
       var token: String
   }
struct Loginmessage: Codable {
    var username: String
    var password: String
}
