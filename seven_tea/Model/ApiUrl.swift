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
    var memberInfoUrl: String
    var myFavoriteDrinkInfoUrl: String
    var MessageNotifyUrl: String
    var OrderRecordUrl: String
    var ADUrl: String
    var loadingBanner: String
    var marketingBanner: String
    var slideBanner: String
    var promotionBanner: String

    override init() {
        loginUrl="\(doMain)/api/login"
        sendMemberRegisterSmsUrl="\(doMain)/api/register/send-phone-sms"
        forgotPasswordSmsUrl="\(doMain)/api/send-forgot-password-sms"
        sendResetForgotPasswordUrl="\(doMain)/api/check-forgot-password-code"
        restPasswordUrl="\(doMain)/api/reset-password"
        signPhoneSendSmsUrl="\(doMain)/api/register/send-phone-sms"
        sendMemberRegistrUrl="\(doMain)/api/register/register-button"
        sendMemberRegisterInfoUrl="\(doMain)/api/register/send-register-info"
        memberInfoUrl="\(doMain)/api/get/user/info"
        myFavoriteDrinkInfoUrl="\(doMain)/api/get/my-favorite"
        MessageNotifyUrl="\(doMain)/api/member/message-notify"
        OrderRecordUrl="\(doMain)/api/get/orders/record/"
        ADUrl="\(doMain)/api/get/index/message"
        loadingBanner="\(doMain)/get-index-loading-banner//get-index-loading-banner/ios"
        marketingBanner="\(doMain)/get-index-marketing-banner//get-index-marketing-banner/ios"
        slideBanner="\(doMain)/get-index-slide-banner//get-index-slide-banner/ios"
        promotionBanner="\(doMain)/get-index-promotion-banner"
    }
}
