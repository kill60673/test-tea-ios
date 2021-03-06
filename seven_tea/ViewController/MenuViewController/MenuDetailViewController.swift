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
var temperature = ""
var menudetailqty = 0
var itemsize = ""
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
    @IBOutlet weak var lbFixedTemperatureCold: UILabel!
    @IBOutlet weak var lbTemperature: UILabel!
    @IBOutlet weak var lbFlxedTemperatureHot: UILabel!
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
    var status = ""
    var changtemp = ""
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
        lbFixedTemperatureCold.isHidden = true
        lbFlxedTemperatureHot.isHidden = true
        btAddShopingcar.customized_button(button: btAddShopingcar)
        btMyFavourite.customized_button(button: btMyFavourite)
        lbFixedTemperatureCold.oval_label(label: lbFixedTemperatureCold)
        lbFlxedTemperatureHot.oval_label(label: lbFlxedTemperatureHot)
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
            if changtemp == ""{
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
        if itemdetail[0].is_fixed == 1 {
            lbFixedTemperatureCold.isHidden = false
            tempname = "固定冷"
        }else if itemdetail[0].is_fixed == 2 {
            lbFlxedTemperatureHot.isHidden = false
            tempname = "固定熱"
        }
        switch collectionView.tag {
        case 0:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TempCell", for: indexPath) as!
            TempCollectionViewCell
            if changtemp == ""{
                cell.lbTemp.text = self.icetemp[indexPath.row].ice
            } else {
                cell.lbTemp.text = self.hottemp[indexPath.row].hot
            }
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
            if changtemp == ""{
                 self.tempname = self.icetemp[indexPath.row].ice
            } else {
                 self.tempname = self.hottemp[indexPath.row].hot
            }
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
        itemsize = "M"
        operation()
    }
    @IBAction func btSizeL(_ sender: Any) {
        btSizeL.backgroundColor = UIColor.yellow
        btSizeM.backgroundColor = UIColor.white
        itemsize = "L"
        operation()
    }
    @IBAction func btTemperatureHot(_ sender: Any) {
        btTemperatureHot.backgroundColor = UIColor.yellow
        btTemperatureCold.backgroundColor = UIColor.white
        if status == "0" || status == "1"{
            temperature = ""
        } else {
            temperature = "熱"
        }
        changtemp = "hot"
        tempCollectionview.reloadData()
        lbTemperature.text = "熱度"
        operation()
    }
    @IBAction func btTemperatureCold(_ sender: Any) {
        btTemperatureCold.backgroundColor = UIColor.yellow
        btTemperatureHot.backgroundColor = UIColor.white
        if status == "0" || status == "1"{
            temperature = ""
        } else {
            temperature = "冷"
        }
        changtemp = ""
        tempCollectionview.reloadData()
        lbTemperature.text = "冰度"
        operation()
    }

    @IBAction func btAddShopingCar(_ sender: Any) {
        getAddShopingCarMessage(item_id: Int(itemid)!, item_name: itemname, item_category: Int(itemcategory)!, tmp: tempname, sugar: sugarname, size: itemsize, add: feed, store_id: Int(storeID)!, qty: menudetailqty, total_price: self.total_price)
    }
    @IBAction func btAddMyFavorite(_ sender: Any) {
        getAddFavoriteMessage(item_id: Int(itemid)!, item_name: itemname, item_category: Int(itemcategory)!, tmp: tempname, sugar: sugarname, size: itemsize, add: feed, store_id: Int(storeID)!, price: self.total_price)
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
        }
        itemprice = itempricelist["\(itemsize)\(temperature)"] ?? 0
        self.total_price = (itemprice + feedprice) * menudetailqty
        lbtotalprice.text = "$\(self.total_price)"
    }
}
