//
//  OrderDetailService.swift
//  seven_tea
//
//  Created by harrison on 2020/4/9.
//  Copyright © 2020 harrison公司機. All rights reserved.
//

import Foundation
import UIKit
class MenuDetailService {
    func alert() -> MenuDetailViewController {
        let storyboard = UIStoryboard(name: "Menu", bundle: .main)
        let menuDetailVC = storyboard.instantiateViewController(withIdentifier: "MenuDetailVC") as! MenuDetailViewController
        menuDetailVC.modalPresentationStyle = UIModalPresentationStyle.overCurrentContext
        menuDetailVC.modalTransitionStyle = UIModalTransitionStyle.crossDissolve
        return menuDetailVC
    }
}

