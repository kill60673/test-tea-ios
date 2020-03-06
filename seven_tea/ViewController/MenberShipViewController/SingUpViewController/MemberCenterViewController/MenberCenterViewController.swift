//
//  MenberCenterViewController.swift
//  seven_tea
//
//

import UIKit
var memberInfoView: UIViewController!

class MenberCenterViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var memberView: UIView!
    @IBOutlet weak var memberTableView: UITableView!
    @IBOutlet weak var btLogout: UIButton!
    @IBOutlet weak var lbName: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(memberCenterList)
        memberInfoView = self
        memberView.isHidden = true
        memberTableView.isHidden = true
        btLogout.customized_button(button: btLogout)
        memberTableView.tableFooterView = UIView()
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
            print("null")
            memberView.isHidden = true
            memberTableView.isHidden = true
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let viewContorller = storyboard.instantiateViewController(withIdentifier: "LoginVc")
            show(viewContorller, sender: self)
        }
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            let vc = storyboard?.instantiateViewController(withIdentifier: "myFavoriteTV")
            show(vc!, sender: self)
            break
        case 1:
            let vc = storyboard?.instantiateViewController(withIdentifier: "accountTV")
            show(vc!, sender: self)
            break
        case 2:
            let vc = storyboard?.instantiateViewController(withIdentifier: "FAQTV")
            show(vc!, sender: self)
            break
        case 3:
            let vc = storyboard?.instantiateViewController(withIdentifier: "TreatyVC")
            show(vc!, sender: self)
            break
        default:
            break
        }
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return memberCenterList.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellId = "MemberCenterCell"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
        let memberlist = memberCenterList[indexPath.row]
        /*  UITableViewCell本身有textLabel, detailTextLabel, imageView屬性可以設定主標、副標文字與圖片 */
        cell.textLabel?.text = memberlist
        cell.imageView?.image = UIImage(named: memberCenterImage[indexPath.row])
        return cell
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        //表個上要有幾個區段
        return 1
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UIScreen.main.bounds.width/4.3 * 0.8
    }
    
}
