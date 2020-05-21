//
//  ApiUrl.swift
//  seven_tea
//
//

import Foundation
import UIKit
class ApiUrl: NSObject {
    static let ApiUrlInstance = ApiUrl()
    var doMain: String = "http://127.0.0.1:8000"
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
    var districtTag: String
    var cityTag: String
    var getstore: String
    var verifyemail: String
    var gpsgetstore: String
    var getmenucategory: String
    var getmenuproduct: String
    var setverifyemail: String
    var feedbackoption: String
    var addtoshopingcar: String
    var addfavoriteitem: String
    var getshoppingcar: String
    var updateshoppingcar: String
    var updateitemtozero: String
    var synchornizememberinfo: String
    var confirmcartorder: String

    override init() {
        loginUrl="\(doMain)/api/login"
        sendMemberRegisterSmsUrl="\(doMain)/api/register/send-phone-sms"
        forgotPasswordSmsUrl="\(doMain)/api/send-forgot-password-sms"
        sendResetForgotPasswordUrl="\(doMain)/api/check-forgot-password-code"
        restPasswordUrl="\(doMain)/api/reset-password"
        signPhoneSendSmsUrl="\(doMain)/api/register/send-phone-sms"
        sendMemberRegistrUrl="\(doMain)/api/register/register-button"
        sendMemberRegisterInfoUrl="\(doMain)/api/register/send-register-info"
        memberInfoUrl="\(doMain)/api/get-member-all-info"
        myFavoriteDrinkInfoUrl="\(doMain)/api/get/my-favorite"
        MessageNotifyUrl="\(doMain)/api/member/message-notify"
        OrderRecordUrl="\(doMain)/api/get/orders/record/"
        ADUrl="\(doMain)/api/get/index/message"
        loadingBanner="\(doMain)/api/get-index-loading-banner/ios"
        marketingBanner="\(doMain)/api/get-index-marketing-banner/ios"
        slideBanner="\(doMain)/api/get-index-slide-banner/ios"
        promotionBanner="\(doMain)/api/get-index-promotion-banner"
        districtTag="\(doMain)/api/get-store-district-tag/"
        cityTag="\(doMain)/api/get-store-city-tag"
        getstore="\(doMain)/api/get-store-by-country-district/"
        verifyemail="\(doMain)/api/set-verify-email"
        gpsgetstore="\(doMain)/api/get-store-distance/"
        getmenucategory="\(doMain)/api/get-menu-category/"
        getmenuproduct="\(doMain)/api/get-menu-item/"
        setverifyemail="\(doMain)/api/set-verify-email"
        feedbackoption="\(doMain)/api/get-feedback-option"
        addtoshopingcar="\(doMain)/api/insert-item-into-cart"
        addfavoriteitem="\(doMain)/api/insert-item-into-favorite-item"
        getshoppingcar="\(doMain)/api/get-member-cart"
        updateshoppingcar="\(doMain)/api/update-cart-item-count"
        updateitemtozero="\(doMain)/api/update-cart-single-item-to-zero"
        synchornizememberinfo="\(doMain)/api/synchronize-member-info"
        confirmcartorder="\(doMain)/api/confirm-cart-order"
    }
}
