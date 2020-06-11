//
//  SetNotifyTableViewController.swift
//  seven_tea
//
//  Created by harrison on 2020/3/10.
//  Copyright © 2020 harrison公司機. All rights reserved.
//

import UIKit

class SetNotifyTableViewController: UITableViewController {
    var type = ""
    var status = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.dataSource = self
        self.tableView.delegate = self
        tableView.tableFooterView = UIView()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return setnotifyList.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "notifycell", for: indexPath)
                let row = indexPath.row
                cell.textLabel?.text = setnotifyList[row]
                let switchView = UISwitch(frame: .zero)
                switchView.setOn(false, animated: true)
                switchView.tag = indexPath.row
                switchView.addTarget(self, action: #selector(self.switchChanged(_:)), for: .valueChanged)
                cell.accessoryView = switchView
                return cell
    }
    @objc func switchChanged(_ sender: UISwitch!) {
        if sender.tag == 0 {
            self.type = "app"
        }else{
            self.type = "email"
        }
        if sender.isOn == true{
            self.status = 1
        }else{
            self.status = 0
        }
        getNotificationStatusMessage(type: self.type, status: self.status)
             print("table row switch Changed \(sender.tag)")
             print("The switch is \(sender.isOn ? "ON" : "OFF")")
       }
}
