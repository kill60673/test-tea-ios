//
//  MyFavoriteViewController.swift
//  seven_tea
//
//

import UIKit

var myFavoriteDrinkTableVIew: UITableView!
class MyFavoriteViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var myFovortierDrinkTable: UITableView!

    func numberOfSections(in tableView: UITableView) -> Int {
        //        return MyFavoriteName.count
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return MyFavoriteDrinkInfoAPI.MyFavoriteDrinkInfoInstance.getCount()
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var myfavoriteList = MyFavoriteDrinkInfoAPI.MyFavoriteDrinkInfoInstance.getList()
        let cell = tableView.dequeueReusableCell(withIdentifier: "fovoriterCell") as! MyFavoriteTableViewCell

        cell.lbTeaName.text = myfavoriteList[indexPath.row].myFavoriteProductName
        cell.lbTeaDetail.text = "\(myfavoriteList[indexPath.row].myFavoriteSize)/\(myfavoriteList[indexPath.row].myFavoriteTemperature)/\(myfavoriteList[indexPath.row].myFavoriteSugar)"
        cell.lbTeaPrice.text = "$\(myfavoriteList[indexPath.row].myFavoriteTotalPrice)"
        return cell
    }
    func updateTableViewList() {

        myFovortierDrinkTable.reloadData()

    }

    override func viewDidLoad() {
        super.viewDidLoad()
        myFovortierDrinkTable.tableFooterView = UIView()
        myFavoriteDrinkTableVIew = myFovortierDrinkTable
        MyFavoriteDrinkInfoAPI.MyFavoriteDrinkInfoInstance.myFavoriteDrinkInfo(
        token: UserInfo.UserInfoInstance.preferences.object(forKey: "token") as! String)
    }

//      實作TableView方法，自動出現左滑功能，並進入編輯模式 編輯模式 => tableView.isEditing = true
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {

    }

//      實作TableView回傳Action Array的方法，來自定左滑後顯示的按鈕及動作

    func tableView(_ tableView: UITableView,
                   editActionsForRowAt indexPath: IndexPath)
        -> [UITableViewRowAction]? {
        var actionArr: [UITableViewRowAction] = [UITableViewRowAction]()
        // 建立刪除按鈕
        let actionAdd: UITableViewRowAction =
            UITableViewRowAction(style: UITableViewRowAction.Style.default, title: "刪除") {
                (_, _) in
                tableView.isEditing = false; // 退出編輯模式
                tableView.reloadData() // 更新tableView
        }
        // 將按鈕動作加入Array，並回傳
        actionArr.append(actionAdd)
        return actionArr
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
