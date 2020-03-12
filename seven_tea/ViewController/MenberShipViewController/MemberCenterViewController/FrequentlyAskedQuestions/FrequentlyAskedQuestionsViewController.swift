//
//  FrequentlyAskedQuestionsViewController.swift
//  seven_tea
//
//  Created by harrison on 2020/3/6.
//  Copyright © 2020 harrison公司機. All rights reserved.
//

import UIKit
import Foundation

class FrequentlyAskedQuestionsViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.dataSource = self
        self.tableView.delegate = self
    }

    override func numberOfSections(in tableView: UITableView) -> Int {

        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return faqList.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FAQcell", for: indexPath)
        cell.textLabel?.text = faqList[indexPath.row]
        return cell
    }
}
