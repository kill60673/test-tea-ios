//
//  ResetPasswordViewController.swift
//  seven_tea
//
//  Created by harrison on 2020/2/7.
//  Copyright © 2020 harrison公司機. All rights reserved.
//

import UIKit
var resetPassword: UIViewController!

class ResetPasswordViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var tfPassword: UITextField!
    @IBOutlet weak var tfAgainEnterPassword: UITextField!
    @IBOutlet weak var lbPrompt: UILabel!
    @IBOutlet weak var btSubmit: UIButton!
    var name = String()
    var phonenumber = String()
    var uservalidatorscode = String()

    override func viewDidLoad() {
        super.viewDidLoad()
        resetPassword = self
        //刻畫送出按鈕的樣式
        btSubmit.customized_button(button: btSubmit)

        tfPassword.delegate = self
        tfAgainEnterPassword.delegate = self

        keyboad()
    }

    // 2/13利用正規表示法來修正判斷式 已修正完成
    @IBAction func btSubmit(_ sender: Any) {
        let password = tfPassword.text ?? ""
        let againenterpassword = tfAgainEnterPassword.text ?? ""

        lbPrompt.text = ""

        //忘記密碼的重新設定密碼的func
        predicatesFunc.restPassword(password: password, againenterpassword: againenterpassword, lbPrompt: lbPrompt, uservalidatorscode: uservalidatorscode, name: name, phonenumber: phonenumber)
    }
}
