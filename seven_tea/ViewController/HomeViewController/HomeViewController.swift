//
//  HomeViewController.swift
//  seven_tea
//
//  Created by harrison on 2020/3/18.
//  Copyright © 2020 harrison公司機. All rights reserved.
//

import UIKit
import SDWebImage
import FSPagerView
var SlideBannerTable: UICollectionView!
var PromotionBannerTable: UICollectionView!
class HomeViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UITableViewDelegate, UITableViewDataSource {
    var imageIndex = 0
    @IBOutlet weak var homeTableView: UITableView!
    @IBOutlet weak var homeCollectionView: UICollectionView!
    @IBOutlet weak var bannerCollectionView: UICollectionView!
    @IBOutlet weak var bannerImage: UIImageView!
    @IBOutlet weak var btBannerClose: UIButton!
    @IBOutlet weak var imageView: UIView!
    let marketingBannerList = MarketingBannerAPI.MarketingBannerInstance.getList()
    override func viewDidLoad() {
        super.viewDidLoad()
        LoadingBannerAPI.LoadingBannerInstance.loadingbanner()
        SlideBannerAPI.SlideBannerInstance.slidebanner()
        PromotionBannerAPI.PromotionBannerInstance.promotionbanner()
        SlideBannerTable = homeCollectionView
        PromotionBannerTable = bannerCollectionView
        homeTableView.tableFooterView = UIView()
        GetStoresApi.GetStoresApiInstance.getstores(city:"",district:"")
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
            print("這邊是index", indexPath.count)
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
}
