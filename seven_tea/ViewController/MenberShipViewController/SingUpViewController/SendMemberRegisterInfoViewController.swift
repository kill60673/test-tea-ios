//
//  SendMemberRegisterInfoViewController.swift
//  seven_tea
//
//  Created by harrison on 2020/2/10.
//  Copyright © 2020 harrison公司機. All rights reserved.
//

import UIKit
var SendMemberRegisterInfoView = UIViewController()
class SendMemberRegisterInfoViewController: UIViewController ,UITextFieldDelegate{
    var account = String()
    var name = String()
    var sex = String()
    var phone = String()
    var uservalidatorscode = String()
    var password = ""
    var againEnterpassword = ""
    @IBOutlet weak var tfPassword: UITextField!
    @IBOutlet weak var tfAgainEnterPassword: UITextField!
    @IBOutlet weak var lbMessage: UILabel!
    @IBOutlet weak var btSendPassword: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        MemberRegiseterView = self
        print(sex)
        btSendPassword.layer.borderWidth = 1.0//外框粗度
        //      BtnLogin.layer.borderColor = sevenTeaColor.cgColor
        btSendPassword.layer.cornerRadius = 5//圓角
        
        tfPassword.delegate = self
        tfAgainEnterPassword.delegate = self
        
        //使用手勢 用tap把鍵盤收起來
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyBoard))
        self.view.addGestureRecognizer(tap) // to Replace "TouchesBegan"
        
    }
    @objc func dismissKeyBoard()
    {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool
    {
        textField.resignFirstResponder()
        return true
    }
    // 2/13利用正規表示法來修正判斷式 已修正完成
    @IBAction func btSendPassword(_ sender: Any) {
        self.password = tfPassword.text ?? ""
        self.againEnterpassword = tfAgainEnterPassword.text ?? ""
        lbMessage.text = ""
        if(checkValidPassword(input: password) == true && password == againEnterpassword )
        {
            SendMemberRegisterInfoAPI.MemberRegisterInstance.SendMemberRegisterInfo(Username: account, Name: name, Sex: sex, Phone: phone, Password: password, Password_confirmation: againEnterpassword, Validators_code: uservalidatorscode)
        }
        else if (checkValidPassword(input: password) == false)
        {
            if(password == ""){
                lbMessage.text = regex_message
                lbMessage.shake()
            }else{
                lbMessage.text = "＊格式錯誤請重新輸入"
                lbMessage.shake()
            }
        }
        else if(againEnterpassword != password)
        {
            lbMessage.text = ""
            lbMessage.text = "＊兩次密碼輸入不同"
            lbMessage.shake()
        }
    }
    
}
