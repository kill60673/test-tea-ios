//
//  ForgotPasswordViewController.swift
//  seven_tea
//
//  Created by harrison on 2020/2/6.
//  Copyright © 2020 harrison公司機. All rights reserved.
//

import UIKit
var ForgotPasswordView:UIViewController!
class ForgotPasswordViewController: UIViewController ,UITextFieldDelegate {
    var count:Int = 60
    var timer:Timer?
  
    @IBOutlet weak var tfUserName: UITextField!
    @IBOutlet weak var lbUserName: UILabel!
    @IBOutlet weak var tfPhone: UITextField!
    @IBOutlet weak var lbPhone: UILabel!
    @IBOutlet weak var tfValidators_Code: UITextField!
    @IBOutlet weak var lbValidators_Code: UILabel!
    @IBOutlet weak var btnNextStep: UIButton!
    @IBOutlet weak var btSendVerifyCode: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ForgotPasswordView = self
        btnNextStep.layer.borderWidth = 1.0//外框粗度
        btnNextStep.layer.cornerRadius = 5//圓角
        tfPhone.delegate = self
        tfUserName.delegate = self
        tfValidators_Code.delegate = self
        //使用手勢 用tap把鍵盤收起來
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyBoard))
        self.view.addGestureRecognizer(tap) // to Replace "TouchesBegan"
        // Do any additional setup after loading the view.
    }
    // 關掉鍵盤
    @objc func dismissKeyBoard() {
        self.view.endEditing(true)
    }
    
    @IBAction func btSendSms(_ sender: Any) {
        let account = tfUserName.text ?? ""
        let phone = tfPhone.text ?? ""
        lbUserName.text = ""
        lbPhone.text = ""
        if(account != "" && phone != "")
        {
            ForgotPasswordSmsAPI.ForgotPasswordSmsInstance.ForgotPasswordSms(Username: account , Phone : phone)
            self.btSendVerifyCode.isEnabled = false
            self.count = 60
            //做bt裡面時間倒數 倒數完才可以使用
            self.timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector:#selector(self.ShowSmsCountDown), userInfo: nil, repeats: true)
        }
        else if (account == "" && phone == "")
        {
            lbUserName.text = ""
            lbPhone.text = ""
            lbUserName.text = "＊帳號不可為空"
            lbUserName.shake()
            lbPhone.text = "＊電話號碼不可為空"
            lbPhone.shake()
        }else if(account == ""){
            lbUserName.text = ""
            lbPhone.text = ""
            lbUserName.text = "＊帳號不可為空"
            lbUserName.shake()
        }else if(phone == ""){
            lbUserName.text = ""
            lbPhone.text = ""
            lbPhone.text = "＊電話號碼不可為空"
            lbPhone.shake()
        }
    }
    
    @IBAction func btNexStep(_ sender: Any) {
        let account = tfUserName.text ?? ""
        let phone = tfPhone.text ?? ""
        let validators_code = tfValidators_Code.text ?? ""
        lbUserName.text = ""
        lbValidators_Code.text = ""
        lbPhone.text = ""
        if(account != "" && phone != "" && validators_code != "")
        {
        SendResetForgotPasswordSmsAPI.SendResetForgotPasswordSmsInstance.SendResetForgotPasswordSms(Username: account, Phone: phone, Validators_code: validators_code)
            print(validators_code)
            let vc = storyboard?.instantiateViewController(withIdentifier: "RestPassword") as! ResetPasswordViewController
            vc.name = account
            vc.phonenumber = phone
            vc.uservalidatorscode = validators_code
            show(vc, sender: self)

        }
        else if (account == "" && phone == "" && validators_code == ""){
            lbUserName.text = ""
            lbPhone.text = ""
            lbValidators_Code.text = ""
            lbUserName.text = "＊帳號不可為空"
            lbUserName.shake()
            lbPhone.text = "＊電話號碼不可為空"
            lbPhone.shake()
            lbValidators_Code.text = "＊請輸入電話驗證碼"
            lbValidators_Code.shake()
        }else if(account == "" && phone == ""){
            lbUserName.text = ""
            lbPhone.text = ""
            lbValidators_Code.text = ""
            lbPhone.text = "＊電話號碼不可為空"
            lbPhone.shake()
            lbUserName.text = "＊帳號不可為空"
            lbUserName.shake()
        }else if (account == "" && validators_code == "") {
            lbUserName.text = ""
            lbPhone.text = ""
            lbValidators_Code.text = ""
            lbUserName.text = "＊帳號不可為空"
            lbUserName.shake()
            lbValidators_Code.text = "驗證碼不可為空"
            lbValidators_Code.shake()
        }else if (phone == "" && validators_code == "") {
            lbUserName.text = ""
            lbPhone.text = ""
            lbValidators_Code.text = ""
            lbPhone.text = "＊電話號碼不可為空"
            lbPhone.shake()
            lbValidators_Code.text = "＊驗證碼不可為空"
            lbValidators_Code.shake()
        }else if(account == ""){
            lbUserName.text = ""
            lbPhone.text = ""
            lbValidators_Code.text = ""
            lbUserName.text = "＊帳號不可為空"
            lbUserName.shake()
        }else if(phone == ""){
            lbUserName.text = ""
            lbPhone.text = ""
            lbValidators_Code.text = ""
            lbPhone.text = "＊電話號碼不可為空"
            lbPhone.shake()
        }else if(validators_code == ""){
            lbPhone.text = ""
            lbUserName.text = ""
            lbValidators_Code.text = ""
            lbValidators_Code.text = "＊請輸入電話驗證碼"
            lbValidators_Code.shake()
        }
    }
    
    @objc func ShowSmsCountDown()
    {
        btSendVerifyCode.setTitle("\(count)", for: .normal)
        count = count - 1
        if count<=0{
            btSendVerifyCode.setTitle("發送驗證碼", for: .normal)
            timer?.invalidate()
            timer = nil
            btSendVerifyCode.isEnabled = true
        }
    }
}
