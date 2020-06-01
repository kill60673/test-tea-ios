//
//  GetMemberOrderDetailApi.swift
//  seven_tea
//
//  Created by harrison on 2020/6/1.
//  Copyright © 2020 harrison公司機. All rights reserved.
//

import Foundation
import UIKit
import SwiftyJSON
class GetMemberOrderDetailApi {
    var memberorderitemafeedlist = [MemberItemAdd]()
    var memberorderdetailitem = [GetMemberOrderDetailItem]()
    var memberorderdetail = [GetMemberOrderDetail]()
    var memberorderdtailaddress = [GetMemberOrderDetailAddress]()
    var urlString = ""
    var newToken = ""
    static let GetMemberOrderMemberApiInstance = GetMemberOrderDetailApi()
    func getmemberorderitem(token: String,order_no:String) {
        urlString = ApiUrl.ApiUrlInstance.getmemberorderdetail+"/\(order_no)"
        let url = URL(string: urlString)!
        var request = URLRequest(url: url )
        print("ㄎㄎ", token)
        print("url...", url)
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        request.setValue(token, forHTTPHeaderField: "Authorization")
        request.httpMethod = "GET"
        let task = URLSession.shared.dataTask(with: request) {
            data, response, error in
            let httpStatus = response as! HTTPURLResponse
            print("為什麼9991", httpStatus.allHeaderFields["Authorization"])
            if httpStatus.allHeaderFields["Authorization"] != nil {
                print("我有進來2")
                self.newToken = "\(httpStatus.allHeaderFields["Authorization"]!)"
                UserInfo.UserInfoInstance.update(oldToken: token, newToken: "\(httpStatus.allHeaderFields["Authorization"]!)")
            } else {
                print("tokennnnn", token)
                print("我有進來3")
            }
            do {
                let json = try JSON(data: data!)
                print("reeeeeeee", json["success"].bool!)
                if json["success"].bool! == true {
                    self.memberorderitemafeedlist.removeAll()
                    self.memberorderdetailitem.removeAll()
                    self.memberorderdetail.removeAll()
                    for i in 0..<json["data"].count {
                        let data = json["data"][i]
                        for item in 0..<data["item"].count {
                            let itemdata = data["item"][item]
                            for add in 0..<itemdata["add"].count{
                                let add = MemberItemAdd(id: itemdata["add"][add]["id"].int!, name: itemdata["add"][add]["name"].string!)
                                self.memberorderitemafeedlist.append(add)
                            }
                            let memberorderitem = GetMemberOrderDetailItem(id: data["item"][item]["id"].string!, qty: data["item"][item]["qty"].int!, tmp: data["item"][item]["tmp"].string!, size: data["item"][item]["size"].string!, total_price: data["item"][item]["total_price"].int!, sugar: data["item"][item]["sugar"].string!, item_id: data["item"][item]["item_id"].int!, item_name: data["item"][item]["item_name"].string!, add: self.memberorderitemafeedlist, store_id: data["item"][item]["store_id"].int!, item_category: data["item"][item]["item_category"].string!)
                            self.memberorderdetailitem.append(memberorderitem)
                        }
                        for address in 0..<data["address"].count{
                            let memberorderdetailaddress = GetMemberOrderDetailAddress(zipcode: data["address"][address]["zipcode"].string ?? "", city: data["address"][address]["city"].string ?? "", district: data["address"][address]["district"].string ?? "", address: data["address"][address]["address"].string!)
                            self.memberorderdtailaddress.append(memberorderdetailaddress)
                        }
                        let memberorder = GetMemberOrderDetail(order_no: data["order_no"].string!, order_status: data["order_status"].string!, store: data["store"].string!, total_qty:  data["total_qty"].int!, total_price: data["total_price"].int!, item: self.memberorderdetailitem, recipient: data["recipient"].string!, recipient_tel: data["recipient_tel"].string!, tax_code: data["tax_code"].string!, pay_method: data["pay_method"].string!, note: data["note"].string!, created_at: data["created_at"].string!, address: self.memberorderdtailaddress)
                        self.memberorderdetail.append(memberorder)
                        print("有",memberorder.store)
                    }
                } else {
                    //主線程
                    self.memberorderdetail.removeAll()
                    DispatchQueue.main.async {
                        //                        MessageAlert.Instance.message(message: json["message"].string!)
                    }
                }
                
            } catch {
                //主線程
                DispatchQueue.main.async {
                    MessageAlert.Instance.message(message: "資料解析錯誤")
                    print("這邊是錯誤", error)
                }
            }
            //主線程
            DispatchQueue.main.async {
                if OrderTableView != nil {
                    print("有近Reload")
                    OrderTableView.reloadData()
                }
            }
        }
        task.resume()
    }
    func getmemberneworder() -> [GetMemberOrderDetail] {
        print("是可達鴨頂著鐵甲蛹",self.memberorderdetail.count)
        return self.memberorderdetail
    }
    func getordercount() -> Int{
        return self.memberorderdetail.count
    }
}
