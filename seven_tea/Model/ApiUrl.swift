//
//  ApiUrl.swift
//  seven_tea
//
//

import Foundation
import UIKit
class ApiUrl: NSObject {
    static let ApiUrlInstance = ApiUrl()
    var doMain: String = "http://seventea.test/"
    var loginUrl: String
    var sendMemberRegisterSmsUrl: String
    var forgotPasswordSmsUrl: String
    var sendResetForgotPasswordUrl: String
    var restPasswordUrl: String
    var signPhoneSendSmsUrl: String
    var sendMemberRegistrUrl: String
    var sendMemberRegisterInfoUrl: String

    override init() {
        loginUrl="\(doMain)/api/new-login"
        sendMemberRegisterSmsUrl="\(doMain)/api/register/send-phone-sms"
        forgotPasswordSmsUrl="\(doMain)/api/send-forgot-password"
        sendResetForgotPasswordUrl="\(doMain)/api/send-reset-password"
        restPasswordUrl="\(doMain)/api/reset-password"
        signPhoneSendSmsUrl="\(doMain)/api/register/send-phone-sms"
        sendMemberRegistrUrl="\(doMain)/api/register/register-button"
        sendMemberRegisterInfoUrl="\(doMain)/api/register/send-register-info"
    }
}
