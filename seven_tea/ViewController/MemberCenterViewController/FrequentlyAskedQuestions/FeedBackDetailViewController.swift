//
//  FeedBackDetailViewController.swift
//  seven_tea
//
//  Created by harrison on 2020/6/4.
//  Copyright © 2020 harrison公司機. All rights reserved.
//

import UIKit

class FeedBackDetailViewController: UIViewController {
    @IBOutlet weak var lbReply: UILabel!
    @IBOutlet weak var lbCreateTime: UILabel!
    @IBOutlet weak var lbTitle: UILabel!
    @IBOutlet weak var lbType: UILabel!
    @IBOutlet weak var replyView: UIView!
    @IBOutlet weak var tvContent: UITextView!
    @IBOutlet weak var tvReplyContent: UITextView!
    @IBOutlet weak var lbUpdateTime: UILabel!
    var feedbackreplycontent = ""
    var feedbackcontent = ""
    var feedbacktype = ""
    var feedbacktitle = ""
    var feedbackcreatetime = ""
    var feedbackupdatetime = ""
    var feedbackreplytype = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        lbCreateTime.text = feedbackcreatetime
        lbUpdateTime.text = feedbackupdatetime
        tvContent.text = feedbackcontent
        tvReplyContent.text = feedbackreplycontent
        lbUpdateTime.text = feedbackupdatetime
        lbTitle.text = feedbacktitle
        lbType.text = feedbacktype
        if feedbackreplytype == 0 {
            lbReply.text = "未回覆"
            replyView.isHidden = true
        } else {
            lbReply.text = "已回覆"
            replyView.isHidden = false
        }
    }
}
