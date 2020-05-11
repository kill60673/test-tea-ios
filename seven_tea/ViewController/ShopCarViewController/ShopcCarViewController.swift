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
var params = [Params]()
var index_row = 0
class ShopCarViewController:UIViewController, TableViewCellDelegate,UITableViewDelegate,UITableViewDataSource {
    static let sdddd = ShopCarViewController()
    @IBOutlet weak var ShoppingCarTableView: UITableView!
    var shoppingcaritem = [GetShoppingCarItem]()
    var shoppingcardetail = [GetShoppingCarDetail]()
    override func viewDidLoad() {
        GetShoppingCarApi.GetShoppingCarInstance.getstores(token: UserInfo.UserInfoInstance.preferences.object(forKey: "token") as! String)
        self.shoppingcaritem = GetShoppingCarApi.GetShoppingCarInstance.getcaritem
        self.shoppingcardetail = GetShoppingCarApi.GetShoppingCarInstance.getcardetail
        ShoppingCarTableView.tableFooterView = UIView()
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return GetShoppingCarApi.GetShoppingCarInstance.getcaritemcount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ShoppingCarCell", for: indexPath) as! ShopCarTableViewCell
        cell.lbItemName.text = self.shoppingcaritem[indexPath.row].item_name
        cell.lbSugar.text = self.shoppingcaritem[indexPath.row].sugar
        cell.lbQty.text = "\(self.shoppingcaritem[indexPath.row].qty)"
        cell.delegate = self
        print(shoppingcaritem[indexPath.row].qty)
        itemstoreId.append(shoppingcaritem[indexPath.row].id)
        itemqty.append(shoppingcaritem[indexPath.row].qty)
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
//    func getitemId() -> [Int]{
//        return itemId
//    }
    func getitemqty() -> [Int]{
//        print("sss",itemqty)
        return itemqty
    }
    func tableviewcelldelegate(sender: ShopCarTableViewCell) {
        guard let tappedIndexPath = ShoppingCarTableView.indexPath(for: sender)else{return}
        print("這理事",sender,tappedIndexPath)
        print("-------")
        print(sender)
        print("--------")
        print(tappedIndexPath)
        let tappedindex = tappedIndexPath
        index_row = tappedindex.row
        print("sssss",tappedindex.row)
    }
    @IBAction func NextStep(_ sender: Any) {
        for i in 0..<itemQty.count {
        print("蛤",itemQty[i])
            let itmeqty = Params(id: itemstoreId[i], qty: itemQty[i])
            print("大聲點",itemstoreId[i],itemQty[i])
            params.append(itmeqty)
        }
    }
}
