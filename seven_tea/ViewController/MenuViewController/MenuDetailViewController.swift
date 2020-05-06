//
//  OrderDetailViewController.swift
//  seven_tea
//
//  Created by harrison on 2020/4/9.
//  Copyright © 2020 harrison公司機. All rights reserved.
//

import UIKit
var tempcollectionview: UICollectionView!
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
    var itemprice = [ProductPrice]()
    var itemdetail = [GetMenuProduct]()
    let icetemp = GetMenuProductApi.GetStoresApiInstance.geticetemp()
    var hottemp = [ProductHotTemp]()
    var itemsugar = [ProductSugar]()
    var itemadd = [ProductAdd]()
    var Size = ""
    var Temperature = "Cold"
    var tmp = ""
    var itemid = ""
    var Sugar = ""
    var itemname = ""
    var itemcategory = ""
    var storeID = ""
    var tempname = ""
    var sugarname = ""
    override func viewDidLoad() {
        tempcollectionview = tempCollectionview
        self.itemsugar = GetMenuProductApi.GetStoresApiInstance.getproductsugar()
        self.itemadd = GetMenuProductApi.GetStoresApiInstance.getproductadd()
        self.hottemp = GetMenuProductApi.GetStoresApiInstance.gethottemp()
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
            if Temperature == "Cold"{
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

    @IBAction func brClose(_ sender: Any) {
        dismiss(animated: true)
    }

    @IBAction func btSizeM(_ sender: Any) {
        btSizeM.backgroundColor = UIColor.yellow
        btSizeL.backgroundColor = UIColor.white
        self.Size = "M"
    }
    @IBAction func btSizeL(_ sender: Any) {
        btSizeL.backgroundColor = UIColor.yellow
        btSizeM.backgroundColor = UIColor.white
        self.Size = "L"
    }
    @IBAction func btTemperatureHot(_ sender: Any) {
        btTemperatureHot.backgroundColor = UIColor.yellow
        btTemperatureCold.backgroundColor = UIColor.white
        self.Temperature = "Hot"
        tempCollectionview.reloadData()
        lbTemperature.text = "熱度"
    }
    @IBAction func btTemperatureCold(_ sender: Any) {
        btTemperatureCold.backgroundColor = UIColor.yellow
        btTemperatureHot.backgroundColor = UIColor.white
        self.Temperature = "Cold"
        tempCollectionview.reloadData()
        lbTemperature.text = "冰度"
    }

    @IBAction func btAddShopingCar(_ sender: Any) {
        getAddShopingCarMessage(item_id: Int(itemid)!, item_name: itemname, item_category: Int(itemcategory)!, tmp: tempname, sugar: sugarname, size: Size, add: feed, store_id: Int(storeID)!, qty: 1, total_price: 50)
    }
}
