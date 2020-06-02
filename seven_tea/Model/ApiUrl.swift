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
    var loginUrl: String //會員-登入
    var sendMemberRegisterSmsUrl: String //會員-註冊-驗證碼-簡訊發送
    var forgotPasswordSmsUrl: String //忘記密碼-傳送手機驗證碼
    var sendResetForgotPasswordUrl: String //忘記密碼-確認忘記密碼驗證資訊
    var restPasswordUrl: String //忘記密碼-設定新密碼
    var sendMemberRegistrUrl: String //會員-註冊-送出註冊資訊
    var sendMemberRegisterInfoUrl: String //舊有使用需盤點
    var memberInfoUrl: String //會員中心-帳戶資料-取得會員詳細資料
    var myFavoriteDrinkInfoUrl: String //舊 有使用需盤點
    var MessageNotifyUrl: String //舊 有使用需盤點
    var OrderRecordUrl: String //舊 有使用需盤點
    var loadingBanner: String //換頁圖片-取得換頁圖片
    var marketingBanner: String //促銷圖片-取得促銷圖片
    var slideBanner: String //促銷圖片-取得首頁slideshow圖片
    var promotionBanner: String //促銷圖片-取得首頁本月推薦圖片
    var districtTag: String //標籤-店家鄉鎮市區標籤
    var cityTag: String //標籤-店家城市標籤
    var getstore: String //首頁-選擇店家-透過縣市或鄉鎮市取得門店資料
    var verifyemail: String //會員中心-帳戶資料-綁定信箱-發送信箱驗證信
    var gpsgetstore: String //首頁-選擇店家-透過gps取得門店資料
    var getmenucategory: String //首頁-選擇分類-透過店家取得分類資料
    var getmenuproduct: String //首頁-選擇商品-透過店家及分類取得商品資料
    var setverifyemail: String //會員中心-帳戶資料-綁定信箱-修改驗證信箱
    var feedbackoption: String //會員中心-常見問題-取得意見回饋分類
    var addtoshopingcar: String //訂單-購物車-新增飲品至購物車
    var addfavoriteitem: String //會員中心-我的最愛-加入我的最愛飲品
    var getshoppingcar: String //訂單-購物車-取得會員購物車
    var updateshoppingcar: String //訂單-購物車-更新購物車中飲品數量
    var updateitemtozero: String //訂單-購物車-刪除購物車中單筆飲品
    var synchornizememberinfo: String //訂單-訂單確認-同步帳號資訊
    var confirmcartorder: String //訂單-訂單確認-確認訂單
    var getmemberneworder: String //訂單-訂單查詢-待確認訂單
    var getmemberconfirmorder: String //訂單-訂單查詢-已確認訂單
    var getmemberindeliveryorder: String //訂單-訂單查詢-外送中訂單
    var getmemberindeliveryorderdetail: String //訂單-訂單查詢-外送中訂單詳細資訊
    var getmembercompleteorder: String //訂單-訂單查詢-已完成訂單
    var getmembercancelorder: String //訂單-訂單查詢-已取消訂單
    var getmemberorderdetail: String //訂單-訂單查詢-取得訂單詳細資料
    var cancelorder: String //訂單-訂單查詢-取消訂單
    //api/register/check-register-code 會員-註冊-傳送手機及驗證碼 少這隻

    override init() {
        loginUrl="\(doMain)/api/login"
        sendMemberRegisterSmsUrl="\(doMain)/api/register/send-phone-sms"
        forgotPasswordSmsUrl="\(doMain)/api/send-forgot-password-sms"
        sendResetForgotPasswordUrl="\(doMain)/api/check-forgot-password-code"
        restPasswordUrl="\(doMain)/api/reset-password"
        sendMemberRegistrUrl="\(doMain)/api/register/register"
        sendMemberRegisterInfoUrl="\(doMain)/api/register/send-register-info"
        memberInfoUrl="\(doMain)/api/get-member-all-info"
        myFavoriteDrinkInfoUrl="\(doMain)/api/get/my-favorite"
        MessageNotifyUrl="\(doMain)/api/member/message-notify"
        OrderRecordUrl="\(doMain)/api/get/orders/record/"
        loadingBanner="\(doMain)/api/get-index-loading-banner/ios"
        marketingBanner="\(doMain)/api/get-index-marketing-banner/ios"
        slideBanner="\(doMain)/api/get-index-slide-banner/ios"
        promotionBanner="\(doMain)/api/get-index-promotion-banner"
        districtTag="\(doMain)/api/get-store-district-tag/"
        cityTag="\(doMain)/api/get-store-city-tag"
        getstore="\(doMain)/api/get-store-by-country-district/"
        verifyemail="\(doMain)/api/send-verify-email"
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
        getmemberneworder="\(doMain)/api/get-member-new-order"
        getmemberconfirmorder="\(doMain)/api/get-member-confirm-order"
        getmemberindeliveryorder="\(doMain)/api/get-member-in-delivery-order"
        getmemberindeliveryorderdetail="\(doMain)/api/get-member-in-delivery-order-detail/"
        getmembercompleteorder="\(doMain)/api/get-member-complete-order"
        getmembercancelorder="\(doMain)/api/get-member-cancel-order"
        getmemberorderdetail="\(doMain)/api/get-member-order-detail/"
        cancelorder="\(doMain)/api/cancel-order"
    }
}
