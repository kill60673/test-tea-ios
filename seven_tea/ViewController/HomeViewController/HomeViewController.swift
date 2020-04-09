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
var  ADContent = [String]()
var  ADTitle = [String]()
var  ADSendName = [String]()
var  ADPicture = [String]()
var  ADSendTime = [String]()
var ADTable:UICollectionView!
var BCTable:UICollectionView!
class HomeViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UITableViewDelegate, UITableViewDataSource {
    var imageIndex = 0
    @IBOutlet weak var homeTableView: UITableView!
    @IBOutlet weak var homeCollectionView: UICollectionView!
    @IBOutlet weak var bannerCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ADAPI.ADInstance.AD()
        ADTable = homeCollectionView
        BCTable = bannerCollectionView
        homeTableView.tableFooterView = UIView()
        Timer.scheduledTimer(timeInterval: 4, target: self, selector: #selector(changeBanner), userInfo: nil, repeats: true)
        
        // Do any additional setup after loading the view.
    }
    //輪播廣告的控制
    @objc func changeBanner() {
        var indexPath: IndexPath
        self.imageIndex += 1
        if imageIndex < ADPicture.count {
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
        }else{
            return 1
        }
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView.tag == 0 {
            return ADPicture.count
        }else{
            return ADPicture.count
        }
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView.tag == 0 {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "homecell", for: indexPath) as!
            HomeCollectionViewCell
            cell.homeImageView.sd_setImage(with: URL(string: ADPicture[indexPath.row]), placeholderImage: UIImage(named: "test1"))
            return cell
        }else{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BannerCell", for: indexPath) as!
            BannerCollectionViewCell
            cell.image.sd_setImage(with: URL(string: ADPicture[indexPath.row]), placeholderImage: UIImage(named: "test1"))
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
        print("我按了上面",indexPath.row)
        }else{
            print("我按了下面",indexPath.row)
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
            let vc = storyboard?.instantiateViewController(withIdentifier: "NearbyStoresVC")
            show(vc!, sender: self)
            break
        case 1:
            let Menustoryboard = UIStoryboard(name: "Menu", bundle: nil)
            let vc = Menustoryboard.instantiateViewController(withIdentifier: "MenuTV")
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
}
