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

class OrderViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var orderTableView: UITableView!
    @IBOutlet weak var statusSelect: UISegmentedControl!
    @IBOutlet weak var LbNoData: UILabel!
    @IBOutlet var OrderViewController: UIView!

    var  selectStatus = 0
    let OrderList = OrderApi.OrderRecordInstance.getList()
    override func viewDidLoad() {
        super.viewDidLoad()
        OrderController = self
        OrderTableView = orderTableView
        orderTableView.tableFooterView = UIView()
    }
    override func viewWillAppear(_ animated: Bool) {
        // 將當下時間轉換成設定的時間格式
        if UserInfo.UserInfoInstance.preferences.object(forKey: "token") != nil {
            // 獲取當前時間
            let now: Date = Date()
            // 建立時間格式
            let dateFormat: DateFormatter = DateFormatter()
            dateFormat.dateFormat = "yyyy-MM-dd"
            let dateString: String = dateFormat.string(from: now)
            OrderApi.OrderRecordInstance.OrderRecord(token: UserInfo.UserInfoInstance.preferences.object(forKey: "token") as! String, StartDate: dateString, EndDate: dateString, Status: selectStatus)
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
        if OrderApi.OrderRecordInstance.getCount() == 0 {
            OrderTableView.isHidden = true
            LbNoData.isHidden = false
        } else {
            OrderTableView.isHidden = false
            LbNoData.isHidden = true
        }
        return OrderApi.OrderRecordInstance.getCount()
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        AllCount = OrderList[indexPath.row].quantity
        AllPrince = OrderList[indexPath.row].price
        SelectOrderNo = OrderList[indexPath.row].orderNumber
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "orderCell", for: indexPath)as! OrderTableViewCell
        cell.orderTime.text = OrderList[indexPath.row].orderTime
        cell.orderName.text = OrderList[indexPath.row].name
        cell.orderGetTime.text = OrderList[indexPath.row].arrivalTime
        cell.orderStore.text = OrderList[indexPath.row].store
        cell.orderGetMethod.text = OrderList[indexPath.row].getMethod
        cell.orderPhone.text = OrderList[indexPath.row].phone
        cell.orderAddress.text = OrderList[indexPath.row].address
        cell.orderSerialNumber.text = "(\(OrderList[indexPath.row].orderId))"
        return cell
    }
    @IBAction func statusSelect(_ sender: Any) {

        switch statusSelect.selectedSegmentIndex {
        case 0:
            selectStatus = 0

            break
        case 1:
            selectStatus = 1

            break
        case 2:
            selectStatus = 2

            break
        case 3:
            selectStatus = 3

            break
        default:
            selectStatus = 0
            break
        }
        // 獲取當前時間
        let now: Date = Date()

        // 建立時間格式

        let dateFormat: DateFormatter = DateFormatter()

        dateFormat.dateFormat = "yyyy-MM-dd"

        // 將當下時間轉換成設定的時間格式

        let dateString: String = dateFormat.string(from: now)
        OrderApi.OrderRecordInstance.OrderRecord(token: UserInfo.UserInfoInstance.preferences.object(forKey: "token") as! String, StartDate: dateString, EndDate: dateString, Status: selectStatus)    }
}
