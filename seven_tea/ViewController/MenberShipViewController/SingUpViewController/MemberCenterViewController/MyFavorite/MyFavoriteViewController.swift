//
//  MyFavoriteViewController.swift
//  seven_tea
//
//

import UIKit

var myFavoriteId = [Int]()
var myFavoriteProductName = [String]()
var myFavoriteProductType = [String]()
var myFavoriteSize = [String]()
var myFavoriteSugar = [String]()
var myFavoriteTemperature = [String]()
var myFavoriteQuantity = [Int]()
var myFavoriteTotalPrice = [Int]()
var myFavoriteSinglePrice = [Int]()
var myFavoriteStore = [String]()
var myFavoriteStoreId = [String]()
var myFavoriteName = [String]()
var myFavoriteAdd = [String]()
var MyFavoriteDrinkTableVIew: UITableView!
class MyFavoriteViewController: UIViewController , UITableViewDelegate , UITableViewDataSource {
    @IBOutlet weak var MyFovortierDrinkTable: UITableView!
    
    func numberOfSections(in tableView: UITableView) -> Int {
        //        return MyFavoriteName.count
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myFavoriteProductName.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! MyFavoriteTableViewCell
        
        cell.lbTeaName.text = myFavoriteProductName[indexPath.row]
        cell.lbTeaDetail.text = "\(myFavoriteSize[indexPath.row])/\(myFavoriteTemperature[indexPath.row])/\(myFavoriteSugar[indexPath.row])"
        
        print("single: \(myFavoriteSinglePrice)")
        print("total: \(myFavoriteTotalPrice)")
        
        cell.lbTeaPrice.text = "$\(myFavoriteTotalPrice[indexPath.row])"
        
        return cell
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        MyFovortierDrinkTable.tableFooterView = UIView()
        MyFavoriteDrinkTableVIew = MyFovortierDrinkTable
        
        MyFavoriteDrinkInfoAPI.MyFavoriteDrinkInfoInstance.MyFavoriteDrinkInfo(Token: UserInfo.UserInfoInstance.preferences.object(forKey: "token") as! String)
        
        
    }
    
    
    /**
     * 實作TableView方法，自動出現左滑功能，並進入編輯模式
     * 編輯模式 => tableView.isEditing = true
     **/
    func tableView(_ tableView: UITableView,
                   commit editingStyle: UITableViewCell.EditingStyle,
                   forRowAt indexPath: IndexPath) {
    }
    
    /**
     * 實作TableView回傳Action Array的方法，來自定左滑後顯示的按鈕及動作
     **/
    func tableView(_ tableView: UITableView,
                   editActionsForRowAt indexPath: IndexPath)
        -> [UITableViewRowAction]?
    {
        
        var actionArr:Array<UITableViewRowAction> = [UITableViewRowAction]()
        
        // 建立編輯按鈕
        let actionDelete:UITableViewRowAction =
            UITableViewRowAction(style: UITableViewRowAction.Style.normal,
                                 title: "加入購物車") { (action, indexPath) in
                                    
                                    
                                    tableView.isEditing = false; // 退出編輯模式
                                    tableView.reloadData() // 更新tableView
        }
        
        // 建立刪除按鈕
        let actionAdd:UITableViewRowAction =
            UITableViewRowAction(style: UITableViewRowAction.Style.default,
                                 title: "刪除") { (action, indexPath) in
                                    
                                    
                                    
                                    tableView.isEditing = false; // 退出編輯模式
                                    tableView.reloadData() // 更新tableView
        }
        
        // 將按鈕動作加入Array，並回傳
        actionArr.append(actionAdd)
        actionArr.append(actionDelete)
        
        return actionArr;
    }
    
    
    //軟鍵盤按return自動消除
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    //按軟鍵盤以外的地方收起鍵盤
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    
}
