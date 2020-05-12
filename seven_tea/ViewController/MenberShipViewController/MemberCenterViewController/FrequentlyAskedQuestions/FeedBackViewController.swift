//
//  FeedBackViewController.swift
//  seven_tea
//
//  Created by harrison on 2020/3/11.
//  Copyright © 2020 harrison公司機. All rights reserved.
//

import UIKit
var Id = [Int]()
var Topic = [String]()
var Content = [String]()
var Time = [String]()
var UserName = [String]()
var SendName = [String]()
var PersonalMessageTableView: UITableView!
var DetailTitle: String!
var DetailName: String!
var DetailContent: String!
var DetailTime: String!

class FeedBackViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var FeedBackTableView: UITableView!
    static let FeedbackInstance = FeedBackViewController()

    override func viewDidLoad() {
        super.viewDidLoad()
        PersonalMessageTableView = FeedBackTableView
        FeedBackTableView.tableFooterView = UIView()
        MessageNotifyAPI.MessageNotifyInstance.MessageNotify(token: UserInfo.UserInfoInstance.preferences.object(forKey: "token") as? String ?? "")

    }

    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return Id.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FeedBackCell", for: indexPath) as! FeedBackTableViewCell
        cell.lbTitle.text = Topic[indexPath.row]
        cell.ibContent.text = Content[indexPath.row]
        cell.lbTime.text = Time[indexPath.row]

        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        DetailTitle = Topic[indexPath.row]
        DetailName = SendName[indexPath.row]
        DetailContent = Content[indexPath.row]
        DetailTime = Time[indexPath.row]

        let vc = storyboard?.instantiateViewController(withIdentifier: "Detail")
        show(vc!, sender: self)

    }
}
