//
//  ApiUrl.swift
//  seven_tea
//
//

import Foundation
import UIKit
class ApiUrl : NSObject {
    
    static let ApiUrlInstance = ApiUrl()
    var DoMain: String = "http://seventea.test/"
    var LoginUrl:String
    var SendMemberRegisterSmsUrl:String
    var ForgotPasswordSmsUrl:String
    var SendResetForgotPasswordUrl:String
    var RestPasswordUrl:String
    var SignPhoneSendSmsUrl:String
    var SendMemberRegistrUrl:String
    var SendMemberRegisterInfoUrl:String
    
    override init() {
        LoginUrl="\(DoMain)/api/new-login"
        SendMemberRegisterSmsUrl="\(DoMain)/api/register/send-phone-sms"
        ForgotPasswordSmsUrl="\(DoMain)/api/send-forgot-password"
        SendResetForgotPasswordUrl="\(DoMain)/api/send-reset-password"
        RestPasswordUrl="\(DoMain)/api/reset-password"
        SignPhoneSendSmsUrl="\(DoMain)/api/register/send-phone-sms"
        SendMemberRegistrUrl="\(DoMain)/api/register/register-button"
        SendMemberRegisterInfoUrl="\(DoMain)/api/register/send-register-info"
        
    }
}
