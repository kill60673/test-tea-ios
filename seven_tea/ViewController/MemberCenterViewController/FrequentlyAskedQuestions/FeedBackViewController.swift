//
//  FeedBackViewController.swift
//  seven_tea
//
//  Created by harrison on 2020/3/11.
//  Copyright © 2020 harrison公司機. All rights reserved.
//

import UIKit
import Foundation
var PersonalMessageTableView: UITableView!
class FeedBackViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var FeedBackTableView: UITableView!
    @IBOutlet weak var statusSelect: UISegmentedControl!
    static let FeedbackInstance = FeedBackViewController()
    var reply = 0
    var feedbacklist = [GetFeedBack]()
    override func viewDidLoad() {
        super.viewDidLoad()
        PersonalMessageTableView = FeedBackTableView
        FeedBackTableView.tableFooterView = UIView()
        GetFeedBackApi.GetFeedBackApiiInstance.getfeedback(token:UserInfo.UserInfoInstance.preferences.object(forKey: "token") as? String ?? "", reply: 0)
        self.feedbacklist = GetFeedBackApi.GetFeedBackApiiInstance.getfeedbacklist()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return GetFeedBackApi.GetFeedBackApiiInstance.getfeedbackcount()
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        self.feedbacklist = GetFeedBackApi.GetFeedBackApiiInstance.getfeedbacklist()
        let cell = tableView.dequeueReusableCell(withIdentifier: "FeedBackCell", for: indexPath) as! FeedBackTableViewCell
        cell.lbTitle.text = feedbacklist[indexPath.row].title
        cell.ibContent.text = feedbacklist[indexPath.row].content
        cell.lbTime.text = feedbacklist[indexPath.row].update_time
        cell.ibType.text = feedbacklist[indexPath.row].type
        if self.reply == 0 {
            cell.lbReply.text = "未回覆"
        }else{
            cell.lbReply.text = "已回覆"
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "Detail")
        show(vc!, sender: self)
    }
    @IBAction func statusSelect(_ sender: Any) {
        switch statusSelect.selectedSegmentIndex {
        case 0:
            reply = 0
            print("跑到０")
            break
        default:
            reply = 1
            print("跑到1")
            break
        }
    GetFeedBackApi.GetFeedBackApiiInstance.getfeedback(token:UserInfo.UserInfoInstance.preferences.object(forKey: "token") as! String, reply: self.reply)
    }
}
