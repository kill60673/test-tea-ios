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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        LoginView = self
        
        BtnLogin.layer.borderWidth = 1.0//外框粗度
        //        BtnLogin.layer.borderColor = sevenTeaColor.cgColor
        BtnLogin.layer.cornerRadius = 5//圓角
        
        TfPhone.delegate = self
        TfPassWord.delegate = self
        
        //使用手勢 用tap把鍵盤收起來
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyBoard))
        self.view.addGestureRecognizer(tap) // to Replace "TouchesBegan"
    }
    
    //關掉鍵盤
    @objc func dismissKeyBoard() {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    //登入按鈕 擷取輸入的帳號密碼傳入API Login 使用MessageAlert裡面的message跳出訊息是否成功登入
    @IBAction func BtLogin(_ sender: Any) {
        if(TfPhone.text != ""){
            if(TfPassWord.text != ""){
                LoginAPI.LoginInstance.Login(username: TfPhone.text!, password: TfPassWord.text!)
                TfPassWord.text = ""
            } else {
                MessageAlert.Instance.message(message: "密碼不得空白")
            }
        } else {
            MessageAlert.Instance.message(message: "帳號不得空白")
        }
    }
}
