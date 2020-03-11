//
//  SendMemberRegistrViewController.swift
//  seven_tea
//
//  Created by harrison on 2020/2/10.
//  Copyright © 2020 harrison公司機. All rights reserved.
//

import UIKit
var sendMemberRegistrView = UIViewController()
class SendMemberRegistrViewController: UIViewController, UITextFieldDelegate {
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
        sendMemberRegistrView = self
        btNextStep.customized_button(button: btNextStep)

        tfUserName.delegate = self
        tfName.delegate = self
        print("aaa"+phone+",bbb"+uservalidatorscode)
        
        //使用手勢 用tap把鍵盤收起來
        keyboad()
    }

    // 2/13利用正規表示法來修正判斷式 已修正完成
    @IBAction func btNextStep(_ sender: Any) {
        self.username = tfUserName.text ?? ""
        self.name = tfName.text ?? ""

        lbUserName.text = ""
        lbName.text = ""

        predicatesFunc.jumpSendMemberRegisterInfo(username: username, name: name, lbUserName: lbUserName, lbName: lbName, phone: phone, sex: sex, uservalidatorscode: uservalidatorscode,controller: self)
    }

    //使用UISegmentedControl來決定男女
    @IBAction func segmentedControlValueChanged(_ sender: UISegmentedControl) {
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
