//
//  OrderViewController.swift
//  seven_tea
//
//  Created by harrison on 2020/3/26.
//  Copyright © 2020 harrison公司機. All rights reserved.
//

import UIKit

class ShopCarViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
 
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
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        <#code#>
    }
}
