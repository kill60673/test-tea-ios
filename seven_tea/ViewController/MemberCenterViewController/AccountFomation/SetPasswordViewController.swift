//
//  ResetPasswordViewController.swift
//  seven_tea
//
//  Created by harrison on 2020/3/10.
//  Copyright © 2020 harrison公司機. All rights reserved.
//

import UIKit

class SetPasswordViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var tfOldPassword: UITextField!
    @IBOutlet weak var tfNewPassword: UITextField!
    @IBOutlet weak var tfCheckPassword: UITextField!
    @IBOutlet weak var lbWarning: UILabel!
    @IBOutlet weak var btSend: UIButton!
    var oldpassword = ""
    var newpassword = ""
    var checkpassword = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        btSend.customized_button(button: btSend)
        tfNewPassword.delegate = self
        tfOldPassword.delegate = self
        tfCheckPassword.delegate = self
        keyboad()
    }

    @IBAction func btSend(_ sender: Any) {
        self.oldpassword = tfOldPassword.text ?? ""
        self.newpassword = tfNewPassword.text ?? ""
        self.checkpassword = tfCheckPassword.text ?? ""
        getEditMemberPasswordMessage(old_password: self.oldpassword, new_password: self.newpassword, new_password_confirmation: self.checkpassword)
    }
}
