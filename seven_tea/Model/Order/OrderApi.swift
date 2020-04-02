//
//  OrderAPI.swift
//  seven_tea
//
//  Created by harrison on 2020/3/31.
//  Copyright © 2020 harrison公司機. All rights reserved.
//

import Foundation
import UIKit
class OrderApi: NSObject {
    static let OrderRecordInstance = OrderApi()
     var orderlist = [Order]()
    func OrderRecord(Token: String, StartDate: String, EndDate: String, Status: Int) {

        let url = URL(string: ApiUrl.ApiUrlInstance.OrderRecordUrl + "\(StartDate)/\(EndDate)/\(Status)")!

        var request = URLRequest(url: url)
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        request.setValue(Token, forHTTPHeaderField: "Authorization")
        request.httpMethod = "GET"

        let task = URLSession.shared.dataTask(with: request) { data, response, _ in

            let responseString = String(data: data!, encoding: .utf8)
             print(responseString)
            //print(responseString)
            let httpStatus = response as? HTTPURLResponse

            //檢查Token是否要刷新
            if httpStatus!.allHeaderFields["Authorization"] as? String ?? "" != "" {

                UserInfo.UserInfoInstance.update(oldToken: Token, newToken: httpStatus!.allHeaderFields["Authorization"] as? String ?? "")
            }

            let decoder = JSONDecoder()

            decoder.dateDecodingStrategy = .iso8601
            if let data = data, let Info = try?
                decoder.decode(OrderCodable.self, from: data) {

                //如果是result＝＝0先清掉頁面上的資料 然後再把裡面資料用for迴圈丟進去
                if Info.result == 0 {
                    self.orderlist.removeAll()
                    for result in Info.message! {
                        let order = Order(orderId: result.id, order_Number: result.order_no, name: result.name, phone: result.phone, orderPhone: result.orderer_phone, arrivalTime: result.arrival_time, address: result.address, store: result.store, company: result.company, taxId: result.tax_id, status: result.status, payMethod: result.pay_method, orderTime: result.order_time, getMethod: result.get_method, quantity: result.quantity, price: result.price)
                        self.orderlist.append(order)
                    }
                } else {
                    //主線程
                    DispatchQueue.main.async {

                        MessageAlert.Instance.message(message: "\(Info.message)")
                        print("我在這裡裡")
                    }
                }
            } else {
                //主線程
                DispatchQueue.main.async {
                    print("我在這裡啦")
                    MessageAlert.Instance.message(message: "資料解析錯誤")
                }
            }

            //主線程
            DispatchQueue.main.async {

                if OrderTableView != nil {
                      OrderTableView.reloadData()
                }

//                if(OrderRecordTable != nil){
//
//                    if(OrderId.count <= 0){
//                        OrderRecordTable.isHidden = false
//                        NoRecordView.isHidden = false
//                    }else{
//                        OrderRecordTable.isHidden = false
//                        NoRecordView.isHidden = false
//                    }
//                     OrderRecordTable.reloadData()
//                }

            }

        }
        task.resume()

    }
    func getCount() -> Int {
        return orderlist.count
    }
    func getList() -> [Order] {
        return orderlist
    }

}
