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
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            let vc = storyboard?.instantiateViewController(withIdentifier: "myFavoriteTV")
            show(vc!, sender: self)
            break
        case 1:
            let vc = storyboard?.instantiateViewController(withIdentifier: "accountTV")
            show(vc!, sender: self)
                break
        case 2:
            let vc = storyboard?.instantiateViewController(withIdentifier: "NameVC")
            show(vc!, sender: self)
            break
        case 3:
            let vc = storyboard?.instantiateViewController(withIdentifier: "GenderTV")
            show(vc!, sender: self)
            break
        case 4:
            let vc = storyboard?.instantiateViewController(withIdentifier: "GenderTV")
            show(vc!, sender: self)
            break
        case 5:
            let vc = storyboard?.instantiateViewController(withIdentifier: "FeedBackTV")
            show(vc!, sender: self)
        default:
            break
        }
    }

}
