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
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyBoard))
        self.view.addGestureRecognizer(tap) // to Replace "TouchesBegan"
    }
    
    // 關掉鍵盤
    @objc func dismissKeyBoard()
    {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool
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
        if(checkValidAccount(input: account) == true && checkValidPassword(input: userpassword) == true)
        {
            LoginAPI.LoginInstance.getLoginMessage(username: account, password: userpassword)
        }
        else if(checkValidAccount(input: account) == false)
        {
            if(account == "")
            {
                lbName.text = regex_message
                lbName.shake()
            }
            else
            {
                lbName.text = "格式錯誤請重新輸入"
                lbName.shake()
            }
        }
        else if(checkValidPassword(input: userpassword) == false)
        {
            if(userpassword == "")
            {
                lbPassword.text = regex_message
                lbPassword.shake()
            }
            else
            {
                lbPassword.text = "格式錯誤請重新輸入"
                lbPassword.shake()
            }
        }
        
    }
}
