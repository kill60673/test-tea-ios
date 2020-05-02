//
//  OrderDetailViewController.swift
//  seven_tea
//
//  Created by harrison on 2020/4/9.
//  Copyright © 2020 harrison公司機. All rights reserved.
//

import UIKit

class MenuDetailViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
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
    var itemprice = [ProductPrice]()
    var itemdetail = [GetMenuProduct]()
    var icetemp = [ProductIceTemp]()
    var Size = ""
    var TemperatureHot = ""
    var Sugar = ""
    var itemname = ""
    override func viewDidLoad() {
        print("山胞",icetemp)
//        tempCollectionview.reloadData()
        self.icetemp = GetMenuProductApi.GetStoresApiInstance.geticetemp()
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
        print("我有重整",icetemp.count)
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
            return icetemp.count
        case 1:
            return itemdetail.count
        default:
            return feedlist.count
        }
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch collectionView.tag {
        case 0:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TempCell", for: indexPath) as!
            TempCollectionViewCell
            cell.btTemp.setTitle(icetemp[indexPath.row].ice, for: .normal)
            cell.btTemp.oval_button(button: cell.btTemp)
            print("這裡是cell裡的ice",icetemp[indexPath.row].ice)
            cell.btTemp.backgroundColor = UIColor.white
            return cell
        case 1:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SugarCell", for: indexPath) as!
            SugarCollectionViewCell
            cell.btSugar.setTitle(itemdetail[indexPath.row].item_name, for: .normal)
            cell.btSugar.oval_button(button: cell.btSugar)
            cell.btSugar.backgroundColor = UIColor.white
            return cell
        default:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FeedCell", for: indexPath) as!
            FeedCollectionViewCell
            cell.btFeed.setTitle(feedlist[indexPath.row], for: .normal)
            cell.btFeed.oval_button(button: cell.btFeed)
            cell.btFeed.backgroundColor = UIColor.white
            return cell
        }
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
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
        self.TemperatureHot = "Hot"
    }
    @IBAction func btTemperatureCold(_ sender: Any) {
        btTemperatureCold.backgroundColor = UIColor.yellow
        btTemperatureHot.backgroundColor = UIColor.white
        self.TemperatureHot = "Cold"
    }
    
}
