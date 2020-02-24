//
//  VerificationCodeTimer.swift
//  seven_tea
//
//  Created by harrison on 2020/2/12.
//  Copyright © 2020 harrison公司機. All rights reserved.
//

import Foundation
import UIKit
var count: Int = 60
var timer: Timer?

// 驗證碼倒數的計時器class
// 2/13發現class傳值問題在 triggerTimer可以過 但是在selector:#selector會產生傳值問題而不能在show這個頁面ㄓ
class VerificationCodeTimer {
    var buttons = UIButton()
    @objc func showSmsCountDown(button: UIButton) {
//        print("這邊是第二個\(button)")
        button.setTitle("\(count)", for: .normal)
        count -= 1
        if count<=0 {
            button.setTitle("發送驗證碼", for: .normal)
            timer?.invalidate()
            timer = nil
            button.isEnabled = true
        }
    }

    @objc func triggerTimer(button: UIButton ) {
        button.isEnabled = false
//        print("這邊是第一個\(button)")
        count = 60
        //做bt裡面時間倒數 倒數完才可以使用
        timer = Timer.scheduledTimer(timeInterval: 1, target: button, selector: #selector(VerificationCodeTimer.showSmsCountDown(button:)), userInfo: nil, repeats: true)
//        print("我有跑到這裡")
    }
}
