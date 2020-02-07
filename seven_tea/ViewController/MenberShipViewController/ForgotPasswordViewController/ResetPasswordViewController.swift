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
    
    @IBAction func btSubmit(_ sender: Any) {
        let password = tfPassword.text ?? ""
        let againenterpassword = tfAgainEnterPassword.text ?? ""
        print (phonenumber)
        print (name)
        print(uservalidatorscode)
        lbPrompt.text = ""
        if(password != "" && againenterpassword != "")
        {
            RestPasswordApi.RestPasswordApiInstance.RestPassword(Username: name, Phone: phonenumber, Validators_code: uservalidatorscode, Password: password, Password_Confirmation: againenterpassword)
        }
        else if (password == "" || againenterpassword == "")
        {
            lbPrompt.text = ""
            lbPrompt.text = "＊請輸入正確資訊"
            lbPrompt.shake()
        }

    }
    
}
