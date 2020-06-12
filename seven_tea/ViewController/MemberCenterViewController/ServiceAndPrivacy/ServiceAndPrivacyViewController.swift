//
//  ServiceAndPrivacyViewController.swift
//  seven_tea
//
//  Created by harrison on 2020/6/12.
//  Copyright © 2020 harrison公司機. All rights reserved.
//

import UIKit
import WebKit
class ServiceAndPrivacyViewController: UIViewController {
    @IBOutlet weak var myWebView: WKWebView!
    var webcontent = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        webcontent = ServiceAndPrivacyApi.ServiceAndPrivacyApiInstance.getcontent()
        myWebView.loadHTMLString(webcontent, baseURL: nil)
        // Do any additional setup after loading the view.
    }
}
