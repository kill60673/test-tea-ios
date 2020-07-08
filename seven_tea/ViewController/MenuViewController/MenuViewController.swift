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
//          dictionary需要存key 用itemName來存 然後比對的部分 用dictionary+itemname來比對以後將值放入
            getItemDetail = GetMenuProductApi.GetStoresApiInstance.getmenuproductlist()
            getItemPrice = GetMenuProductApi.GetStoresApiInstance.getproductprice()
            getproductsize = GetMenuProductApi.GetStoresApiInstance.getproductsize()
            let cell = tableView.dequeueReusableCell(withIdentifier: "MenuCell", for: indexPath) as! MenuTableViewCell
            cell.lbItemName.text = getItemDetail[indexPath.row].item_name
            cell.lbSizeMPrice.text = "無販售"
            cell.lbSizeLPrice.text = "無販售"
            print(getItemPrice.count)
                print("\(getItemDetail[indexPath.row].item_name)")
                print("iiicount", getItemDetail[indexPath.row].itempricedetail.count)
                for i in 0..<getItemDetail[indexPath.row].itempricedetail.count {
                    let itemsize = getItemDetail[indexPath.row].itempricedetail[i].size
                    let itemtemp = getItemDetail[indexPath.row].itempricedetail[i].temp
                    let itemprice = getItemDetail[indexPath.row].itempricedetail[i].price
                    print("itemsizeindex", getItemDetail[indexPath.row].itempricedetail[i].size)
                    print("itemSize", itemsize)
                    if itemsize == "M" && itemprice != "" {
                        cell.lbSizeMPrice.text = "\(getItemDetail[indexPath.row].itempricedictionary["\(itemsize)\(itemtemp)"] ?? 0)"
                    }
                    if itemsize == "L" && itemprice != ""{
                        cell.lbSizeLPrice.text = "\(getItemDetail[indexPath.row].itempricedictionary["\(itemsize)\(itemtemp)"] ?? 0)"
                    }
                }
            return cell
        }
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if tableView.tag == 0 {
            let menuDetailVc = menuDetailService.alert()
            menuDetailVc.itemdetail = getItemDetail
            menuDetailVc.itemname = getItemDetail[indexPath.row].item_name
            menuDetailVc.itemid = getItemDetail[indexPath.row].id
            menuDetailVc.itemcategory = categoryId
            menuDetailVc.status = getItemDetail[indexPath.row].status
            menuDetailVc.storeID = GetMenuProductApi.GetStoresApiInstance.getstoreId()
            print(getproductsize.count, "ㄅ")
            print(getItemDetail[indexPath.row].size.count, "indexpathrow")
            if getItemDetail[indexPath.row].size.count == 1 && getItemDetail[indexPath.row].size[0].name == "M" {
                menuDetailVc.size_M = "is_open"
            }
            if getItemDetail[indexPath.row].size.count == 1 && getItemDetail[indexPath.row].size[0].name == "L" {
                menuDetailVc.size_L = "is_open"
            }
            if getItemDetail[indexPath.row].size.count == 2 {
                menuDetailVc.size_M = "is_open"
                menuDetailVc.size_L = "is_open"
            }
            present(menuDetailVc, animated: true)
        } else {
            categoryId = getCategoryDetails[indexPath.row].id
            GetMenuProductApi.GetStoresApiInstance.getstores(storeId: GetMenuCategoryApi.GetStoresApiInstance.getstoreId(), catrgoryId: categoryId)
        }
    }

}
