//
//  OrderViewController.swift
//  seven_tea
//
//  Created by harrison on 2020/3/28.
//  Copyright © 2020 harrison公司機. All rights reserved.
//

import UIKit
var OrderTableView: UITableView!
var AllCount = 0
var AllPrince = 0
var SelectOrderNo: String!
var OrderController: UIViewController!
   var itemorder_no = [String]()
class OrderViewController: UIViewController, UITableViewDataSource, UITableViewDelegate,MemberDetailTableViewCellDelegate {
    static let OrderItemInstance = OrderViewController()
    @IBOutlet weak var orderTableView: UITableView!
    @IBOutlet weak var statusSelect: UISegmentedControl!
    @IBOutlet weak var LbNoData: UILabel!
    @IBOutlet var orderViewController: UIView!
    var itemname = ""
 
    var selectStatus = 0
    var orderList = [MemberNewOrder]()
  
    override func viewDidLoad() {
        super.viewDidLoad()
        OrderController = self
        OrderTableView = orderTableView
        orderTableView.tableFooterView = UIView()
    }
    override func viewWillAppear(_ animated: Bool) {
        // 將當下時間轉換成設定的時間格式
        if UserInfo.UserInfoInstance.preferences.object(forKey: "token") != nil {
            MemberNewOrderApi.MemberNewOrderApiInstance.getmemberorderitem(token: UserInfo.UserInfoInstance.preferences.object(forKey: "token") as! String, selectStatus: 0)
        }
    }
    override func viewDidAppear(_ animated: Bool) {
        if  UserInfo.UserInfoInstance.preferences.object(forKey: "token") != nil {
            OrderTableView.isHidden = false
            LbNoData.isHidden = false
            statusSelect.isHidden = false
        } else {
            OrderTableView.isHidden = true
            LbNoData.isHidden = true
            statusSelect.isHidden = true
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let viewContorller = storyboard.instantiateViewController(withIdentifier: "LoginVc")
            show(viewContorller, sender: self)
        }
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if MemberNewOrderApi.MemberNewOrderApiInstance.getordercount() == 0 {
            OrderTableView.isHidden = true
            LbNoData.isHidden = false
        } else {
            OrderTableView.isHidden = false
            LbNoData.isHidden = true
        }
        return MemberNewOrderApi.MemberNewOrderApiInstance.getordercount()
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        SelectOrderNo = self.orderList[indexPath.row].order_no
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "orderCell", for: indexPath)as! OrderTableViewCell
        print("有重跑")
        self.orderList = MemberNewOrderApi.MemberNewOrderApiInstance.getmemberneworder()
        let itemnamearray = self.orderList[indexPath.row].itemname
        let itemname = itemnamearray.joined(separator:"/")
        cell.LbStore.text = self.orderList[indexPath.row].store
        cell.LbItemName.text = itemname
        print("還是痞咖區",itemname)
        cell.LbTotalQty.text = "共\(self.orderList[indexPath.row].total_qty)杯"
        cell.LbTotalPrice.text = "總計$\(self.orderList[indexPath.row].total_price)元"
        cell.LbOrderNumber.text = self.orderList[indexPath.row].order_no
        itemorder_no.append(self.orderList[indexPath.row].order_no)
        cell.btNext.customized_button(button: cell.btNext)
        cell.delegate = self
        return cell
    }
    @IBAction func statusSelect(_ sender: Any) {
        
        switch statusSelect.selectedSegmentIndex {
        case 0:
            selectStatus = 0
            print("跑到０")
            break
        case 1:
            selectStatus = 1
            print("跑到1")
            break
        case 2:
            selectStatus = 2
            print("跑到2")
            break
        case 3:
            selectStatus = 3
            print("跑到3")
            break
        default:
            selectStatus = 4
            print("跑到4")
            break
        }
        MemberNewOrderApi.MemberNewOrderApiInstance.getmemberorderitem(token: UserInfo.UserInfoInstance.preferences.object(forKey: "token") as! String, selectStatus: selectStatus)
    }
    func tableviewcelldelegate(sender: OrderTableViewCell) {
           guard let tappedIndexPath = orderTableView.indexPath(for: sender)else {return}
                 print("這理事", sender, tappedIndexPath)
                 print("-------")
                 print(sender)
                 print("--------")
                 print(tappedIndexPath)
                 let tappedindex = tappedIndexPath
                 index_row = tappedindex.row
                 print("sssss", tappedindex.row)
      }
    func getorderno() -> [String] {
        return itemorder_no
       }
}
