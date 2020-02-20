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
        //        print(sex)
        btSendPassword.customized_button(button : btSendPassword)
        
        tfPassword.delegate = self
        tfAgainEnterPassword.delegate = self
        keyboad()
        //使用手勢 用tap把鍵盤收起來
    }
    
    // 2/13利用正規表示法來修正判斷式 已修正完成
    @IBAction func btSendPassword(_ sender : Any)
    {
        self.password = tfPassword.text ?? ""
        self.againEnterpassword = tfAgainEnterPassword.text ?? ""
        
        lbMessage.text = ""
        predicates_func.SendMemberRegisterInfo(password : password , againEnterpassword : againEnterpassword , account : account , name : name, sex : sex , phone : phone , uservalidatorscode : uservalidatorscode , lbMessage : lbMessage)
    }
}
