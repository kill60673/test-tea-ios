//
//  LogInViewController.swift
//  seven_tea
//
//

import Foundation
import UIKit
var LoginView:UIViewController!

class LoginViewController: UIViewController, UITextFieldDelegate {
    
    static let LoginInstance = LoginViewController()
    @IBOutlet weak var TfPhone: UITextField!
    @IBOutlet weak var TfPassWord: UITextField!
    @IBOutlet weak var BtnLogin: UIButton!
    @IBOutlet weak var LbName: UILabel!
    @IBOutlet weak var LbPassword: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        LoginView = self
        BtnLogin.layer.borderWidth = 1.0//外框粗度
        //      BtnLogin.layer.borderColor = sevenTeaColor.cgColor
        BtnLogin.layer.cornerRadius = 5//圓角
        
        TfPhone.delegate = self
        TfPassWord.delegate = self
        
        //使用手勢 用tap把鍵盤收起來
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyBoard))
        self.view.addGestureRecognizer(tap) // to Replace "TouchesBegan"
    }
    
    // 關掉鍵盤
    @objc func dismissKeyBoard() {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    // 登入按鈕 擷取輸入的帳號密碼傳入API Login 使用MessageAlert裡面的message跳出訊息是否成功登入
    @IBAction func BtLogin(_ sender: Any) {
        let account = TfPhone.text ?? ""
        let userpassword = TfPassWord.text ?? ""
        LbName.text = ""
        LbPassword.text = ""
        if(account != "" && userpassword != ""){
            LoginAPI.LoginInstance.Login(username: account, password: userpassword)
        }
        else if (account == "" && userpassword == ""){
            LbName.text = ""
            LbPassword.text = ""
            LbName.text = "＊帳號不可為空"
            LbName.shake()
            LbPassword.text = "＊密碼不可為空"
            LbPassword.shake()
        }else if(account == ""){
            LbName.text = ""
            LbPassword.text = ""
            LbName.text = "＊帳號不可為空"
            LbName.shake()
        }else if(userpassword == ""){
            LbName.text = ""
            LbPassword.text = ""
            LbPassword.text = "＊密碼不可為空"
            LbPassword.shake()
        }
    }
}
