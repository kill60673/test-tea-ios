//
//  ConfirmOrderViewController.swift
//  seven_tea
//
//  Created by harrison on 2020/5/15.
//  Copyright © 2020 harrison公司機. All rights reserved.
//

import UIKit
var ConfirmView: UIViewController!
var shoppingcardetailtableview = UITableView()
class ConfirmOrderViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UIPickerViewDataSource, UIPickerViewDelegate, UIPopoverPresentationControllerDelegate, UITextFieldDelegate {
    @IBOutlet weak var btPayMent: UIButton!
    @IBOutlet weak var lbStoreName: UILabel!
    @IBOutlet weak var btCommonly_one: UIButton!
    @IBOutlet weak var btCommonly_two: UIButton!
    @IBOutlet weak var btCommonly_three: UIButton!
    @IBOutlet weak var tfRecipient: UITextField!
    @IBOutlet weak var tfPhoneNumber: UITextField!
    @IBOutlet weak var tfAddress: UITextField!
    @IBOutlet weak var ShoppingDetailTableView: UITableView!
    @IBOutlet weak var tfTaxCode: UITextField!
    @IBOutlet weak var sgMethod: UISegmentedControl!
    @IBOutlet weak var PickerTextFiled: UITextField!
    @IBOutlet weak var lbShoppingTotalQty: UILabel!
    @IBOutlet weak var lbShoppingTotalPrice: UILabel!
    @IBOutlet weak var lbConfirmOrderTotalPrice: UILabel!
    var shoppingcaritem = [GetShoppingCarItem]()
    var shoppingcardetail = [GetShoppingCarDetail]()
    var memberinfo = [SynchronizeMemberInfo]()
    var address = [SynchronizeMemberAddress]()
    var memberaddress = [SynchronizeMemberAddress]()
    var ConfirmCaritem = [ConfirmCartitem]()
    var feedlist = [GetFeedList]()
    var SendHour = [String]()
    var SendMin = [String]()
    var day = ""
    var hour = "0"
    var min = ""
    var arrivaltime = ""
    var Getmethod = "take_out"
    var PayMethod = 99
    var pickerView: UIPickerView!
    override func viewDidLoad() {
        super.viewDidLoad()
        SycchronizeMemberInfoApi.SycchronizeMemberInfoApiInstance.getmemberinfo(token: UserInfo.UserInfoInstance.preferences.object(forKey: "token") as! String)
        GetShoppingCarApi.GetShoppingCarInstance.getstores(token: UserInfo.UserInfoInstance.preferences.object(forKey: "token")as! String)
        self.shoppingcaritem = GetShoppingCarApi.GetShoppingCarInstance.getshoppingcaritem()
        self.shoppingcardetail = GetShoppingCarApi.GetShoppingCarInstance.getshoppingcardetail()
        self.feedlist = GetShoppingCarApi.GetShoppingCarInstance.getshoppingcaradd()
        ConfirmView = self
        ShoppingDetailTableView.reloadData()
        lbStoreName.text = shoppingcardetail[0].store_name
        ShoppingDetailTableView.tableFooterView = UIView()
        shoppingcardetailtableview = ShoppingDetailTableView
        btCommonly_one.customized_button(button: btCommonly_one)
        btCommonly_two.customized_button(button: btCommonly_two)
        btCommonly_three.customized_button(button: btCommonly_three)
        pickerView = UIPickerView()
        pickerView.delegate = self
        PickerTextFiled.inputView = pickerView
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        Hour()
        Min()
        PickerTextFiled.text = "\(self.day) \(SendHour[0]):\(SendMin[0])"
        self.arrivaltime = "\(self.day) \(SendHour[0]):\(SendMin[0])"
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return shoppingcaritem.count
    }
    //點擊空白處pickview或是鍵盤消失
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ConfirmOrderCell", for: indexPath) as! ConfirmOrderTableViewCell
        cell.lbItemName.text = self.shoppingcaritem[indexPath.row].item_name
        cell.lbSugar.text = self.shoppingcaritem[indexPath.row].sugar
        cell.lbTmp.text = self.shoppingcaritem[indexPath.row].tmp
        if self.shoppingcaritem[indexPath.row].id == feedlist[indexPath.row].itemIndexId {
            let feedliststring = feedlist[indexPath.row].feed.joined(separator: "/")
            cell.lbFeed.text = feedliststring
            print(feedliststring)
        }
        if self.shoppingcaritem[indexPath.row].size == "M" {
            cell.imageSize = UIImageView(image: UIImage(named: "m"))
        }else{
            cell.imageSize = UIImageView(image: UIImage(named: "l"))
        }
        cell.lbQty.text = "\(self.shoppingcaritem[indexPath.row].qty)"
        cell.lbPrice.text = "\(self.shoppingcaritem[indexPath.row].price)"
        let item = ConfirmCartitem(id: String(self.shoppingcaritem[indexPath.row].id), qty: self.shoppingcaritem[indexPath.row].qty, item_id: self.shoppingcaritem[indexPath.row].item_id, item_name: self.shoppingcaritem[indexPath.row].item_name, size: shoppingcaritem[indexPath.row].size, sugar: self.shoppingcaritem[indexPath.row].sugar, tmp: self.shoppingcaritem[indexPath.row].tmp, add: feedlist[indexPath.row].feed, price: shoppingcaritem[indexPath.row].price)
        self.ConfirmCaritem.append(item)
        lbShoppingTotalQty.text = "總計\(shoppingcardetail[0].total_qty)杯"
        lbShoppingTotalPrice.text = "總計＄\(shoppingcardetail[0].totle_price)元"
        lbConfirmOrderTotalPrice.text = "總計＄\(shoppingcardetail[0].totle_price)元"
        return cell
    }
    @IBAction func btSynchronizeMemberInfo(_ sender: Any) {
        self.address = SycchronizeMemberInfoApi.SycchronizeMemberInfoApiInstance.getmemberaddress()
        self.memberinfo = SycchronizeMemberInfoApi.SycchronizeMemberInfoApiInstance.getmemberinfo()
        tfRecipient.text = memberinfo[0].name
        tfPhoneNumber.text = memberinfo[0].phone
    }
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }

    func pickerView( _ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if component == 0 {
            return SendHour.count
        } else {
            return SendMin.count
        }
    }

    func pickerView( _ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if component == 0 {
            hour = SendHour[row]
            return  SendHour[row]
        } else {
            min = SendMin[row]
            return SendMin[row]
        }
    }
    func pickerView( _ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if component == 0 {
            hour = SendHour[row]
            Min()
        } else {
            min = SendMin[row]
        }
        PickerTextFiled.text = "\(self.day) \(hour):\(min)"
        self.arrivaltime = "\(self.day) \(hour):\(min)"
    }
    func Min() {
        // 獲取當前時間
        let now: Date = Date()
        // 建立時間格式
        let dateFormat: DateFormatter = DateFormatter()
        let dateFormat2: DateFormatter = DateFormatter()
        let dateday: DateFormatter = DateFormatter()
        dateday.dateFormat = "yyyy-MM-dd"
        dateFormat.dateFormat = "HH"
        dateFormat2.dateFormat = "mm"
        self.day = String(dateday.string(from: now))
        // 將當下時間轉換成設定的時間格式
        let hourdate: Int = Int(dateFormat.string(from: now))!
        let mindate: Int = Int(dateFormat2.string(from: now))!
        SendMin.removeAll()
        var selecthour = 0
        if hour.count == 2 {
            selecthour = Int(hour.prefix(1))!
        } else {
            selecthour = Int(hour.prefix(2))!
        }
        SendMin.removeAll()
        if (mindate + 30) >= 60 && (selecthour-1) <= hourdate {
            SendHour.removeAll()
            for i in (hourdate + 1)...21 {
                SendHour.append("\(i)")
            }
            for i in stride(from: ((mindate + 30) - 60), to: 60, by: 30) {
                SendMin.append("\(i)")
            }
            hour = SendHour[0]
        } else {
            if selecthour > hourdate {
                for i in stride(from: 0, to: 60, by: 30) {
                    if mindate < 60 {
                        SendMin.append("\(i)")
                    }
                }
            } else {
                for i in stride(from: mindate + 30, to: 60, by: 30) {
                    if mindate < 60 {
                        SendMin.append("\(i)")
                    }
                }
            }
        }
        pickerView.selectRow(0, inComponent: 1, animated: true)
        pickerView.reloadAllComponents()
        min = SendMin[0]
    }
    func CheckTime() -> Bool {
        // 獲取當前時間
        let now: Date = Date()
        // 建立時間格式
        let dateFormat: DateFormatter = DateFormatter()
        let dateFormat2: DateFormatter = DateFormatter()
        let dateday: DateFormatter = DateFormatter()
        dateday.dateFormat = "yyyy-MM-dd"
        dateFormat.dateFormat = "HH"
        dateFormat2.dateFormat = "mm"
        // 將當下時間轉換成設定的時間格式
        let hourdate: Int = Int(dateFormat.string(from: now))!
        let mindate: Int = Int(dateFormat2.string(from: now))!
        var selectHour = 0
        var selectMin = 0
        if hour.count == 2 {
            selectHour = Int(hour.prefix(1))!
        } else {
            selectHour = Int(hour.prefix(2))!
        }
        if min.count == 2 {
            selectMin = Int(min.prefix(1))!
        } else {
            selectMin = Int(min.prefix(2))!
        }
        if (((selectHour * 60 + selectMin) - (hourdate * 60 + mindate)) >= 15) && PickerTextFiled.text! != "" {
            return true
        } else {
            return false
        }
    }
    //計算小時
    func Hour() {
        // 獲取當前時間
        let now: Date = Date()
        // 建立時間格式
        let dateFormat: DateFormatter = DateFormatter()
        let dateFormat2: DateFormatter = DateFormatter()
        dateFormat.dateFormat = "HH"
        dateFormat2.dateFormat = "mm"
        // 將當下時間轉換成設定的時間格式
        let hourdate: Int = Int(dateFormat.string(from: now))!
        SendHour.removeAll()
        for i in hourdate...21 {
            SendHour.append("\(i)")
        }
        hour = SendHour[0]
        pickerView.reloadAllComponents()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func btPayMent(_ sender: Any) {

        memberaddress.removeAll()
        let memberitemaddress = SynchronizeMemberAddress(id: nil, zipcode: nil, city: nil, district: nil, address: tfAddress.text!)
        self.memberaddress.append(memberitemaddress)
        //tab 切換的第0個
        if tfRecipient.text != "" && tfAddress.text != "" && tfPhoneNumber.text != "" {
             ConfirmCartOrderMessage(store_id: shoppingcardetail[0].store_id, total_qty: shoppingcardetail[0].total_qty, total_price: shoppingcardetail[0].totle_price, get_method: self.Getmethod, arrival_time: self.arrivaltime, recipient: tfRecipient.text!, recipient_tel: tfPhoneNumber.text!, tax_code: tfTaxCode.text ?? "", pay_method: "cash", item: ConfirmCaritem, address: self.memberaddress)
            ConfirmView.navigationController?.popViewController(animated: true)
            ConfirmView.tabBarController?.selectedIndex = 0
        }
    }
    @IBAction func btCommonlyOne(_ sender: Any) {
        self.memberaddress.removeAll()
        if address[0].id != nil {
            let memberaddress = SynchronizeMemberAddress(id: address[0].id, zipcode: address[0].zipcode, city: address[0].city, district: address[0].district, address: address[0].address)
            self.memberaddress.append(memberaddress)
            tfAddress.text = "\(memberaddress.city!)\(memberaddress.district!)\(memberaddress.address)"
        }
    }
    @IBAction func btCommonlyTwo(_ sender: Any) {
        self.memberaddress.removeAll()
        if address[1].id != nil {
            let memberaddress = SynchronizeMemberAddress(id: address[1].id, zipcode: address[1].zipcode, city: address[1].city, district: address[1].district, address: address[1].address)
            self.memberaddress.append(memberaddress)
            tfAddress.text = "\(memberaddress.city!)\(memberaddress.district!)\(memberaddress.address)"
        }
    }

    @IBAction func btCommonlyThree(_ sender: Any) {
        self.memberaddress.removeAll()
        if address[2].id != nil {
            let memberaddress = SynchronizeMemberAddress(id: address[2].id, zipcode: address[2].zipcode, city: address[2].city, district: address[2].district, address: address[2].address)
            self.memberaddress.append(memberaddress)
            tfAddress.text = "\(memberaddress.city!)\(memberaddress.district!)\(memberaddress.address)"
        }
    }

    @IBAction func segmentedControlValueChanged(_ sender: Any) {
        setGetmethod()
        print(self.Getmethod)
    }
    func setGetmethod() {
        // 依照被選取項目的index來決定男女
        let selectedIndex = sgMethod.selectedSegmentIndex
        switch selectedIndex {
        case 0:
            self.Getmethod = "take_out"
        case 1:
            self.Getmethod = "delivery"
        default:
            break
        }
        // 依照被選取項目的index來取得該選項文字，並顯示在lbMessage上
    }

}
