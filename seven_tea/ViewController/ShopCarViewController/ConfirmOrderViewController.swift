//
//  ConfirmOrderViewController.swift
//  seven_tea
//
//  Created by harrison on 2020/5/15.
//  Copyright © 2020 harrison公司機. All rights reserved.
//

import UIKit
var shoppingcardetailtableview = UITableView()
class ConfirmOrderViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    @IBOutlet weak var btPayMent: UIButton!
    @IBOutlet weak var lbStoreName: UILabel!
    @IBOutlet weak var btCommonly_one: UIButton!
    @IBOutlet weak var btCommonly_two: UIButton!
    @IBOutlet weak var btCommonly_three: UIButton!
    @IBOutlet weak var tfRecipient: UITextField!
    @IBOutlet weak var tfPhoneNumber: UITextField!
    @IBOutlet weak var tfAddress: UITextField!
    @IBOutlet weak var ShoppingDetailTableView: UITableView!
    var shoppingcaritem = [GetShoppingCarItem]()
    var shoppingcardetail = [GetShoppingCarDetail]()
    var memberinfo = [SynchronizeMemberInfo]()
    var address = [SynchronizeMemberAddress]()
    var feedlist = [GetFeedList]()
    override func viewDidLoad() {
        super.viewDidLoad()
        SycchronizeMemberInfoApi.SycchronizeMemberInfoApiInstance.getmemberinfo(token: UserInfo.UserInfoInstance.preferences.object(forKey: "token") as! String)
        GetShoppingCarApi.GetShoppingCarInstance.getstores(token: UserInfo.UserInfoInstance.preferences.object(forKey: "token")as! String)
        self.shoppingcaritem = GetShoppingCarApi.GetShoppingCarInstance.getshoppingcaritem()
        self.shoppingcardetail = GetShoppingCarApi.GetShoppingCarInstance.getshoppingcardetail()
        self.feedlist = GetShoppingCarApi.GetShoppingCarInstance.getshoppingcaradd()
        print(self.feedlist.count,"庭宇")
        ShoppingDetailTableView.reloadData()
        lbStoreName.text = shoppingcardetail[0].store_name
        ShoppingDetailTableView.tableFooterView = UIView()
        shoppingcardetailtableview = ShoppingDetailTableView
        btCommonly_one.customized_button(button: btCommonly_one)
        btCommonly_two.customized_button(button: btCommonly_two)
        btCommonly_three.customized_button(button: btCommonly_three)
        // Do any additional setup after loading the view.
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return shoppingcaritem.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print("阿囉哈")
        let cell = tableView.dequeueReusableCell(withIdentifier: "ConfirmOrderCell", for: indexPath) as! ConfirmOrderTableViewCell
        cell.lbItemName.text = self.shoppingcaritem[indexPath.row].item_name
        cell.lbSugar.text = self.shoppingcaritem[indexPath.row].sugar
        cell.lbTmp.text = self.shoppingcaritem[indexPath.row].tmp
        if self.shoppingcaritem[indexPath.row].id == feedlist[indexPath.row].itemIndexId{
            print(feedlist[indexPath.row].feed,"搭特銷")
            let feedliststring = feedlist[indexPath.row].feed.joined(separator: "/")
            cell.lbFeed.text = feedliststring
            print(feedliststring)
        }
        cell.lbQty.text = "\(self.shoppingcaritem[indexPath.row].qty)"
        return cell
    }
    @IBAction func btSynchronizeMemberInfo(_ sender: Any) {
        self.address = SycchronizeMemberInfoApi.SycchronizeMemberInfoApiInstance.getmemberaddress()
        self.memberinfo = SycchronizeMemberInfoApi.SycchronizeMemberInfoApiInstance.getmemberinfo()
        tfRecipient.text = memberinfo[0].name
        tfPhoneNumber.text = memberinfo[0].phone
    }
}
