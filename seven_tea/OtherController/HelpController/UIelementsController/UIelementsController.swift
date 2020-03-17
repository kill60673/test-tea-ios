//
//  File.swift
//  seven_tea
//
//  Created by harrison on 2020/2/15.
//  Copyright © 2020 harrison公司機. All rights reserved.
//

import Foundation
import UIKit

extension UIButton {
    func customized_button(button: UIButton) {
        button.layer.borderWidth = 1.0//外框粗度
        button.layer.cornerRadius = 5//圓角
    }

    func round_button(button: UIButton) {
        button.layer.borderWidth = 1.0//外框粗度
        button.layer.cornerRadius = 20//圓角
    }
}
extension UITextView {
    func setframe(textview: UITextView) {
        textview.layer.borderWidth = 1.0
        textview.layer.cornerRadius = 5.0

    }
}
extension UIView {
    func setframe(view: UIView) {
        view.layer.borderWidth = 1.0
        view.layer.cornerRadius = 5.0
    }
}
