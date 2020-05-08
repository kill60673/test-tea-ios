//
//  HomeViewController.swift
//  seven_tea
//
//  Created by harrison on 2020/3/18.
//  Copyright © 2020 harrison公司機. All rights reserved.
//

import UIKit
import SDWebImage
import CoreLocation
var SlideBannerTable: UICollectionView!
var PromotionBannerTable: UICollectionView!
var SelfLatitude: Double = 0.0
var SelfLongitude: Double = 0.0
class HomeViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UITableViewDelegate, UITableViewDataSource, CLLocationManagerDelegate {
    var imageIndex = 0
    var myLocationManager: CLLocationManager!
    @IBOutlet weak var homeTableView: UITableView!
    @IBOutlet weak var homeCollectionView: UICollectionView!
    @IBOutlet weak var bannerCollectionView: UICollectionView!
    @IBOutlet weak var bannerImage: UIImageView!
    @IBOutlet weak var btBannerClose: UIButton!
    @IBOutlet weak var imageView: UIView!
    let marketingBannerList = MarketingBannerAPI.MarketingBannerInstance.getList()
    override func viewDidLoad() {
        super.viewDidLoad()
//        LoadingBannerAPI.LoadingBannerInstance.loadingbanner()
//        SlideBannerAPI.SlideBannerInstance.slidebanner()
//        PromotionBannerAPI.PromotionBannerInstance.promotionbanner()
        SlideBannerTable = homeCollectionView
        PromotionBannerTable = bannerCollectionView
        homeTableView.tableFooterView = UIView()
        myLocationManager = CLLocationManager()
        myLocationManager.delegate = self
        myLocationManager.distanceFilter = kCLLocationAccuracyNearestTenMeters
        myLocationManager.desiredAccuracy = kCLLocationAccuracyBest
        myLocationManager.requestWhenInUseAuthorization()
        GetShoppingCarApi.GetShoppingCarInstance.getstores(token:  UserInfo.UserInfoInstance.preferences.object(forKey: "token") as! String)
        GetStoresApi.GetStoresApiInstance.getstores(city: "", district: "")
        bannerImage.sd_setImage(with: URL(string: marketingImageUrl), placeholderImage: UIImage(named: "test1"))
        Timer.scheduledTimer(timeInterval: 4, target: self, selector: #selector(changeBanner), userInfo: nil, repeats: true)
    }
    //輪播廣告的控制
    @objc func changeBanner() {
        var indexPath: IndexPath
        self.imageIndex += 1
        if imageIndex < SlideBannerAPI.SlideBannerInstance.getCount() {
            indexPath = IndexPath(item: imageIndex, section: 0 )
            homeCollectionView.selectItem(at: indexPath, animated: true, scrollPosition: .centeredHorizontally)
        } else {
            imageIndex = 0
            indexPath = IndexPath(item: imageIndex, section: 0 )
            homeCollectionView.selectItem(at: indexPath, animated: true, scrollPosition: .centeredHorizontally)
        }
    }
    //ColletcionView的控制部分
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        if collectionView.tag == 0 {
            return 1
        } else {
            return 1
        }
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView.tag == 0 {
            return SlideBannerAPI.SlideBannerInstance.getCount()
        } else {
            return PromotionBannerAPI.PromotionBannerInstance.getCount()
        }
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        if collectionView.tag == 0 {
            let slidebannerList = SlideBannerAPI.SlideBannerInstance.getList()
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "homecell", for: indexPath) as!
            HomeCollectionViewCell
            cell.homeImageView.sd_setImage(with: URL(string: slidebannerList[indexPath.row].pictureURL), placeholderImage: UIImage(named: "test1"))
            //            cell.imageView?.image = UIImage(named: memberCenterImageList[indexPath.row])
            return cell
        } else {
            let promotionbannerList = PromotionBannerAPI.PromotionBannerInstance.getList()
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BannerCell", for: indexPath) as!
            BannerCollectionViewCell
            cell.image.sd_setImage(with: URL(string: promotionbannerList[indexPath.row].pictureURL), placeholderImage: UIImage(named: "test1"))
            return cell
        }
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return collectionView.bounds.size
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.imageIndex = indexPath.row
        if collectionView.tag == 0 {
            print("我按了上面", indexPath.row)
        } else {
            print("我按了下面", indexPath.row)
        }
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }

    //TableView的控制部分
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return homelist.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellId = "HomeCell"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
        let Homelist = homelist[indexPath.row]
        //          UITableViewCell本身有textLabel, detailTextLabel, imageView屬性可以設定主標、副標文字與圖片
        cell.textLabel?.text = Homelist
        cell.imageView?.image = UIImage(named: memberCenterImageList[indexPath.row])
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            let Menustoryboard = UIStoryboard(name: "Menu", bundle: nil)
            let vc = Menustoryboard.instantiateViewController(withIdentifier: "NearbyStoresVC")
            show(vc, sender: self)
            break
        case 1:
            let Menustoryboard = UIStoryboard(name: "Menu", bundle: nil)
            let vc = Menustoryboard.instantiateViewController(withIdentifier: "NearbyStoresVC")
            show(vc, sender: self)
            break
        case 2:
            let MemberCenterstoryboard = UIStoryboard(name: "MemberCenter", bundle: nil)
            let vc = MemberCenterstoryboard.instantiateViewController(withIdentifier: "accountTV")
            show(vc, sender: self)
            break
        case 3:
            let MemberCenterstoryboard = UIStoryboard(name: "MemberCenter", bundle: nil)
            let vc = MemberCenterstoryboard.instantiateViewController(withIdentifier: "FAQTV")
            show(vc, sender: self)
            break
        default:
            break
        }
    }
    @IBAction func btBannerClose(_ sender: Any) {
        bannerImage.isHidden = true
        btBannerClose.isHidden = true
        imageView.isHidden = true
    }
     func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
            // 首次使用 向使用者詢問定位自身位置權限
            if CLLocationManager.authorizationStatus() == .notDetermined {
                // 開始定位自身位置
                myLocationManager.startUpdatingLocation()
                DispatchQueue.main.asyncAfter(deadline: .now()+0.5, execute: {
                    GpsGetStoresApi.GpsGetStoresApiInstance.gpsgetstores(latitude: SelfLatitude, longitude: SelfLongitude)
                    print("有取得位置")
                })

            }
                // 使用者已經拒絕定位自身位置權限
            else if CLLocationManager.authorizationStatus() == .denied || CLLocationManager.authorizationStatus() == .restricted {
                SelfLatitude = 0.0
                SelfLongitude = 0.0
                // 提示可至[設定]中開啟權限
                let alertController = UIAlertController(
                    title: "定位權限已關閉",
                    message:
                    "如要變更權限，請至 設定 > 隱私權 > 定位服務 開啟",
                    preferredStyle: .alert)
                let okAction = UIAlertAction(
                    title: "確認", style: .default, handler: nil)
                alertController.addAction(okAction)
                self.present(
                    alertController,
                    animated: true, completion: nil)
                SelfLatitude = 0.0
                SelfLongitude = 0.0
                print("定位權限已關閉")
            }
                // 使用者已經同意定位自身位置權限
            else if CLLocationManager.authorizationStatus() == .authorizedWhenInUse {
                // 開始定位自身位置
                myLocationManager.startUpdatingLocation()
                DispatchQueue.main.asyncAfter(deadline: .now()+0.5, execute: {
                    print("有取得後續位置")
//                    GpsGetStoresApi.GpsGetStoresApiInstance.gpsgetstores(latitude: SelfLatitude, longitude: SelfLongitude)
                })

            }
        }

        func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
            // 印出目前所在位置座標
    //        print("aaaaaaaaaa")
            let currentLocation: CLLocation = locations[0] as CLLocation
            SelfLatitude =  currentLocation.coordinate.latitude
            SelfLongitude =  currentLocation.coordinate.longitude

        }

        override func viewDidDisappear(_ animated: Bool) {
            super.viewDidDisappear(animated)
            // 停止定位自身位置
            myLocationManager.stopUpdatingLocation()
        }
}
