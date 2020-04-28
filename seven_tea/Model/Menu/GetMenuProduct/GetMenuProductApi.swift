//
//  GetMenuProductApi.swift
//  seven_tea
//
//  Created by harrison on 2020/4/25.
//  Copyright © 2020 harrison公司機. All rights reserved.
//

import Foundation
import UIKit
import SwiftyJSON

class GetMenuProductApi {
    var productlist = [GetMenuProduct]()
    var urlString = ""
    var productsize = [ProductSize]()
    var productprice = [ProductPrice]()
    var productsugar = [ProductSugar]()
    var producttemp = [ProductTemp]()
    var productadd = [ProductAdd]()
    static let GetStoresApiInstance = GetMenuProductApi()
    func getstores(storeId: Int, catrgoryId: String) {
        urlString = ApiUrl.ApiUrlInstance.getmenuproduct+"\(storeId)/\(catrgoryId)"
        let url = URL(string: urlString)!
        print(url)
        var request = URLRequest(url: url )
        print("url...", url)
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        request.httpMethod = "GET"
        let task = URLSession.shared.dataTask(with: request) {
            data, _, error in
            do {
                let json = try JSON(data: data!)
                if json["success"].bool! == true {
                    self.productlist.removeAll()
                    self.productprice.removeAll()
                    self.productsize.removeAll()
                    self.productadd.removeAll()
                    self.productsugar.removeAll()
                    self.producttemp.removeAll()
                    for i in 0..<json["data"].count {
                        let data = json["data"][i]
                        for size in 0..<data["size"].count{
                            let size = ProductSize(id: data["size"][size]["id"].int!, name: data["size"][size]["name"].string!)
                            self.productsize.append(size)
                        }
                        switch data["status"].string {
                        case "0":
                            for price in 0..<data["price"].count{
                                let price = ProductPrice(size: data["price"][price]["size"].string!, temp: nil, price: "\(data["price"][price]["price"])", area: nil)
                                self.productprice.append(price)
                            }
                            break
                        case "1":
                            for price in 0..<data["price"].count{
                                let price = ProductPrice(size: data["price"][price]["size"].string!, temp: nil, price: "\(data["price"][price]["price"])", area: data["price"][price]["area"].string!)
                                self.productprice.append(price)
                            }
                            break
                        case "2":
                            for price in 0..<data["price"].count{
                                let price = ProductPrice(size: data["price"][price]["size"].string!, temp: data["price"][price]["temp"].string!, price: "\(data["price"][price]["price"])", area: "")
                                self.productprice.append(price)
                            }
                            break
                        default:
                            for price in 0..<data["price"].count{
                                let price = ProductPrice(size: data["price"][price]["size"].string!, temp: data["price"][price]["temp"].string!, price: "\(data["price"][price]["price"])", area: "\(data["price"][price]["area"])")
                                self.productprice.append(price)
                            }
                            print("近3")
                            break
                        }
                        for sugar in 0..<data["sugar"].count{
                            let sugar = ProductSugar(name: data["sugar"][sugar]["name"].string!, is_active: data["sugar"][sugar]["is_active"].bool!)
                            self.productsugar.append(sugar)
                            print(sugar.name)
                        }
                        for temp in 0..<data["temp"].count{
                            let temp = ProductTemp(name: data["temp"][temp]["name"].string!, is_active: data["temp"][temp]["is_active"].bool!)
                            self.producttemp.append(temp)
                            print(temp.name)
                        }
                        for add in 0..<data["add"].count{
                            let add = ProductAdd(id: data["add"][add]["id"].int!, name: data["add"][add]["name"].string!, price: data["add"][add]["price"].string!)
                            self.productadd.append(add)
                            print(add.name)
                        }
                        let getmenuproduct = GetMenuProduct(id: data["id"].string!, item_name: data["item_name"].string!, picture_url: data["picture_url"].string!)
                        self.productlist.append(getmenuproduct)
                        print(self.productlist.count)
                    }
                } else {
                    //主線程
                    DispatchQueue.main.async {
                        MessageAlert.Instance.message(message: json["message"].string!)
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
                if NearByStoresTableView == nil {
                    
                } else {
                    print("我有進來這裡")
                    ItemTableView.reloadData()
                }
            }
        }
        task.resume()
    }
    func getmenuproductlist() -> [GetMenuProduct] {
        return productlist
    }
    func getproductsize() -> [ProductSize]{
        return productsize
    }
    func getproductsugar() -> [ProductSugar]{
        return productsugar
    }
    func getproducttemp() -> [ProductTemp]{
        return producttemp
    }
    func getproductprice() -> [ProductPrice]{
        return productprice
    }
    func getproductadd() -> [ProductAdd]{
        return productadd
    }
    func getCount() -> Int {
        return productlist.count
    }
    
}
