//
//  MenuViewController.swift
//  seven_tea
//
//  Created by harrison on 2020/3/26.
//  Copyright © 2020 harrison公司機. All rights reserved.
//

import UIKit
var ItemTableView: UITableView!
var CategoryTableView: UITableView!
class MenuViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UIPopoverPresentationControllerDelegate {
    @IBOutlet weak var itemTableview: UITableView!
    @IBOutlet weak var categoryTableview: UITableView!
    var getCategoryDetails = [GetMenuCategory]()
    var getItemDetail = [GetMenuProduct]()
    var getItemPrice = [ProductPrice]()
    let menuDetailService = MenuDetailService()
    var categoryId = ""
 
    override func viewDidLoad() {
        super.viewDidLoad()
        ItemTableView = itemTableview
        CategoryTableView = categoryTableview
        ItemTableView.tableFooterView = UIView()
        CategoryTableView.tableFooterView = UIView()
       
        // Do any additional setup after loading the view.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        if tableView.tag == 0 {
            return 1
        }else{
            return 1
        }
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView.tag == 0 {
            return GetMenuProductApi.GetStoresApiInstance.getCount()
        }else{
            return GetMenuCategoryApi.GetStoresApiInstance.getCount()
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView.tag == 1 {
            self.getCategoryDetails = GetMenuCategoryApi.GetStoresApiInstance.getlist()
            let cell = tableView.dequeueReusableCell(withIdentifier: "Categorycell", for: indexPath) as! CategoryTableViewCell
            cell.lbCategoryName.text = getCategoryDetails[indexPath.row].category_name
            return cell
        }
        else {
            self.getItemDetail = GetMenuProductApi.GetStoresApiInstance.getmenuproductlist()
            self.getItemPrice = GetMenuProductApi.GetStoresApiInstance.getproductprice()
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "MenuCell", for: indexPath) as! MenuTableViewCell
            cell.lbItemName.text = getItemDetail[indexPath.row].item_name
            if getItemPrice[indexPath.row].size == "M" && getItemPrice[indexPath.row].temp == "冷"{
                cell.lbSizeMPrice.text = getItemPrice[indexPath.row].price
            }
            if getItemPrice[indexPath.row].size == "L" && getItemPrice[indexPath.row].temp == "冷"{
                cell.lbSizeLPrice.text = getItemPrice[indexPath.row].price
            }
            return cell
        }
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if tableView.tag == 0 {
            print(indexPath.row)
            let menuDetailVc = menuDetailService.alert()
            present(menuDetailVc, animated: true)
        }else{
            self.categoryId = getCategoryDetails[indexPath.row].id
            GetMenuProductApi.GetStoresApiInstance.getstores(storeId: GetMenuCategoryApi.GetStoresApiInstance.getstoreId(), catrgoryId: self.categoryId)
        }
    }
    
    
}
