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
        
        //送出資料
        if ((checkValidPassword(input : password) == true) && (password == againenterpassword))
        {
            RestPasswordApi.RestPasswordApiInstance.RestPassword(Username: name, Phone : phonenumber , Validators_code : uservalidatorscode , Password: password, Password_Confirmation : againenterpassword)
        }
        //如果密碼輸入是錯誤的不管是空值還是格式錯誤regex_message都會回傳回來正確的錯誤訊息
        else if (checkValidPassword(input : password) == false)
        {
                lbPrompt.text = regex_message
                lbPrompt.shake()
        }
        //如果密碼輸入是錯誤的不管是空值還是格式錯誤regex_message都會回傳回來正確的錯誤訊息
        else
        {
                lbPrompt.text = "兩次密碼輸入不同請確認"
                lbPrompt.shake()
        }
    }
}
