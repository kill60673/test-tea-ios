//
//  AccountFomationViewController.swift
//  seven_tea
//
//  Created by harrison on 2020/3/5.
//  Copyright © 2020 harrison公司機. All rights reserved.
//

import UIKit
import Foundation

class AccountFomationViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "afcell")
        
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 2
    }
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 25
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if section == 0 {
            return accountInfoList.count
        } else {
            return addressList.count
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "afccell", for: indexPath)
        if indexPath.section == 0 {
            cell.textLabel?.text = accountInfoList[indexPath.row]
        } else {
            cell.textLabel?.text = addressList[indexPath.row]
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        //        case 0:
        //            let vc = storyboard?.instantiateViewController(withIdentifier: "myFavoriteTV")
        //            show(vc!, sender: self)
        //            break
        //        case 1:
        //            let vc = storyboard?.instantiateViewController(withIdentifier: "accountTV"
        //            show(vc!, sender: self)
        //            break
        case 2:
            let vc = storyboard?.instantiateViewController(withIdentifier: "NameVC")
            show(vc!, sender: self)
            break
        case 3:
            let vc = storyboard?.instantiateViewController(withIdentifier: "GenderTV")
            show(vc!, sender: self)
            break
//        case 4:
//            let vc = storyboard?.instantiateViewController(withIdentifier: "GenderTV")
//            show(vc!, sender: self)
//            break
        case 5:
            let vc = storyboard?.instantiateViewController(withIdentifier: "EmailVC")
            show(vc!, sender: self)
            break
        case 6:
            let vc = storyboard?.instantiateViewController(withIdentifier: "ChangePasswordVC")
            show(vc!, sender: self)
            break
        case 7:
            let vc = storyboard?.instantiateViewController(withIdentifier: "SetNotifyTV")
            show(vc!, sender: self)
            break
        default:
            break
        }
    }
    
    
}
