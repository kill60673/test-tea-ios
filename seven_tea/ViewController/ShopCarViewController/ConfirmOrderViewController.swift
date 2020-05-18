//
//  ConfirmOrderViewController.swift
//  seven_tea
//
//  Created by harrison on 2020/5/15.
//  Copyright © 2020 harrison公司機. All rights reserved.
//

import UIKit

class ConfirmOrderViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    @IBOutlet weak var btPayMent: UIButton!
    @IBOutlet weak var btCommonly_one: UIButton!
    @IBOutlet weak var btCommonly_two: UIButton!
    @IBOutlet weak var btCommonly_three: UIButton!
    @IBOutlet weak var tfRecipient: UITextField!
    @IBOutlet weak var tfPhoneNumber: UITextField!
    @IBOutlet weak var tfAddress: UITextField!
    var memberinfo = [SynchronizeMemberInfo]()
    var address = [SynchronizeMemberAddress]()
    override func viewDidLoad() {
        super.viewDidLoad()
        SycchronizeMemberInfoApi.SycchronizeMemberInfoApiInstance.getmemberinfo(token: UserInfo.UserInfoInstance.preferences.object(forKey: "token") as! String)
        GetShoppingCarApi.GetShoppingCarInstance.getstores(token: UserInfo.UserInfoInstance.preferences.object(forKey: "token")as! String)
        btCommonly_one.customized_button(button: btCommonly_one)
        btCommonly_two.customized_button(button: btCommonly_two)
        btCommonly_three.customized_button(button: btCommonly_three)
        // Do any additional setup after loading the view.
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemlist.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ConfirmOrderCell", for: indexPath) as! ConfirmOrderTableViewCell
        cell.lbItemName.text = itemlist[indexPath.row]
        return cell
    }
    @IBAction func btSynchronizeMemberInfo(_ sender: Any) {
        self.address = SycchronizeMemberInfoApi.SycchronizeMemberInfoApiInstance.getmemberaddress()
        self.memberinfo = SycchronizeMemberInfoApi.SycchronizeMemberInfoApiInstance.getmemberinfo()
        tfRecipient.text = memberinfo[0].name
        tfPhoneNumber.text = memberinfo[0].phone
    }
}
