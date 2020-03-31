//
//  OrderViewController.swift
//  seven_tea
//
//  Created by harrison on 2020/3/28.
//  Copyright © 2020 harrison公司機. All rights reserved.
//

import UIKit
var OrderTableView: UITableView!
var OrderId = [String]()
var OrderNo = [String]()
var Name = [String]()
var Phone = [String]()
var OrdererPhone = [String]()
var ArrivalTime = [String]()
var OrderAddress = [String]()
var OrderStore = [String]()
var OrderTime = [String]()
var Company = [String]()
var TaxId = [String]()
var OrderStatus = [String]()
var PayMethod = [String]()
var GetMethod = [String]()
var Quantity = [Int]()
var Price = [Int]()
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
            OrderRecordAPI.OrderRecordInstance.OrderRecord(Token: UserInfo.UserInfoInstance.preferences.object(forKey: "token") as! String, StartDate: dateString, EndDate: dateString, Status: selectStatus)
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
        if OrderId.count == 0 {
            OrderTableView.isHidden = true
            LbNoData.isHidden = false
        } else {
            OrderTableView.isHidden = false
            LbNoData.isHidden = true
        }
        return OrderId.count
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        AllCount = Quantity[indexPath.row]
        AllPrince = Price[indexPath.row]
        SelectOrderNo = OrderNo[indexPath.row]
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "orderCell", for: indexPath)as! OrderTableViewCell
        cell.orderTime.text = OrderTime[indexPath.row]
        cell.orderName.text = Name[indexPath.row]
        cell.orderGetTime.text = ArrivalTime[indexPath.row]
        cell.orderStore.text = OrderStore[indexPath.row]
        cell.orderGetMethod.text = GetMethod[indexPath.row]
        cell.orderPhone.text = Phone[indexPath.row]
        cell.orderAddress.text = OrderAddress[indexPath.row]
        cell.orderSerialNumber.text = "(\(OrderId[indexPath.row]))"
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
        OrderRecordAPI.OrderRecordInstance.OrderRecord(Token: UserInfo.UserInfoInstance.preferences.object(forKey: "token") as! String, StartDate: dateString, EndDate: dateString, Status: selectStatus)    }
}
