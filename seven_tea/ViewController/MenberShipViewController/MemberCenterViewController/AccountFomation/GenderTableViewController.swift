//
//  GenderTableViewController.swift
//  seven_tea
//
//  Created by harrison on 2020/3/9.
//  Copyright © 2020 harrison公司機. All rights reserved.
//

import UIKit

class GenderTableViewController: UITableViewController {
    var isFinished = [Bool]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        isFinished = Array(repeating: false, count: genderList.count)
        self.tableView.dataSource = self
        self.tableView.delegate = self
        tableView.tableFooterView = UIView() 
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return genderList.count
    }
    

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "gendercell", for: indexPath)
        cell.textLabel?.text = genderList[indexPath.row]
        if isFinished[indexPath.row] == false{
            cell.accessoryType = .none
        } else if isFinished[indexPath.row] {
            cell.accessoryType = .checkmark
        }
        return cell
    }
    //設立只能點選一個勾 選了另一個會跳掉
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
    }

    override func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        tableView.cellForRow(at: indexPath)?.accessoryType = .none
    }
}
