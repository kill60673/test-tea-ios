//
//  OrderDetailViewController.swift
//  seven_tea
//
//  Created by harrison on 2020/4/9.
//  Copyright © 2020 harrison公司機. All rights reserved.
//

import UIKit
var tempcollectionview: UICollectionView!
var feedprice = 0
var itemprice = 0
var Temperature = "冷"
var menudetailqty = 0
var Size = ""
var lbtotalprice = UILabel()
class MenuDetailViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    @IBOutlet weak var sugarCollectionview: UICollectionView!
    @IBOutlet weak var tempCollectionview: UICollectionView!
    @IBOutlet weak var feedCollectionView: UICollectionView!
    @IBOutlet weak var lbTitle: UILabel!
    @IBOutlet weak var btClose: UIButton!
    @IBOutlet weak var btSizeM: UIButton!
    @IBOutlet weak var btSizeL: UIButton!
    @IBOutlet weak var btTemperatureHot: UIButton!
    @IBOutlet weak var btTemperatureCold: UIButton!
    @IBOutlet weak var btPlus: UIButton!
    @IBOutlet weak var btLess: UIButton!
    @IBOutlet weak var btAddShopingcar: UIButton!
    @IBOutlet weak var btMyFavourite: UIButton!
    @IBOutlet weak var lbQuantity: UILabel!
    @IBOutlet weak var lbTotalAmount: UILabel!
    @IBOutlet weak var lbFixedTemperature: UILabel!
    @IBOutlet weak var lbTemperature: UILabel!
    static let MenuDetailInstance = MenuDetailViewController()
    //    var itemprice = [ProductPrice]()
    var itemdetail = [GetMenuProduct]()
    let icetemp = GetMenuProductApi.GetStoresApiInstance.geticetemp()
    var hottemp = [ProductHotTemp]()
    var itemsugar = [ProductSugar]()
    var itemadd = [ProductAdd]()

    var size_M = "no_open"
    var size_L = "no_open"
    var tmp = ""
    var itemid = ""
    var Sugar = ""
    var itemname = ""
    var itemcategory = ""
    var storeID = ""
    var tempname = ""
    var sugarname = ""
    var total_price = 0
    override func viewDidLoad() {
        tempcollectionview = tempCollectionview
        self.itemsugar = GetMenuProductApi.GetStoresApiInstance.getproductsugar()
        self.itemadd = GetMenuProductApi.GetStoresApiInstance.getproductadd()
        self.hottemp = GetMenuProductApi.GetStoresApiInstance.gethottemp()
        lbtotalprice = lbTotalAmount
        btSizeL.oval_button(button: btSizeL)
        btSizeM.oval_button(button: btSizeM)
        btTemperatureHot.oval_button(button: btTemperatureHot)
        btTemperatureCold.oval_button(button: btTemperatureCold)
        lbFixedTemperature.isHidden = true
        btAddShopingcar.customized_button(button: btAddShopingcar)
        btMyFavourite.customized_button(button: btMyFavourite)
        lbFixedTemperature.oval_label(label: lbFixedTemperature)
        super.viewDidLoad()
        lbTitle.text = itemname
        view?.backgroundColor = UIColor(white: 1, alpha: 0)
        if self.size_M == "no_open"{
            btSizeM.isHidden = true
        }
        if self.size_L == "no_open"{
            btSizeL.isHidden = true
        }
        // Do any additional setup after loading the view.
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        switch collectionView.tag {
        case 0:
            return 1
        case 1:
            return 1
        default:
            return 1
        }
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView.tag {
        case 0:
            if Temperature == "冷"{
                return self.icetemp.count
            } else {
                return self.hottemp.count
            }
        case 1:
            return itemsugar.count
        default:
            return itemadd.count
        }
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch collectionView.tag {
        case 0:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TempCell", for: indexPath) as!
            TempCollectionViewCell
            cell.lbTemp.text = self.icetemp[indexPath.row].ice
            if cell.lbTemp.text != tempname {
                cell.lbTemp.backgroundColor = UIColor.white
                cell.tempView.backgroundColor = UIColor.white
            } else {
                cell.lbTemp.backgroundColor = UIColor.yellow
                cell.tempView.backgroundColor = UIColor.yellow
            }
            cell.tempView.oval_label(view: cell.tempView)
            return cell
        case 1:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SugarCell", for: indexPath) as!
            SugarCollectionViewCell
            cell.lbSugar.text = self.itemsugar[indexPath.row].name
            if cell.lbSugar.text != self.sugarname {
                cell.lbSugar.backgroundColor = UIColor.white
                cell.sugarView.backgroundColor = UIColor.white
            } else {
                cell.lbSugar.backgroundColor = UIColor.yellow
                cell.sugarView.backgroundColor = UIColor.yellow
            }
            cell.sugarView.oval_label(view: cell.sugarView)
            return cell
        default:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FeedCell", for: indexPath) as!
            FeedCollectionViewCell
            cell.btFeed.setTitle(itemadd[indexPath.row].name, for: .normal)
            print("\(String(describing: cell.btFeed.titleLabel?.text!))")
            cell.btFeed.oval_button(button: cell.btFeed)
            cell.btFeed.backgroundColor = UIColor.white
            return cell
        }
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        switch collectionView.tag {
        case 0:
            self.tempname = self.icetemp[indexPath.row].ice
            print("tempname", self.tempname)
            tempCollectionview.reloadData()
        case 1 :
            self.sugarname = self.itemsugar[indexPath.row].name
            print("sugarname", self.sugarname)
            sugarCollectionview.reloadData()
        default:
            break
        }
    }

    @IBAction func btClose(_ sender: Any) {
        feed.removeAll()
        itemprice = 0
        feedprice = 0
        menudetailqty = 0
        dismiss(animated: true)
    }

    @IBAction func btSizeM(_ sender: Any) {
        btSizeM.backgroundColor = UIColor.yellow
        btSizeL.backgroundColor = UIColor.white
        Size = "M"
        operation()
    }
    @IBAction func btSizeL(_ sender: Any) {
        btSizeL.backgroundColor = UIColor.yellow
        btSizeM.backgroundColor = UIColor.white
        Size = "L"
        operation()
    }
    @IBAction func btTemperatureHot(_ sender: Any) {
        btTemperatureHot.backgroundColor = UIColor.yellow
        btTemperatureCold.backgroundColor = UIColor.white
        Temperature = "熱"
        tempCollectionview.reloadData()
        lbTemperature.text = "熱度"
        operation()
    }
    @IBAction func btTemperatureCold(_ sender: Any) {
        btTemperatureCold.backgroundColor = UIColor.yellow
        btTemperatureHot.backgroundColor = UIColor.white
        Temperature = "冷"
        tempCollectionview.reloadData()
        lbTemperature.text = "冰度"
        operation()
    }

    @IBAction func btAddShopingCar(_ sender: Any) {
        getAddShopingCarMessage(item_id: Int(itemid)!, item_name: itemname, item_category: Int(itemcategory)!, tmp: tempname, sugar: sugarname, size: Size, add: feed, store_id: Int(storeID)!, qty: menudetailqty, total_price: 50)
        print("爆破", itemid, itemname, itemcategory, tempname, sugarname, Size, feed, storeID)
    }
    @IBAction func btAddMyFavorite(_ sender: Any) {
        getAddFavoriteMessage(item_id: Int(itemid)!, item_name: itemname, item_category: Int(itemcategory)!, tmp: tempname, sugar: sugarname, size: Size, add: feed, store_id: Int(storeID)!, price: 50)
    }

    @IBAction func btLess(_ sender: Any) {
        if menudetailqty > 0 {
            menudetailqty -= 1
        }
        lbQuantity.text = "\(menudetailqty)"
        operation()
    }

    @IBAction func btPlus(_ sender: Any) {
        if menudetailqty < 99 {
            menudetailqty += 1
        }
        lbQuantity.text = "\(menudetailqty)"
        operation()
    }
    func operation() {
        let itempricelist = GetMenuProductApi.GetStoresApiInstance.getItemPrice()
        let feedpricelist = GetMenuProductApi.GetStoresApiInstance.getFeedPrice()
        feedprice = 0
        for i in 0..<feed.count {
            feedprice += feedpricelist["\(feed[i])"] ?? 0
            print(feedprice, "feedprice在這裏")
            print(feed[i])
        }
        print(Size)
        print(Temperature)
        itemprice = itempricelist["\(Size)\(Temperature)"] ?? 0
        print(itemprice, "這邊啊你")
        self.total_price = (itemprice + feedprice) * menudetailqty
        print(self.total_price, "totlepriceeeeee")
        lbtotalprice.text = "$\(self.total_price)"
    }
}
