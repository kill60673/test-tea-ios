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
        isFinished = Array(repeating: false, count: gender.count)
        self.tableView.dataSource = self
        self.tableView.delegate = self
        tableView.tableFooterView = UIView() 
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return gender.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "gendercell", for: indexPath)
        let row = indexPath.row
        cell.textLabel?.text = gender[row]
        
        if isFinished[row]{
            cell.accessoryType = .checkmark
        } else {
            cell.accessoryType = .none
        }
        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        isFinished[indexPath.row] = !isFinished[indexPath.row]
        tableView.reloadData()
    }
    
}
