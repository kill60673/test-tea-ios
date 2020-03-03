//
//  MenberCenterViewController.swift
//  seven_tea
//
//

import UIKit
var memberInfoView: UIViewController!

class MenberCenterViewController: UIViewController {
    @IBOutlet weak var memberView: UIView!
    @IBOutlet weak var memberTableView: UITableView!
    @IBOutlet weak var btLogout: UIButton!
    @IBOutlet weak var lbName: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        memberInfoView = self
        memberView.isHidden = true
        memberTableView.isHidden = true
        btLogout.customized_button(button: btLogout)
        keyboad()
    }
    @IBAction func btLogout(_ sender: Any) {
        UserInfo.UserInfoInstance.delete()
        memberInfoView.dismiss(animated: true, completion: nil)
        memberInfoView.navigationController?.popViewController(animated: true)
        self.tabBarController?.selectedIndex = 0
               MessageAlert.Instance.message(message: "已登出")
    }
    override func viewDidAppear(_ animated: Bool) {
        if UserInfo.UserInfoInstance.preferences.object(forKey: "token") != nil {
            memberView.isHidden = false
                       memberTableView.isHidden = false
                       lbName.text = UserInfo.UserInfoInstance.preferences.object(forKey: "name") as? String
        } else {
            memberView.isHidden = true
            memberTableView.isHidden = true
        }
    }
}
