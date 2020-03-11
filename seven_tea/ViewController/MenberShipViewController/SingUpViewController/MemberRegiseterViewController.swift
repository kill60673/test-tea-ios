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
        predicatesFunc.getMemberSmsApi(phone: phone, lbMessage: lbMessage, btSendVerifyCode: btValidatorsCode)
    }

    // 2/13利用正規表示法來修正判斷式 已修正完成
    @IBAction func btSignUp(_ sender: Any) {
        self.validatorsCode = tfValidatorsCode.text ?? ""
        self.phone = tfPhone.text ?? ""

        lbMessage.text = ""
        lbValidatorsCode.text = ""

        predicatesFunc.sendMemberRegistr(validator_code: validatorsCode, phone: phone, lbMessage: lbMessage,controller: self)
    }
}
