//
//  ConfirmOrderViewController.swift
//  seven_tea
//
//  Created by harrison on 2020/5/15.
//  Copyright © 2020 harrison公司機. All rights reserved.
//

import UIKit
var shoppingcardetailtableview = UITableView()
class ConfirmOrderViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,UIPickerViewDataSource, UIPickerViewDelegate, UIPopoverPresentationControllerDelegate,UITextFieldDelegate {
    @IBOutlet weak var btPayMent: UIButton!
    @IBOutlet weak var lbStoreName: UILabel!
    @IBOutlet weak var btCommonly_one: UIButton!
    @IBOutlet weak var btCommonly_two: UIButton!
    @IBOutlet weak var btCommonly_three: UIButton!
    @IBOutlet weak var tfRecipient: UITextField!
    @IBOutlet weak var tfPhoneNumber: UITextField!
    @IBOutlet weak var tfAddress: UITextField!
    @IBOutlet weak var ShoppingDetailTableView: UITableView!
    @IBOutlet weak var PickerTextFiled: UITextField!
    var shoppingcaritem = [GetShoppingCarItem]()
    var shoppingcardetail = [GetShoppingCarDetail]()
    var memberinfo = [SynchronizeMemberInfo]()
    var address = [SynchronizeMemberAddress]()
    var feedlist = [GetFeedList]()
    var SendHour = [String]()
    var SendMin = [String]()
    var hour = "0"
    var min = ""
    var Getmethod = 99
    var PayMethod = 99
    var pickerView: UIPickerView!
    override func viewDidLoad() {
        super.viewDidLoad()
        SycchronizeMemberInfoApi.SycchronizeMemberInfoApiInstance.getmemberinfo(token: UserInfo.UserInfoInstance.preferences.object(forKey: "token") as! String)
        GetShoppingCarApi.GetShoppingCarInstance.getstores(token: UserInfo.UserInfoInstance.preferences.object(forKey: "token")as! String)
        self.shoppingcaritem = GetShoppingCarApi.GetShoppingCarInstance.getshoppingcaritem()
        self.shoppingcardetail = GetShoppingCarApi.GetShoppingCarInstance.getshoppingcardetail()
        self.feedlist = GetShoppingCarApi.GetShoppingCarInstance.getshoppingcaradd()
        print(self.feedlist.count,"庭宇")
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
        PickerTextFiled.text = "\(SendHour[0])\(SendMin[0])"
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
        print("阿囉哈")
        let cell = tableView.dequeueReusableCell(withIdentifier: "ConfirmOrderCell", for: indexPath) as! ConfirmOrderTableViewCell
        cell.lbItemName.text = self.shoppingcaritem[indexPath.row].item_name
        cell.lbSugar.text = self.shoppingcaritem[indexPath.row].sugar
        cell.lbTmp.text = self.shoppingcaritem[indexPath.row].tmp
        if self.shoppingcaritem[indexPath.row].id == feedlist[indexPath.row].itemIndexId{
            print(feedlist[indexPath.row].feed,"搭特銷")
            let feedliststring = feedlist[indexPath.row].feed.joined(separator: "/")
            cell.lbFeed.text = feedliststring
            print(feedliststring)
        }
        cell.lbQty.text = "\(self.shoppingcaritem[indexPath.row].qty)"
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
        }else{
            return SendMin.count
        }
    }

    func pickerView( _ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if component == 0 {
            hour = SendHour[row]
            return  SendHour[row]
        }else{
            min = SendMin[row]
            return SendMin[row]
        }
    }
    func pickerView( _ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if component == 0{
            hour = SendHour[row]
            Min()
        }else{
            min = SendMin[row]
        }
        PickerTextFiled.text = "\(hour)\(min)"
    }
    func Min(){
        // 獲取當前時間
        let now:Date = Date()
        // 建立時間格式
        let dateFormat:DateFormatter = DateFormatter()
        let dateFormat2:DateFormatter = DateFormatter()
        dateFormat.dateFormat = "HH"
        dateFormat2.dateFormat = "mm"
        // 將當下時間轉換成設定的時間格式
        let hourdate:Int = Int(dateFormat.string(from: now))!
        let mindate:Int = Int(dateFormat2.string(from: now))!
        SendMin.removeAll()
        var selecthour = 0
        if hour.count == 2 {
            selecthour = Int(hour.prefix(1))!
        }else{
            selecthour = Int(hour.prefix(2))!
        }
        SendMin.removeAll()
        if((mindate + 30) >= 60 && (selecthour-1) <= hourdate ){
            SendHour.removeAll()
            for i in (hourdate + 1)...21 {
                SendHour.append("\(i)點")
            }
            for i in stride(from: ((mindate + 30) - 60), to: 60, by: 30) {
                SendMin.append("\(i)分")
            }
            hour = SendHour[0]
        }else{
            if selecthour > hourdate {
                for i in stride(from: 0, to: 60, by: 30) {
                    if(mindate < 60 ){
                        SendMin.append("\(i)分")
                    }
                }
            }else{
                for i in stride(from: mindate + 30, to: 60, by: 30) {
                    if(mindate < 60 ){
                        SendMin.append("\(i)分")
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
          let now:Date = Date()
          // 建立時間格式
          let dateFormat:DateFormatter = DateFormatter()
          let dateFormat2:DateFormatter = DateFormatter()
          dateFormat.dateFormat = "HH"
          dateFormat2.dateFormat = "mm"
          // 將當下時間轉換成設定的時間格式
          let hourdate:Int = Int(dateFormat.string(from: now))!
          let mindate:Int = Int(dateFormat2.string(from: now))!
          var selectHour = 0
          var selectMin = 0
          if hour.count == 2 {
              selectHour = Int(hour.prefix(1))!
          }else{
              selectHour = Int(hour.prefix(2))!
          }
          if min.count == 2  {
              selectMin = Int(min.prefix(1))!
          }else{
              selectMin = Int(min.prefix(2))!
          }
          if (((selectHour * 60 + selectMin) - (hourdate * 60 + mindate)) >= 15) && PickerTextFiled.text! != "" {
              return true
          }else{
              return false
          }
      }
      //計算小時
      func Hour(){
          // 獲取當前時間
          let now:Date = Date()
          // 建立時間格式
          let dateFormat:DateFormatter = DateFormatter()
          let dateFormat2:DateFormatter = DateFormatter()
          dateFormat.dateFormat = "HH"
          dateFormat2.dateFormat = "mm"
          // 將當下時間轉換成設定的時間格式
          let hourdate:Int = Int(dateFormat.string(from: now))!
          SendHour.removeAll()
          for i in hourdate...21 {
              SendHour.append("\(i)點")
          }
          hour = SendHour[0]
          pickerView.reloadAllComponents()
      }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func btPayMent(_ sender: Any) {
        //        ConfirmCartOrderMessage(store_id: <#T##Int#>, total_qty: <#T##Int#>, total_price: <#T##Int#>, get_method: <#T##String#>, arrival_time: <#T##String#>, recipient: <#T##String#>, recipient_tel: <#T##String#>, tax_code: <#T##String#>, pay_method: <#T##String#>, item: <#T##[item]#>, address: <#T##[address]#>)
    }
}
