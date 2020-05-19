//
//  NearbyStoresViewController.swift
//  seven_tea
//
//  Created by harrison on 2020/3/24.
//  Copyright © 2020 harrison公司機. All rights reserved.
//

import UIKit
var pickview: UIPickerView!
var NearByStoresTableView: UITableView!
class NearbyStoresViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UIPickerViewDelegate, UIPickerViewDataSource {
    var citytitle = ""
    var regiotitle  = "請選擇縣市"
    var is_open = ""
    var storeId = 0
    @IBOutlet weak var btCounty: UIButton!
    @IBOutlet weak var btRegion: UIButton!
    @IBOutlet weak var nearbystoresTableView: UITableView!
    @IBOutlet weak var countpickview: UIPickerView!
    @IBOutlet var CountyView: UIView!
    @IBOutlet weak var regionpickview: UIPickerView!
    @IBOutlet weak var btCityDoneClick: UIButton!
    @IBOutlet weak var btRegionDoneClick: UIButton!
    var getStoreDetails = [GetStore]()

    override func viewDidLoad() {
        btCounty.customized_button(button: btCounty)
        btRegion.customized_button(button: btRegion)
        CityTagAPI.CityTagInstance.citytag()
        NearByStoresTableView = nearbystoresTableView
        pickview = regionpickview
          super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    override func viewDidAppear(_ animated: Bool) {
        if UserInfo.UserInfoInstance.preferences.object(forKey: "token") != nil {
            nearbystoresTableView.isHidden = false
        } else {
            nearbystoresTableView.isHidden = true
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let viewContorller = storyboard.instantiateViewController(withIdentifier: "LoginVc")
            show(viewContorller, sender: self)
        }
    }
    //克制pickerview跳出事件的客製化view必且設立位置
    override func viewWillAppear(_ animated: Bool) {
        view.addSubview(CountyView)
        CountyView.translatesAutoresizingMaskIntoConstraints = false
        CountyView.heightAnchor.constraint(equalToConstant: 128).isActive = true
        CountyView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 0).isActive = true
        CountyView.trailingAnchor.constraint(equalToSystemSpacingAfter: view.trailingAnchor, multiplier: -10).isActive = true
        let c = CountyView.bottomAnchor.constraint(equalToSystemSpacingBelow: view.bottomAnchor, multiplier: 128)
        c.identifier = "bottom"
        c.isActive = true
        CountyView.layer.cornerRadius = 10
        super.viewWillAppear(animated)
    }
    //控制Tableview func
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if GpsGetStoresApi.GpsGetStoresApiInstance.getgpscount() == 0 {
            return GetStoresApi.GetStoresApiInstance.getCount()
        } else {
            return GpsGetStoresApi.GpsGetStoresApiInstance.getgpscount()
        }

    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        self.getStoreDetails = GetStoresApi.GetStoresApiInstance.getstorelist
        if GpsGetStoresApi.GpsGetStoresApiInstance.getgpslist() == [] {
             getStoreDetails = GetStoresApi.GetStoresApiInstance.getstorelist
        } else {
            getStoreDetails = GpsGetStoresApi.GpsGetStoresApiInstance.getgpslist()
        }
        let cell = tableView.dequeueReusableCell(withIdentifier: "NearbyStoresCell", for: indexPath) as! NearbyStoresTableViewCell
        cell.lbAddress.text = getStoreDetails[indexPath.row].address
        cell.lbStoreName.text = getStoreDetails[indexPath.row].storename
        cell.lbPhone.text = getStoreDetails[indexPath.row].tel
        if getStoreDetails[indexPath.row].is_open == true {
            self.is_open = "今日營業時間\(getStoreDetails[indexPath.row].opening_timer!.start_time)-\(getStoreDetails[indexPath.row].opening_timer!.end_time)"
        } else {
            self.is_open = "今日公休"
        }
        cell.lbBusinessHours.text = is_open
        return cell

    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.storeId = getStoreDetails[indexPath.row].getstore_id
        GetMenuCategoryApi.GetStoresApiInstance.getstores(storeId: self.storeId)
        let vc = storyboard?.instantiateViewController(withIdentifier: "MenuTV")
//        show(vc!, sender: self)
        present(vc!, animated: true)
    }
    //縣市的BT按下去跳出縣市的pick選項
    @IBAction func btCounty(_ sender: Any) {
        displayPlayView(true)
        btRegion.setTitle("地區", for: .normal)
        countpickview.isHidden = false
        regionpickview.isHidden = true
        btCityDoneClick.isHidden = false
        btRegionDoneClick.isHidden = true
    }
    //選擇下去 完成的bt會修改button上面的值
    @IBAction func doneClick(_ sender: Any) {
        let title = cityTag[countpickview.selectedRow(inComponent: 0)]
        self.citytitle = title
        btCounty.setTitle(title, for: .normal)
        displayPlayView(false)
        regionpickview.isHidden = false
        countpickview.isHidden = false
        DistricTagAPI.DistricTagInstance.districtag(city: citytitle)
        pickview.reloadAllComponents()
        btCityDoneClick.isHidden = true
    }
    @IBAction func btRegionDone(_ sender: Any) {
        let listtitle = districTag[regionpickview.selectedRow(inComponent: 0)]
        self.regiotitle = listtitle
        btRegion.setTitle(listtitle, for: .normal)
        regionpickview.isHidden = false
        countpickview.isHidden = false
        displayPlayView(false)
        btRegionDoneClick.isHidden = true
        GetStoresApi.GetStoresApiInstance.getstores(city: citytitle, district: regiotitle)
    }
    //地區的BT按下去出跳出地區的pick選項
    @IBAction func btRegion(_ sender: Any) {
        displayPlayView(true)
        regionpickview.isHidden = false
        countpickview.isHidden = true
        btCityDoneClick.isHidden = true
        btRegionDoneClick.isHidden = false
    }
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    //控制同頁不同的pickview
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView.tag == 0 {
            return cityTag.count
        } else {
            if districTag.count == 0 {
                btRegionDoneClick.isEnabled = false
                return 1
            } else {
                btRegionDoneClick.isEnabled = true
                 return districTag.count
            }
        }
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView.tag == 0 {
            return cityTag[row]
        } else {
            if districTag == [] {
                return "請選擇地區"
            } else {
                return districTag[row]
            }
        }
    }
    //選擇客製化alert的View跳出事件及收回事件
    func displayPlayView(_ show: Bool) {
        for c in view.constraints {
            if c.identifier == "bottom"{
                c.constant = (show) ? -100 : 128
                break
            }
        }
        UIView.animate(withDuration: 0.3) {
            self.view.layoutIfNeeded()
        }
    }
}
