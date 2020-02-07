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
    @IBOutlet weak var tfPhone: UITextField!
    @IBOutlet weak var tfPassWord: UITextField!
    @IBOutlet weak var btLogin: UIButton!
    @IBOutlet weak var lbName: UILabel!
    @IBOutlet weak var lbPassword: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        LoginView = self
        btLogin.layer.borderWidth = 1.0//外框粗度
        //      BtnLogin.layer.borderColor = sevenTeaColor.cgColor
        btLogin.layer.cornerRadius = 5//圓角
        
        tfPhone.delegate = self
        tfPassWord.delegate = self
        
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
        let account = tfPhone.text ?? ""
        let userpassword = tfPassWord.text ?? ""
        lbName.text = ""
        lbPassword.text = ""
        if(account != "" && userpassword != ""){
            LoginAPI.LoginInstance.Login(username: account, password: userpassword)
        }
        else if (account == "" && userpassword == ""){
            lbName.text = ""
            lbPassword.text = ""
            lbName.text = "＊帳號不可為空"
            lbName.shake()
            lbPassword.text = "＊密碼不可為空"
            lbPassword.shake()
        }else if(account == ""){
            lbName.text = ""
            lbPassword.text = ""
            lbName.text = "＊帳號不可為空"
            lbName.shake()
        }else if(userpassword == ""){
            lbName.text = ""
            lbPassword.text = ""
            lbPassword.text = "＊密碼不可為空"
            lbPassword.shake()
        }
    }
}
