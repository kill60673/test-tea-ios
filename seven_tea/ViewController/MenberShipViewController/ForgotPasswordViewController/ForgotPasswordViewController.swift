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
    var account = ""
    var phone = ""
    var validators_code = ""
    @IBOutlet weak var tfUserName: UITextField!
    @IBOutlet weak var lbUserName: UILabel!
    @IBOutlet weak var tfPhone: UITextField!
    @IBOutlet weak var lbPhone: UILabel!
    @IBOutlet weak var tfValidators_Code: UITextField!
    @IBOutlet weak var lbValidators_Code: UILabel!
    @IBOutlet weak var btnNextStep: UIButton!
    @IBOutlet weak var btSendVerifyCode: UIButton!
    
    override func viewDidLoad()
    {
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
    @objc func dismissKeyBoard()
    {
        self.view.endEditing(true)
    }
    // 2/13利用正規表示法來修正判斷式 已修正完成
    @IBAction func btSendSms(_ sender: Any)
    {
        self.account = tfUserName.text ?? ""
        self.phone = tfPhone.text ?? ""
        //        let verificationcode = VerificationCodeTimer()
        lbUserName.text = ""
        lbPhone.text = ""
        if(checkValidAccount(input: account) == true && checkValidPhoneNumber(input: phone) == true)
        {
            //            ForgotPasswordSmsAPI.ForgotPasswordSmsInstance.ForgotPasswordSms(Username: account , Phone : phone)
            triggerTimer(button: btSendVerifyCode)
        }
        else if (checkValidAccount(input: account) == false )
        {
            if(account == "")
            {
                lbUserName.text = regex_message
                lbUserName.shake()
            }
            else
            {
                print("這邊是帳號驗證"+regex_message)
                lbUserName.text = "格式錯誤請重新輸入"
                lbUserName.shake()
            }
        }
        else if(checkValidPhoneNumber(input: phone) == false)
        {
            if(phone == "")
            {
                lbPhone.text = regex_message
                lbPhone.shake()
            }
            else
            {
                print("這邊是電話驗證"+regex_message)
                lbPhone.text = "格式錯誤請重新輸入"
                lbPhone.shake()
            }
        }
    }
    // 2/13利用正規表示法來修正判斷式 已修正完成
    @IBAction func btNexStep(_ sender: Any)
    {
        self.account = tfUserName.text ?? ""
        self.phone = tfPhone.text ?? ""
        self.validators_code = tfValidators_Code.text ?? ""
        lbUserName.text = ""
        lbValidators_Code.text = ""
        lbPhone.text = ""
        if(checkValidAccount(input: account) == true && checkValidPhoneNumber(input: phone) == true && checkValidVerificationCode(input: validators_code) == true)
        {
            SendResetForgotPasswordSmsAPI.SendResetForgotPasswordSmsInstance.SendResetForgotPasswordSms(Username: account, Phone: phone, Validators_code: validators_code) { (result) in
                if result
                {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5)
                    {
                        self.jump()
                    }
                }
            }
        }
        else if (checkValidAccount(input: account) == false )
        {
            if(account == "")
            {
                lbUserName.text = regex_message
                lbUserName.shake()
            }
            else
            {
                print("這邊是帳號驗證"+regex_message)
                lbUserName.text = "格式錯誤請重新輸入"
                lbUserName.shake()
            }
        }else if(checkValidPhoneNumber(input: phone) == false){
            if(phone == "")
            {
                lbPhone.text = regex_message
                lbPhone.shake()
            }
            else
            {
                print("這邊是電話驗證"+regex_message)
                lbPhone.text = "格式錯誤請重新輸入"
                lbPhone.shake()
            }
        }
        else if(checkValidVerificationCode(input: validators_code) == false)
        {
            if(validators_code == "")
            {
                lbValidators_Code.text = regex_message
                lbValidators_Code.shake()
            }
            else
            {
                print("這邊是電話驗證"+regex_message)
                lbValidators_Code.text = "格式錯誤請重新輸入"
                lbValidators_Code.shake()
            }
        }
    }
    //timer部分
    @objc func showSmsCountDown(){
        btSendVerifyCode.setTitle("\(count)", for: .normal)
        count = count - 1
        if count<=0
        {
            btSendVerifyCode.setTitle("發送驗證碼", for: .normal)
            timer?.invalidate()
            timer = nil
            btSendVerifyCode.isEnabled = true
        }
    }
    //timer部分
    @objc func triggerTimer(button : UIButton ){
        button.isEnabled = false
        count = 60
        //做bt裡面時間倒數 倒數完才可以使用
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector:#selector(self.showSmsCountDown), userInfo: nil, repeats: true)
    }
    //跳轉頁面以及送資料的部分
    func jump(){
        let vc = storyboard?.instantiateViewController(withIdentifier: "RestPassword") as! ResetPasswordViewController
        vc.name = account
        vc.phonenumber = phone
        vc.uservalidatorscode = validators_code
        show(vc, sender: self)
    }
    
    
}
// DispatchQueue.main.asyncAfter(deadline: .now() + 0.5)
