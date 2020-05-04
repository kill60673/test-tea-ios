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
    var producticetemp = [ProductIceTemp]()
    var producthottemp = [ProductHotTemp]()
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
                    self.producthottemp.removeAll()
                    self.producticetemp.removeAll()

                    for i in 0..<json["data"].count {
                        let data = json["data"][i]
                        for size in 0..<data["size"].count {
                            let size = ProductSize(id: data["size"][size]["id"].int!, name: data["size"][size]["name"].string!)
                            self.productsize.append(size)
                        }
                        switch data["status"].string {
                        case "0":
                            for price in 0..<data["price"].count {
                                let price = ProductPrice(size: data["price"][price]["size"].string!, temp: nil, price: "\(data["price"][price]["price"])", area: nil)
                                self.productprice.append(price)
                            }
                            break
                        case "1":
                            for price in 0..<data["price"].count {
                                let price = ProductPrice(size: data["price"][price]["size"].string!, temp: nil, price: "\(data["price"][price]["price"])", area: data["price"][price]["area"].string!)
                                self.productprice.append(price)
                            }
                            break
                        case "2":
                            for price in 0..<data["price"].count {
                                let price = ProductPrice(size: data["price"][price]["size"].string!, temp: data["price"][price]["temp"].string!, price: "\(data["price"][price]["price"])", area: "")
                                self.productprice.append(price)
                            }
                            break
                        default:
                            for price in 0..<data["price"].count {
                                let price = ProductPrice(size: data["price"][price]["size"].string!, temp: data["price"][price]["temp"].string!, price: "\(data["price"][price]["price"])", area: "\(data["price"][price]["area"])")
                                self.productprice.append(price)
                            }
                            break
                        }
                        for icetemp in 0..<data["ice_temp"].count {
                            let productice = ProductIceTemp(ice: data["ice_temp"][icetemp].string!)
                            self.producticetemp.append(productice)
                        }
                        for hottemp in 0..<data["hot_temp"].count {
                            let producthot = ProductHotTemp(hot: data["hot_temp"][hottemp].string!)
                            self.producthottemp.append(producthot)
                        }
                        for sugar in 0..<data["sugar"].count {
                            let sugar = ProductSugar(name: data["sugar"][sugar]["name"].string!, is_active: data["sugar"][sugar]["is_active"].bool!)
                            print("一包三十山胞一百", sugar.name)
                            self.productsugar.append(sugar)
                        }

                        for add in 0..<data["add"].count {
                            let add = ProductAdd(id: data["add"][add]["id"].int!, name: data["add"][add]["name"].string!, price: data["add"][add]["price"].string!)
                            self.productadd.append(add)
                        }
                        let getmenuproduct = GetMenuProduct(id: data["id"].string!, item_name: data["item_name"].string!, picture_url: data["picture_url"].string!, is_fixed: data["is_fixed"].int!)
                        self.productlist.append(getmenuproduct)
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
    func getproductsize() -> [ProductSize] {
        return productsize
    }
    func getproductsugar() -> [ProductSugar] {
        return productsugar
    }
    func getproducttemp() -> [ProductTemp] {
        return producttemp
    }
    func getproductprice() -> [ProductPrice] {
        return productprice
    }
    func getproductadd() -> [ProductAdd] {
        return productadd
    }
    func getCount() -> Int {
        return productlist.count
    }
    func geticetemp() -> [ProductIceTemp] {
        return producticetemp
    }
    func gethottemp() -> [ProductHotTemp] {
        return producthottemp
    }
}
