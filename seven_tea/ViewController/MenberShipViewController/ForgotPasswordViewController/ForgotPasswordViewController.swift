//
//  ForgotPasswordViewController.swift
//  seven_tea
//
//  Created by harrison on 2020/2/6.
//  Copyright © 2020 harrison公司機. All rights reserved.
//

import UIKit
var forgotPasswordView: UIViewController!
class ForgotPasswordViewController: UIViewController, UITextFieldDelegate {
    var count: Int = 60
    var timer: Timer?
    var account = ""
    var phone = ""
    var validatorsCode = ""
    @IBOutlet weak var tfUserName: UITextField!
    @IBOutlet weak var lbUserName: UILabel!
    @IBOutlet weak var tfPhone: UITextField!
    @IBOutlet weak var lbPhone: UILabel!
    @IBOutlet weak var tfValidatorsCode: UITextField!
    @IBOutlet weak var lbValidatorsCode: UILabel!
    @IBOutlet weak var btnNextStep: UIButton!
    @IBOutlet weak var btSendVerifyCode: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        forgotPasswordView = self
        btnNextStep.customized_button(button: btnNextStep)
        btSendVerifyCode.customized_button(button: btSendVerifyCode)

        tfPhone.delegate = self
        tfUserName.delegate = self
        tfValidatorsCode.delegate = self

        keyboad()
        //使用手勢 用tap把鍵盤收起來

    }

    // 2/13利用正規表示法來修正判斷式 已修正完成
    @IBAction func btSendSms(_ sender: Any) {
        self.account = tfUserName.text ?? ""
        self.phone = tfPhone.text ?? ""

        lbUserName.text = ""
        lbPhone.text = ""
//        triggerTimer(button: btSendVerifyCode)
        predicatesFunc.forgotPasswordSms(account: account, phone: phone, btSendVerifyCode: btSendVerifyCode, lbUserName: lbUserName, lbPhone: lbPhone)
    }

    // 2/13利用正規表示法來修正判斷式 已修正完成
    @IBAction func btNexStep(_ sender: Any) {
        self.account = tfUserName.text ?? ""
        self.phone = tfPhone.text ?? ""
        self.validatorsCode = tfValidatorsCode.text ?? ""

        lbUserName.text = ""
        lbValidatorsCode.text = ""
        lbPhone.text = ""

        predicatesFunc.sendResetForgotPasswordSms(account: account, phone: phone, validatorsCode: validatorsCode, lbUserName: lbUserName, lbPhone: lbPhone, lbValidatorsCode: lbValidatorsCode,controller: self)
    }

    //timer部分
//    @objc func showSmsCountDown() {
//        btSendVerifyCode.setTitle("\(count)", for: .normal)
//        count -=  1
//        if count<=0 {
//            btSendVerifyCode.setTitle("發送驗證碼", for: .normal)
//            timer?.invalidate()
//            timer = nil
//            btSendVerifyCode.isEnabled = true
//        }
//    }
//
//    //timer部分
//    @objc func triggerTimer(button: UIButton ) {
//        button.isEnabled = false
//        count = 60
//        //做bt裡面時間倒數 倒數完才可以使用
//        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.showSmsCountDown), userInfo: nil, repeats: true)
//    }
}
