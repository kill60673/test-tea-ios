//
//  ResetPasswordViewController.swift
//  seven_tea
//
//  Created by harrison on 2020/2/7.
//  Copyright © 2020 harrison公司機. All rights reserved.
//

import UIKit
var ResetPassword:UIViewController!
class ResetPasswordViewController: UIViewController , UITextFieldDelegate {
    @IBOutlet weak var tfPassword: UITextField!
    @IBOutlet weak var tfAgainEnterPassword: UITextField!
    @IBOutlet weak var lbPrompt: UILabel!
    @IBOutlet weak var btSubmit: UIButton!
    var name = String()
    var phonenumber = String()
    var uservalidatorscode = String()
    
    
    override func viewDidLoad(){
        super.viewDidLoad()
        ResetPassword = self
        btSubmit.layer.borderWidth = 1.0//外框粗度
        btSubmit.layer.cornerRadius = 5//圓角
        tfPassword.delegate = self
        tfAgainEnterPassword.delegate = self
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyBoard))
        self.view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyBoard(){
        self.view.endEditing(true)
    }
    
    // 2/13利用正規表示法來修正判斷式 已修正完成
    @IBAction func btSubmit(_ sender: Any) {
        let password = tfPassword.text ?? ""
        let againenterpassword = tfAgainEnterPassword.text ?? ""
        
        lbPrompt.text = ""
        
        if ((checkValidPassword(input : password) == true) && (checkValidPassword(input : againenterpassword) == true))
        {
            RestPasswordApi.RestPasswordApiInstance.RestPassword(Username: name, Phone : phonenumber , Validators_code : uservalidatorscode , Password: password, Password_Confirmation : againenterpassword)
        }
        else if (checkValidPassword(input : password) == false)
        {
            if (password == ""){
                lbPrompt.text = regex_message
                lbPrompt.shake()
            }else{print("密碼"+regex_message)
                lbPrompt.text = "格式錯誤請重新輸入"
                lbPrompt.shake()
            }
        }
        else if (checkValidPassword(input : againenterpassword) == false)
        {
            if (againenterpassword == "")
            {
                lbPrompt.text = regex_message
                lbPrompt.shake()
            }
            else
            {
//                print("密碼再次確認"+regex_message)
                lbPrompt.text = "格式錯誤請重新輸入"
                lbPrompt.shake()
            }
        }
    }
}
