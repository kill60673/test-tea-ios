//
//  OrderAPI.swift
//  seven_tea
//
//  Created by harrison on 2020/3/31.
//  Copyright © 2020 harrison公司機. All rights reserved.
//

import Foundation
import UIKit
class OrderRecordAPI: NSObject {
    static let OrderRecordInstance = OrderRecordAPI()

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
                    print("哈囉你好嗎 嘿嘿")
                    OrderId.removeAll()
                    OrderNo.removeAll()
                    Name.removeAll()
                    Phone.removeAll()
                    OrdererPhone.removeAll()
                    ArrivalTime.removeAll()
                    OrderAddress.removeAll()
                    OrderStore.removeAll()
                    OrderTime.removeAll()
                    Company.removeAll()
                    TaxId.removeAll()
                    OrderStatus.removeAll()
                    PayMethod.removeAll()
                    GetMethod.removeAll()
                    Quantity.removeAll()
                    Price.removeAll()

                    for result in Info.message! {

                        OrderId.append(result.id)
                        OrderNo.append(result.order_no)
                        Name.append(result.name)
                        Phone.append(result.orderer_phone)
                        OrdererPhone.append(result.orderer_phone)
                        ArrivalTime.append(result.arrival_time)
                        OrderAddress.append(result.address)
                        OrderStore.append(result.store)
                        OrderTime.append(result.order_time)
                        Company.append(result.company)
                        TaxId.append(result.tax_id)
                        OrderStatus.append(result.status)
                        PayMethod.append(result.pay_method)
                        GetMethod.append(result.get_method)
                        Quantity.append(result.quantity)
                        Price.append(result.price)

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

}
