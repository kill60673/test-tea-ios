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
        btnNextStep.customized_button(button: btnNextStep)
        btSendVerifyCode.customized_button(button : btSendVerifyCode)
        
        tfPhone.delegate = self
        tfUserName.delegate = self
        tfValidators_Code.delegate = self
        
        keyboad()
        //使用手勢 用tap把鍵盤收起來
       
    }

    // 2/13利用正規表示法來修正判斷式 已修正完成
    @IBAction func btSendSms(_ sender : Any)
    {
        self.account = tfUserName.text ?? ""
        self.phone = tfPhone.text ?? ""
        
        lbUserName.text = ""
        lbPhone.text = ""
        
        predicates_func.ForgotPasswordSms(account : account , phone : phone , btSendVerifyCode : btSendVerifyCode , lbUserName : lbUserName , lbPhone : lbPhone)
    }
    
    // 2/13利用正規表示法來修正判斷式 已修正完成
    @IBAction func btNexStep(_ sender : Any)
    {
        self.account = tfUserName.text ?? ""
        self.phone = tfPhone.text ?? ""
        self.validators_code = tfValidators_Code.text ?? ""
        
        lbUserName.text = ""
        lbValidators_Code.text = ""
        lbPhone.text = ""
        
        predicates_func.SendResetForgotPasswordSms(account : account , phone : phone , validators_code : validators_code , lbUserName : lbUserName , lbPhone : lbPhone , lbValidators_Code : lbValidators_Code)
    }
    
    //timer部分
    @objc func showSmsCountDown(){
        btSendVerifyCode.setTitle("\(count)" , for : .normal)
        count = count - 1
        if count<=0
        {
            btSendVerifyCode.setTitle("發送驗證碼" , for : .normal)
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
        timer = Timer.scheduledTimer(timeInterval : 1 , target : self , selector : #selector(self.showSmsCountDown) , userInfo : nil , repeats : true)
    }
}
