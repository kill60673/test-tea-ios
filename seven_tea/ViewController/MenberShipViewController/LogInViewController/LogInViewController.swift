//
//  LogInViewController.swift
//  seven_tea
//
//

import Foundation
import UIKit
var loginView: UIViewController!
var predicatesFunc = PredicatesFunc()

class LoginViewController: UIViewController, UITextFieldDelegate {

    static let LoginInstance = LoginViewController()
    @IBOutlet weak var tfPhone: UITextField!
    @IBOutlet weak var tfPassWord: UITextField!
    @IBOutlet weak var btLogin: UIButton!
    @IBOutlet weak var lbName: UILabel!
    @IBOutlet weak var lbPassword: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        loginView = self
        btLogin.customized_button(button: btLogin)

        tfPhone.delegate = self
        tfPassWord.delegate = self
        //使用手勢 用tap把鍵盤收起來
        keyboad()
    }

    // 登入按鈕 擷取輸入的帳號密碼傳入API Login 使用MessageAlert裡面的message跳出訊息是否成功登入
    // 2/13利用正規表示法來修正判斷式 已修正完成
    @IBAction func btLogin(_ sender: Any) {
        let account = tfPhone.text ?? ""
        let userpassword = tfPassWord.text ?? ""

        lbName.text = ""
        lbPassword.text = ""

        predicatesFunc.login(account: account, userpassword: userpassword, lbName: lbName, lbPassword: lbPassword)
    }
}
