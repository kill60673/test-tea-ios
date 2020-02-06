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
    var data: Data
}
struct Loginmessage: Codable {
    var username : String
    var password : String
}
