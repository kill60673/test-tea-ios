//
//  SingUpCodable.swift
//  seven_tea
//
//

import UIKit
import Foundation

struct MemberRegisterSmsCodable: Codable {
    var success: Bool?
    var message: String
}
struct MemberRegisterSms: Codable {
    var phone: String
}
