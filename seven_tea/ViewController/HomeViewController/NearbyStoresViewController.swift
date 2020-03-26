//
//  NearbyStoresViewController.swift
//  seven_tea
//
//  Created by harrison on 2020/3/24.
//  Copyright © 2020 harrison公司機. All rights reserved.
//

import UIKit

class NearbyStoresViewController: UIViewController , UITableViewDelegate, UITableViewDataSource, UIPickerViewDelegate , UIPickerViewDataSource{
    let list = ["台北","台中","高雄"]
    let alist = ["地區","你家","我家","他家"]
    
    var nearbystores = [0,1,2,3,4]
    @IBOutlet weak var btCounty: UIButton!
    @IBOutlet weak var btRegion: UIButton!
    @IBOutlet weak var NearbystoresTableView: UITableView!
    @IBOutlet weak var countpickview: UIPickerView!
    @IBOutlet var CountyView: UIView!
    @IBOutlet weak var regionpickview: UIPickerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        btCounty.customized_button(button: btCounty)
        btRegion.customized_button(button: btRegion)
        // Do any additional setup after loading the view.
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
        return nearbystores.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NearbyStoresCell", for: indexPath) as! NearbyStoresTableViewCell
        cell.lbAddress.text = "hello"
        return cell
    }
    //縣市的BT按下去跳出縣市的pick選項
    @IBAction func btCounty(_ sender: Any) {
        displayPlayView(true)
        countpickview.isHidden = false
        regionpickview.isHidden = true
    }
    //選擇下去 完成的bt會修改button上面的值
    @IBAction func doneClick(_ sender: Any) {
        let title = list[countpickview.selectedRow(inComponent: 0)]
        let listtitle = alist[regionpickview.selectedRow(inComponent: 0)]
        btCounty.setTitle(title, for: .normal)
        btRegion.setTitle(listtitle, for: .normal)
        displayPlayView(false)
        regionpickview.isHidden = false
        countpickview.isHidden = false
    }
    //地區的BT按下去出跳出地區的pick選項
    @IBAction func btRegion(_ sender: Any) {
        displayPlayView(true)
        regionpickview.isHidden = false
        countpickview.isHidden = true
    }
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    //控制同頁不同的pickview
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView.tag == 0 {
            return list.count
        }else{
            return alist.count
        }
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView.tag == 0 {
            return list[row]
        }else{
            return alist[row]
        }
    }
    //選擇客製化alert的View跳出事件及收回事件
    func displayPlayView(_ show: Bool){
        for c in view.constraints{
            if c.identifier == "bottom"{
                c.constant = (show) ? -100 : 128
                break
            }
        }
        UIView.animate(withDuration: 0.5){
            self.view.layoutIfNeeded()
        }
//        print("我有案下去")
    }
}
