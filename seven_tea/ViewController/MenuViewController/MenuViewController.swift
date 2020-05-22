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
var getItemDetail = [GetMenuProduct]()
var getItemPrice = [ProductPrice]()
var getitemicetemp = [ProductIceTemp]()
var getproductsize = [ProductSize]()
var categoryId = ""
class MenuViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UIPopoverPresentationControllerDelegate {
    @IBOutlet weak var itemTableview: UITableView!
    @IBOutlet weak var categoryTableview: UITableView!
    var getCategoryDetails = [GetMenuCategory]()
    let menuDetailService = MenuDetailService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ItemTableView = itemTableview
        CategoryTableView = categoryTableview
        getitemicetemp.removeAll()
        getItemPrice.removeAll()
        getItemDetail.removeAll()
        ItemTableView.tableFooterView = UIView()
        CategoryTableView.tableFooterView = UIView()
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        itemTableview.reloadData()
    }

    @IBAction func button(_ sender: Any) {
        print("我有觸發")
       dismiss(animated: true, completion: nil)
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        if tableView.tag == 0 {
            return 1
        } else {
            return 1
        }

    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView.tag == 0 {
            return GetMenuProductApi.GetStoresApiInstance.getCount()
        } else {
            return GetMenuCategoryApi.GetStoresApiInstance.getCount()
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView.tag == 1 {
            self.getCategoryDetails = GetMenuCategoryApi.GetStoresApiInstance.getlist()
            getitemicetemp = GetMenuProductApi.GetStoresApiInstance.geticetemp()
            let cell = tableView.dequeueReusableCell(withIdentifier: "Categorycell", for: indexPath) as! CategoryTableViewCell
            cell.lbCategoryName.text = getCategoryDetails[indexPath.row].category_name
            return cell
        } else {
            getItemDetail = GetMenuProductApi.GetStoresApiInstance.getmenuproductlist()
            getItemPrice = GetMenuProductApi.GetStoresApiInstance.getproductprice()
            getproductsize = GetMenuProductApi.GetStoresApiInstance.getproductsize()
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
            let menuDetailVc = menuDetailService.alert()
            menuDetailVc.itemprice = [getItemPrice[indexPath.row]]
            menuDetailVc.itemdetail = getItemDetail
            menuDetailVc.itemname = getItemDetail[indexPath.row].item_name
            menuDetailVc.itemid = getItemDetail[indexPath.row].id
            menuDetailVc.itemcategory = categoryId
            menuDetailVc.storeID = GetMenuProductApi.GetStoresApiInstance.getstoreId()
            if getproductsize.count == 1 && getproductsize[0].name == "M" {
                menuDetailVc.size_M = "is_open"
            }
            if getproductsize.count == 1 && getproductsize[0].name == "L" {
                menuDetailVc.size_L = "is_ope"
            }
            if getproductsize.count == 2 {
                menuDetailVc.size_M = "is_open"
                menuDetailVc.size_L = "is_open"
            }
            present(menuDetailVc, animated: true)
        } else {
            categoryId = getCategoryDetails[indexPath.row].id
            print("categoryId", categoryId)
            GetMenuProductApi.GetStoresApiInstance.getstores(storeId: GetMenuCategoryApi.GetStoresApiInstance.getstoreId(), catrgoryId: categoryId)
        }
    }

}
