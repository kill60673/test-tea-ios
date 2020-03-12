//
//  SetEmailViewController.swift
//  seven_tea
//
//  Created by harrison on 2020/3/10.
//  Copyright © 2020 harrison公司機. All rights reserved.
//

import UIKit
var setEmailView = UIViewController()
class SetEmailViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var tfEmail: UITextField!
    @IBOutlet weak var tfVerification_Code: UITextField!
    @IBOutlet weak var btSend: UIButton!
    @IBOutlet weak var btSendVerfication_code: UIButton!
    @IBOutlet weak var lbWarning: UILabel!
    var email = ""
    var varfication_code = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        btSend.customized_button(button: btSend)
        btSendVerfication_code.customized_button(button: btSendVerfication_code)
        tfEmail.delegate = self
        tfVerification_Code.delegate = self
        keyboad()
    }
    @IBAction func btSendVerfication_code(_ sender: Any) {
        self.email = tfEmail.text ?? ""
        lbWarning.text = ""
        predicatesFunc.getEmailSmsApi(email: email, lbMessage: lbWarning, btSendVerifyCode: btSend)
    }

    @IBAction func btSend(_ sender: Any) {
        self.email = tfEmail.text ?? ""
        self.varfication_code = tfVerification_Code.text ?? ""
        predicatesFunc.setEmail(email: email, emailVerfiCode: varfication_code, lbMessage: lbWarning)
    }
}
