//
//  ApiUrl.swift
//  seven_tea
//
//

import Foundation
import UIKit
class ApiUrl: NSObject {
    
    static let ApiUrlInstance = ApiUrl()
    var DoMain: String = "http://seventea.test/"
    var LoginUrl:String
    override init() {
        LoginUrl="\(DoMain)/api/new-login"
    }
}
