//
//  SendMemberRegistrViewController.swift
//  seven_tea
//
//  Created by harrison on 2020/2/10.
//  Copyright © 2020 harrison公司機. All rights reserved.
//

import UIKit
var SendMemberRegistrView = UIViewController()
class SendMemberRegistrViewController: UIViewController ,UITextFieldDelegate{
    var username = ""
    var name = ""
    var sex = "male"
    var phone = String()
    var uservalidatorscode = String()
    @IBOutlet weak var tfUserName: UITextField!
    @IBOutlet weak var tfName: UITextField!
    @IBOutlet weak var lbUserName: UILabel!
    @IBOutlet weak var lbName: UILabel!
    @IBOutlet weak var btNextStep: UIButton!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //print(sex)
        SendMemberRegistrView = self
        btNextStep.layer.borderWidth = 1.0//外框粗度
        
        btNextStep.layer.cornerRadius = 5//圓角
        tfUserName.delegate = self
        tfName.delegate = self
        
        //使用手勢 用tap把鍵盤收起來
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target : self, action : #selector(dismissKeyBoard))
        self.view.addGestureRecognizer(tap) // to Replace "TouchesBegan"
        
    }
    //消毀鍵盤
    @objc func dismissKeyBoard()
    {
        self.view.endEditing(true)
    }
    //textField消失
    func textFieldShouldReturn(_ textField : UITextField) -> Bool
    {
        textField.resignFirstResponder()
        return true
    }
    
    // 2/13利用正規表示法來修正判斷式 已修正完成
    @IBAction func btNextStep(_ sender : Any) {
        self.username = tfUserName.text ?? ""
        self.name = tfName.text ?? ""
        
        lbUserName.text = ""
        lbName.text = ""
        
        if(checkValidAccount(input : username) == true && name != "")
        {
            jump()
        }
        //如果帳號輸入是錯誤的不管是空值還是格式錯誤regex_message都會回傳回來正確的錯誤訊息
        else if (checkValidAccount(input : username) == false)
        {
                lbUserName.text = regex_message
                lbUserName.shake()
        }
        //如果使用著名稱為空值提醒請輸入使用者名稱
        else if  (name == "")
        {
            lbName.text = "＊請輸入使用者名稱"
            lbName.shake()
        }
    }
    //頁面跳轉部分送資料到下個頁面去
    func jump(){
        let vc = storyboard?.instantiateViewController(withIdentifier : "SendMemberRegisterInfo") as! SendMemberRegisterInfoViewController
        vc.account = username
        vc.name = name
        vc.phone = phone
        vc.sex = sex
        vc.uservalidatorscode = uservalidatorscode
        show(vc, sender : self)
    }
    
    //使用UISegmentedControl來決定男女
    @IBAction func segmentedControlValueChanged(_ sender : UISegmentedControl) {
        setSex()
    }
    //UISegmentedControl男女裡面的 index設定
    func setSex() {
        // 依照被選取項目的index來決定男女 
        let selectedIndex = segmentedControl.selectedSegmentIndex
        switch selectedIndex {
        case 0:
            self.sex = "male"
        case 1:
            self.sex = "female"
        default:
            break
        }
        //print(sex)
        
        // 依照被選取項目的index來取得該選項文字，並顯示在lbMessage上
    }
}
