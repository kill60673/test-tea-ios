//
//  SingUpViewController.swift
//  seven_tea
//
//

import Foundation
import UIKit
var memberRegisterMessage = GetMemberRegisterMessage()
var memberRegiseterView = UIViewController()

class MemberRegiseterViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var tfPhone: UITextField!
    @IBOutlet weak var tfValidatorsCode: UITextField!
    @IBOutlet weak var btValidatorsCode: UIButton!
    @IBOutlet weak var lbMessage: UILabel!
    @IBOutlet weak var lbValidatorsCode: UILabel!
    @IBOutlet weak var btSignUp: UIButton!
    var validatorsCode = String()
    var phone = String()

    override func viewDidLoad() {
        super.viewDidLoad()
        memberRegiseterView = self
        btValidatorsCode.customized_button(button: btValidatorsCode)
        btSignUp.customized_button(button: btSignUp)
        tfPhone.delegate = self
        tfValidatorsCode.delegate = self
        //使用手勢 用tap把鍵盤收起來
        keyboad()
    }

    // 2/13利用正規表示法來修正判斷式 已修正完成
    @IBAction func btVailidators_code(_ sender: UIButton) {
        let phone = tfPhone.text ?? ""
        //        let verifcationcode = VerificationCodeTimer()
        lbMessage.text = ""

        //計時器傳值問題尚未解開
        // 使用正規表示法來去判斷說 是否為正確輸入文字 以及是否為空
        if checkValidPhoneNumber(input: phone) == true {
            MemberRegiseterSmsApi.MemberRegisterSmsInstance.sendMemberRegisterSms(phone: phone)
            triggerTimer(button: btValidatorsCode)
        } else {
            lbMessage.text = regexmessage
            lbMessage.shake()
        }
    }

    // 2/13利用正規表示法來修正判斷式 已修正完成
    @IBAction func btSignUp(_ sender: Any) {
        self.validatorsCode = tfValidatorsCode.text ?? ""
        self.phone = tfPhone.text ?? ""

        lbMessage.text = ""
        lbValidatorsCode.text = ""

        predicatesFunc.sendMemberRegistr(validatorsCode: validatorsCode, phone: phone, lbMessage: lbMessage)
    }

    //timer計時器部分
    @objc func showSmsCountDown() {
        btValidatorsCode.setTitle("\(count)", for: .normal)
        count -= 1
        if count<=0 {
            btValidatorsCode.setTitle("發送驗證碼", for: .normal)
            timer?.invalidate()
            timer = nil
            btValidatorsCode.isEnabled = true
        }
    }
    //timer計時器部分
    @objc func triggerTimer(button: UIButton) {
        button.isEnabled = false
        count = 60
        //做bt裡面時間倒數 倒數完才可以使用
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.showSmsCountDown), userInfo: nil, repeats: true)
    }
}
