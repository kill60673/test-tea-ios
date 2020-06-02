//
//  OrderDetailViewController.swift
//  seven_tea
//
//  Created by harrison on 2020/5/30.
//  Copyright © 2020 harrison公司機. All rights reserved.
//

import UIKit
var OrderDetailTableView: UITableView!
var OrderDetailController: UIViewController!
class OrderDetailViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var lbOrderNo: UILabel!
    @IBOutlet weak var lbOrderStatus: UILabel!
    @IBOutlet weak var orderDetailTableView: UITableView!
    @IBOutlet weak var lbStord: UILabel!
    @IBOutlet weak var lbCreatedAt: UILabel!
    @IBOutlet weak var lbTotalQty: UILabel!
    @IBOutlet weak var lbTotalPrice: UILabel!
    @IBOutlet weak var lbRecipient: UILabel!
    @IBOutlet weak var lbRecipientTel: UILabel!
    @IBOutlet weak var lbAddress: UILabel!
    @IBOutlet weak var lbPayMethod: UILabel!
    @IBOutlet weak var lbTaxCode: UILabel!
    @IBOutlet weak var lbNote: UILabel!
    @IBOutlet weak var btCancel: UIButton!
    var orderdetaillist = [GetMemberOrderDetail]()

    override func viewDidLoad() {
        super.viewDidLoad()
        GetMemberOrderDetailApi.GetMemberOrderMemberApiInstance.getmemberorderitem(token: UserInfo.UserInfoInstance.preferences.object(forKey: "token") as! String, order_no: itemdetailnumber)
        orderDetailTableView.tableFooterView = UIView()
        OrderDetailTableView = orderDetailTableView
        btCancel.customized_button(button: btCancel)
        print("ddaass", itemdetailnumber)
        OrderDetailController = self
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        self.orderdetaillist = GetMemberOrderDetailApi.GetMemberOrderMemberApiInstance.getmemberorderdetail()
    }
    override func viewDidAppear(_ animated: Bool) {
        lbStord.text = self.orderdetaillist[0].store
        lbAddress.text = self.orderdetaillist[0].address[0].address
        lbOrderNo.text = self.orderdetaillist[0].order_no
        lbTotalQty.text = "總共\(self.orderdetaillist[0].total_qty)杯"
        lbTaxCode.text = self.orderdetaillist[0].tax_code
        lbTotalPrice.text = "＄\(self.orderdetaillist[0].total_price)"
        lbCreatedAt.text = self.orderdetaillist[0].created_at
        lbPayMethod.text = self.orderdetaillist[0].pay_method
        lbNote.text = self.orderdetaillist[0].note
        lbRecipient.text = self.orderdetaillist[0].recipient
        lbRecipientTel.text = self.orderdetaillist[0].recipient_tel
        lbOrderStatus.text = self.orderdetaillist[0].order_status
        if self.orderdetaillist[0].order_status != "待確認"{
            btCancel.isHidden = true
        }
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return GetMemberOrderDetailApi.GetMemberOrderMemberApiInstance.getorderitemcount()
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "orderDetailCell", for: indexPath)as!
        OrderDetailTableViewCell
        self.orderdetaillist = GetMemberOrderDetailApi.GetMemberOrderMemberApiInstance.getmemberorderdetail()
        let orderfeed = GetMemberOrderDetailApi.GetMemberOrderMemberApiInstance.feedname
        let feedname = orderfeed.joined(separator: "/")
        let itemprice = self.orderdetaillist[indexPath.row].item[indexPath.row].price * self.orderdetaillist[indexPath.row].item[indexPath.row].qty
        cell.lbItemName.text = self.orderdetaillist[indexPath.row].item[indexPath.row].item_name
        cell.lbItemQty.text = "x\(self.orderdetaillist[indexPath.row].item[indexPath.row].qty)"
        cell.lbItemPrice.text = "\(itemprice)元"
        cell.lbTmp.text = "\(self.orderdetaillist[indexPath.row].item[indexPath.row].tmp)"
        cell.lbSugar.text = "\(self.orderdetaillist[indexPath.row].item[indexPath.row].sugar)"
        cell.lbSize.text = "\(self.orderdetaillist[indexPath.row].item[indexPath.row].size)"
        cell.lbFeed.text = feedname
        return cell
    }
    @IBAction func btCancel(_ sender: Any) {
        cancelOrderMessage(order_no: itemdetailnumber)
    }
}
