//
//  OrderViewController.swift
//  seven_tea
//
//  Created by harrison on 2020/3/26.
//  Copyright © 2020 harrison公司機. All rights reserved.
//

import UIKit
var itemqty = [Int]()
var itemstoreId = [Int]()
var params = [data]()
var index_row = 0
var shoppingview = UIViewController()
var shoppingcartableview = UITableView()
class ShopCarViewController: UIViewController, TableViewCellDelegate, UITableViewDelegate, UITableViewDataSource {
    static let sdddd = ShopCarViewController()
    var shoppingcaritem = [GetShoppingCarItem]()
    var shoppingcardetail = [GetShoppingCarDetail]()
    @IBOutlet weak var ShoppingCarTableView: UITableView!
    override func viewDidLoad() {
        shoppingcartableview = ShoppingCarTableView
        ShoppingCarTableView.tableFooterView = UIView()
        shoppingview = self
        //        GetShoppingCarApi.GetShoppingCarInstance.getstores(token: UserInfo.UserInfoInstance.preferences.object(forKey: "token") as! String)
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        if UserInfo.UserInfoInstance.preferences.object(forKey: "token") != nil {
            ShoppingCarTableView.isHidden = false
            ShoppingCarTableView.isHidden = false
            GetShoppingCarApi.GetShoppingCarInstance.getstores(token: UserInfo.UserInfoInstance.preferences.object(forKey: "token") as! String)
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
        cell.lbQty.text = "\(self.shoppingcaritem[indexPath.row].qty)"
        cell.delegate = self
        print(self.shoppingcaritem[indexPath.row].qty)
        itemstoreId.append(self.shoppingcaritem[indexPath.row].id)
        print("diiiiiiii",itemstoreId)
        itemqty.append(self.shoppingcaritem[indexPath.row].qty)
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    func getitemqty() -> [Int] {
        return itemqty
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
            print("蛤", itemQty[i])
            let itmeqty = Params(id: itemstoreId[i], qty: itemQty[i])
            print("大聲點", itemstoreId[i], itemQty[i])
            let Params = data(id: itemstoreId[i], qty: itemQty[i])
            params.append(Params)
        }
        updateShoppingCarMessage(update: params)
        let vc = storyboard?.instantiateViewController(withIdentifier: "SandShoppingCarVC")
        show(vc!, sender: self)
    }
}
