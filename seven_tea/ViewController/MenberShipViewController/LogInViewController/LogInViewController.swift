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
    
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        LoginView = self
        btLogin.layer.borderWidth = 1.0//外框粗度
        btLogin.layer.cornerRadius = 5//圓角
        tfPhone.delegate = self
        tfPassWord.delegate = self
        //使用手勢 用tap把鍵盤收起來
        keyboad()
    }
    
// 關掉鍵盤
    func textFieldShouldReturn(_ textField : UITextField) -> Bool
    {
        textField.resignFirstResponder()
        return true
    }
    
    // 登入按鈕 擷取輸入的帳號密碼傳入API Login 使用MessageAlert裡面的message跳出訊息是否成功登入
    // 2/13利用正規表示法來修正判斷式 已修正完成
    @IBAction func BtLogin(_ sender: Any)
    {
        let account = tfPhone.text ?? ""
        let userpassword = tfPassWord.text ?? ""
        
        lbName.text = ""
        lbPassword.text = ""
        if ((checkValidAccount(input: account) == true) && (checkValidPassword(input : userpassword) == true))
        {
            LoginAPI.LoginInstance.getLoginMessage(username : account , password : userpassword)
        }
        //如果帳號輸入是錯誤的不管是空值還是格式錯誤regex_message都會回傳回來正確的錯誤訊息
        else if (checkValidAccount(input : account) == false)
        {
                lbName.text = regex_message
                lbName.shake()
        }
        //如果密碼輸入是錯誤的不管是空值還是格式錯誤regex_message都會回傳回來正確的錯誤訊息
        else if (checkValidPassword(input : userpassword) == false)
        {
                lbPassword.text = regex_message
                lbPassword.shake()
        }
        
    }
}
