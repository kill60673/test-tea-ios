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
}
struct Loginmessage: Codable {
    var naem : String
    var password : String
}
