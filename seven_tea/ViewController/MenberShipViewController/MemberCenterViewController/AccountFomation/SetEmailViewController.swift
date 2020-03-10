//
//  SetEmailViewController.swift
//  seven_tea
//
//  Created by harrison on 2020/3/10.
//  Copyright © 2020 harrison公司機. All rights reserved.
//

import UIKit
var setEmailView = UIViewController()
class SetEmailViewController: UIViewController , UITextFieldDelegate{
    @IBOutlet weak var tfEmail: UITextField!
    @IBOutlet weak var tfVerification_Code: UITextField!
    @IBOutlet weak var btSend: UIButton!
    @IBOutlet weak var btSendVerfication_code: UIButton!
    @IBOutlet weak var lbWarring: UILabel!
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
        lbWarring.text = ""
        predicatesFunc.getEmailSmsApi(email: email, lbMessage: lbWarring)
        triggerTimer(button: btSendVerfication_code)
    }
    
    @IBAction func btSend(_ sender: Any) {
        self.email = tfEmail.text ?? ""
        self.varfication_code = tfVerification_Code.text ?? ""
        predicatesFunc.setEmail(email: email, emailVerfiCode: varfication_code, lbMessage: lbWarring)
    }
    //timer部分
     @objc func showSmsCountDown() {
         btSendVerfication_code.setTitle("\(count)", for: .normal)
         count -=  1
         if count<=0 {
             btSendVerfication_code.setTitle("發送驗證碼", for: .normal)
             timer?.invalidate()
             timer = nil
             btSendVerfication_code.isEnabled = true
         }
     }

     //timer部分
     @objc func triggerTimer(button: UIButton ) {
         button.isEnabled = false
         count = 60
         //做bt裡面時間倒數 倒數完才可以使用
         timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.showSmsCountDown), userInfo: nil, repeats: true)
     }
}
