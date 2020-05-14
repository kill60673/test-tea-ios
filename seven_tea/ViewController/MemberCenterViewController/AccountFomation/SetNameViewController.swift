//
//  SetNameViewController.swift
//  seven_tea
//
//  Created by harrison on 2020/3/11.
//  Copyright © 2020 harrison公司機. All rights reserved.
//

import UIKit

class SetNameViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var tfName: UITextField!
    @IBOutlet weak var btSubmit: UIButton!
    var name = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        tfName.delegate = self
        btSubmit.customized_button(button: btSubmit)
        tfName.text = UserInfo.UserInfoInstance.preferences.object(forKey: "name") as? String
    }
    @IBAction func btSubmit(_ sender: Any) {
        self.name = tfName.text ?? ""
        if name != "" {
            //修改名子的api
        }
    }
}
