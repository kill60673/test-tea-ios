//
//  HomeViewController.swift
//  seven_tea
//
//  Created by harrison on 2020/3/18.
//  Copyright © 2020 harrison公司機. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UITableViewDelegate, UITableViewDataSource {

    var imageIndex = 0
    @IBOutlet weak var homeTableView: UITableView!
    @IBOutlet weak var homeCollectionView: UICollectionView!
    @IBOutlet weak var pageControl: UIPageControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        homeCollectionView.dataSource = self
        homeCollectionView.delegate = self
        homeTableView.tableFooterView = UIView()
        Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(changBanner), userInfo: nil, repeats: true)
        // Do any additional setup after loading the view.
    }
    @objc func changBanner() {
        var indexPath: IndexPath
        imageIndex += 1
        if imageIndex < testimage.count {
            indexPath = IndexPath(item: imageIndex, section: 0 )
            homeCollectionView.selectItem(at: indexPath, animated: true, scrollPosition: .centeredHorizontally)
        } else {
            imageIndex = 0
            indexPath = IndexPath(item: imageIndex, section: 0 )
            homeCollectionView.selectItem(at: indexPath, animated: true, scrollPosition: .centeredHorizontally)
//            changBanner()
        }
        pageControl.currentPage = indexPath.row
    }
    @IBAction func myPage(_ sender: UIPageControl) {
        var indexPath: IndexPath
        if sender.currentPage == 0 {    // 判斷使用者選到哪個Page
            imageIndex = 0
            indexPath = IndexPath(item: imageIndex, section: 0 )
                       homeCollectionView.selectItem(at: indexPath, animated: true, scrollPosition: .centeredHorizontally)
        }else if sender.currentPage == 1 {
            imageIndex = 1
            imageIndex = 1
            indexPath = IndexPath(item: imageIndex, section: 0 )
                       homeCollectionView.selectItem(at: indexPath, animated: true, scrollPosition: .centeredHorizontally)
        }else if sender.currentPage == 2{
            imageIndex = 2
            imageIndex = 2
            indexPath = IndexPath(item: imageIndex, section: 0 )
                       homeCollectionView.selectItem(at: indexPath, animated: true, scrollPosition: .centeredHorizontally)
        }else{
            imageIndex = 3
            imageIndex = 3
            indexPath = IndexPath(item: imageIndex, section: 0 )
                       homeCollectionView.selectItem(at: indexPath, animated: true, scrollPosition: .centeredHorizontally)
        }

    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return testimage.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "homecell", for: indexPath) as!
        HomeCollectionViewCell
        cell.homeImageView.image = UIImage(named: testimage[indexPath.item])
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return collectionView.bounds.size
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return homelist.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellId = "HomeCell"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
        let Homelist = homelist[indexPath.row]
        /*  UITableViewCell本身有textLabel, detailTextLabel, imageView屬性可以設定主標、副標文字與圖片 */
        cell.textLabel?.text = Homelist
        cell.imageView?.image = UIImage(named: memberCenterImageList[indexPath.row])
        return cell
    }
}
