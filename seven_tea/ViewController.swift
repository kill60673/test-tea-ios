//
//  ViewController.swift
//  seven_tea
//
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        LoginAPI.LoginInstance.Login(username: "test123456", password: "123456")
        // Do any additional setup after loading the view.
    }


}

