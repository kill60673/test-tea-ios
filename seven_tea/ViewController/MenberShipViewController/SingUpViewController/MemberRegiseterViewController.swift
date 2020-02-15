//
//  SingUpViewController.swift
//  seven_tea
//
//

import Foundation
import UIKit

var MemberRegiseterView = UIViewController()
class MemberRegiseterViewController: UIViewController ,UITextFieldDelegate {
    
    
    @IBOutlet weak var tfPhone: UITextField!
    @IBOutlet weak var tfValidators_Code: UITextField!
    @IBOutlet weak var btValidators_Code: UIButton!
    @IBOutlet weak var lbMessage: UILabel!
    @IBOutlet weak var lbValidators_Code: UILabel!
    @IBOutlet weak var btSignUp: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        MemberRegiseterView = self
        btValidators_Code.customized_button(button: btValidators_Code)
        btSignUp.customized_button(button: btSignUp)
        dismissKeyBoard()
        tfPhone.delegate = self
        tfValidators_Code.delegate = self
        
        //使用手勢 用tap把鍵盤收起來
        keyboad()
    }
    func textFieldShouldReturn(_ textField : UITextField) -> Bool
    {
        textField.resignFirstResponder()
        return true
    }
    
    // 2/13利用正規表示法來修正判斷式 已修正完成
    @IBAction func btVailidators_code(_ sender : UIButton) {
        let phone = tfPhone.text ?? ""
        //        let verifcationcode = VerificationCodeTimer()
        lbMessage.text = ""
        
        // 使用正規表示法來去判斷說 是否為正確輸入文字 以及是否為空
        if checkValidPhoneNumber(input : phone) == true
        {
            MemberRegiseterSmsApi.MemberRegisterSmsInstance.SendMemberRegisterSms(Phone : phone)
            triggerTimer(button : btValidators_Code)
        }
        else
        {
                lbMessage.text = regex_message
                lbMessage.shake()
        }
    }
    
    // 2/13利用正規表示法來修正判斷式 已修正完成
    @IBAction func btSignUp(_ sender : Any) {
        let validators_code = tfValidators_Code.text ?? ""
        let phone = tfPhone.text ?? ""
        
        lbMessage.text = ""
        lbValidators_Code.text = ""
        
        if ((checkValidVerificationCode(input : validators_code) == true) && (checkValidPhoneNumber(input: phone) == true))
        {
            SendMemberRegistrApi.MemberRegisterInstance.SendMemberRegister(Phone : phone, Validators_code : validators_code)
            {
                (result) in
                if result
                {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5)
                    {
                        self.jump()
                    }
                }
            }
        }
        else if (checkValidPhoneNumber(input: phone) == false)
        {
           lbMessage.text = regex_message
           lbMessage.shake()
        }
        else if (checkValidVerificationCode(input: validators_code) == false)
               {
                   lbMessage.text = regex_message
                   lbMessage.shake()
               }
    }
    //跳轉頁面的部分以及傳送檔案
    func jump(){
        let vc = storyboard?.instantiateViewController(withIdentifier: "SendMemberRegistr") as! SendMemberRegistrViewController
        vc.phone = tfPhone.text!
        vc.uservalidatorscode = tfValidators_Code.text!
        show(vc, sender: self)
    }
    //timer計時器部分
    @objc func showSmsCountDown()
    {
        btValidators_Code.setTitle("\(count)", for: .normal)
        count = count - 1
        if count<=0{
            btValidators_Code.setTitle("發送驗證碼", for: .normal)
            timer?.invalidate()
            timer = nil
            btValidators_Code.isEnabled = true
        }
    }
    //timer計時器部分
    @objc func triggerTimer(button: UIButton){
        button.isEnabled = false
        count = 60
        //做bt裡面時間倒數 倒數完才可以使用
        timer = Timer.scheduledTimer(timeInterval : 1, target : self , selector:#selector(self.showSmsCountDown) , userInfo : nil, repeats : true)
    }
    
}






