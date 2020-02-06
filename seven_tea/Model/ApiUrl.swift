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
    var MemberRegisterUrl:String
    var ForgotPasswordSmsUrl:String
    var SendResetForgotPasswordUrl:String
    var RestPasswordUrl:String
    
    override init() {
        LoginUrl="\(DoMain)/api/new-login"
        MemberRegisterUrl="\(DoMain)/api/register"
        ForgotPasswordSmsUrl="\(DoMain)/api/send-forgot-password"
        SendResetForgotPasswordUrl="\(DoMain)/api/send-reset-password"
        RestPasswordUrl="\(DoMain)/api/reset-password"
    }
}
