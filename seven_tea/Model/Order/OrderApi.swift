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
    var newToken: String!
    func OrderRecord(token: String, StartDate: String, EndDate: String, Status: Int) {
        
        let url = URL(string: ApiUrl.ApiUrlInstance.OrderRecordUrl + "\(StartDate)/\(EndDate)/\(Status)")!
        
        var request = URLRequest(url: url)
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        request.setValue(token, forHTTPHeaderField: "Authorization")
        request.httpMethod = "GET"
        
        let task = URLSession.shared.dataTask(with: request) { data, response, _ in
            
            let responseString = String(data: data!, encoding: .utf8)
            print(responseString)
            //print(responseString)
            let httpStatus = response as! HTTPURLResponse
            print("為什麼999",httpStatus.allHeaderFields["Authorization"])
            if httpStatus.allHeaderFields["Authorization"] != nil {
                print("我有進來2")
                self.newToken = "\(httpStatus.allHeaderFields["Authorization"]!)"
                UserInfo.UserInfoInstance.update(oldToken: token, newToken: "\(httpStatus.allHeaderFields["Authorization"]!)")
            } else {
                print("tokennnnn",token)
                print("我有進來3")
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
                    }
                }
            } else {
                //主線程
                DispatchQueue.main.async {
                    MessageAlert.Instance.message(message: "資料解析錯誤")
                }
            }
            
            //主線程
            DispatchQueue.main.async {
                
                if OrderTableView != nil {
                    OrderTableView.reloadData()
                }
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
