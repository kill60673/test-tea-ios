//
//  OrderViewController.swift
//  seven_tea
//
//  Created by harrison on 2020/3/26.
//  Copyright © 2020 harrison公司機. All rights reserved.
//

import UIKit

var itemstoreId = [Int]()
var params = [data]()
var shoppingcaritemprice = [String:Int]()
var shoppingcartotalprice = 0
var index_row = 0
var shoppingdelivery = 0
var shoppingview = UIViewController()
var shoppingcartableview = UITableView()
var lbshoppingdelivery = UILabel()
var lbshoppingtotalprice = UILabel()
var itemqty = [Int]()
var itemname = [String]()
var caritemprice = [Int]()
class ShopCarViewController: UIViewController, TableViewCellDelegate, UITableViewDelegate, UITableViewDataSource {
    static let sdddd = ShopCarViewController()
    var shoppingcaritem = [GetShoppingCarItem]()
    var shoppingcardetail = [GetShoppingCarDetail]()
    @IBOutlet weak var ShoppingCarTableView: UITableView!
    @IBOutlet weak var lbTatlePrice: UILabel!
    @IBOutlet weak var lbDelivery: UILabel!
    override func viewDidLoad() {
        lbshoppingtotalprice = lbTatlePrice
        lbshoppingdelivery = lbDelivery
        shoppingcartableview = ShoppingCarTableView
        ShoppingCarTableView.tableFooterView = UIView()
        shoppingview = self
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        if UserInfo.UserInfoInstance.preferences.object(forKey: "token") != nil {
            ShoppingCarTableView.isHidden = false
            ShoppingCarTableView.isHidden = false
            GetShoppingCarApi.GetShoppingCarInstance.getstores(token: UserInfo.UserInfoInstance.preferences.object(forKey: "token") as! String)
            self.shoppingcardetail = GetShoppingCarApi.GetShoppingCarInstance.getshoppingcardetail()
        } else {
            ShoppingCarTableView.isHidden = true
            ShoppingCarTableView.isHidden = true
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let viewContorller = storyboard.instantiateViewController(withIdentifier: "LoginVc")
            show(viewContorller, sender: self)
        }
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return GetShoppingCarApi.GetShoppingCarInstance.getcaritemcount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        self.shoppingcaritem = GetShoppingCarApi.GetShoppingCarInstance.getshoppingcaritem()
        self.shoppingcardetail = GetShoppingCarApi.GetShoppingCarInstance.getshoppingcardetail()
        let cell = tableView.dequeueReusableCell(withIdentifier: "ShoppingCarCell", for: indexPath) as! ShopCarTableViewCell
        cell.lbItemName.text = self.shoppingcaritem[indexPath.row].item_name
        cell.lbSugar.text = self.shoppingcaritem[indexPath.row].sugar
        cell.lbQty.text = "共\(self.shoppingcaritem[indexPath.row].qty)杯"
        cell.lbPrice.text = "$\(self.shoppingcaritem[indexPath.row].price)"
        shoppingcaritemprice[shoppingcaritem[indexPath.row].item_name] = shoppingcaritem[indexPath.row].qty * self.shoppingcaritem[indexPath.row].price
        lbshoppingtotalprice.text = "\(self.shoppingcardetail[0].totle_price)"
        if self.shoppingcardetail[0].gap_to_delivery >= 300 {
            lbshoppingdelivery.text = "已達到可外送金額"
        }else{
            lbshoppingdelivery.text = "還差\(self.shoppingcardetail[0].gap_to_delivery)可達外送金額"
        }
        cell.delegate = self
        print(self.shoppingcaritem[indexPath.row].qty)
        itemstoreId.append(self.shoppingcaritem[indexPath.row].id)
        print("diiiiiiii", itemstoreId)
        itemqty.append(self.shoppingcaritem[indexPath.row].qty)
        itemname.append(self.shoppingcaritem[indexPath.row].item_name)
        caritemprice.append(self.shoppingcaritem[indexPath.row].price)
        shoppingcartotalprice = self.shoppingcardetail[0].totle_price
        shoppingdelivery = self.shoppingcardetail[0].gap_to_delivery
        print(shoppingcaritemprice)
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    func getitemqty() -> [Int] {
        return itemqty
    }
    func getitemname() -> [String]{
        return itemname
    }
    func getitemprice() -> [Int]{
        return caritemprice
    }
    func tableviewcelldelegate(sender: ShopCarTableViewCell) {
        guard let tappedIndexPath = ShoppingCarTableView.indexPath(for: sender)else {return}
        print("這理事", sender, tappedIndexPath)
        print("-------")
        print(sender)
        print("--------")
        print(tappedIndexPath)
        let tappedindex = tappedIndexPath
        index_row = tappedindex.row
        print("sssss", tappedindex.row)
    }
    @IBAction func NextStep(_ sender: Any) {
        for i in 0..<itemQty.count {
            print("index", itemQty.count)
            print("＝＝", itemstoreId[i], itemQty[i])
            let Params = data(id: itemstoreId[i], qty: itemQty[i])
            params.append(Params)
        }
        updateShoppingCarMessage(update: params)
        let vc = storyboard?.instantiateViewController(withIdentifier: "SandShoppingCarVC")
        show(vc!, sender: self)
    }
}
