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
    func setView(View:UIView){
        View.translatesAutoresizingMaskIntoConstraints = false
        View.heightAnchor.constraint(equalToConstant: 128).isActive = true
        View.leadingAnchor.constraint(equalToSystemSpacingAfter: View.leadingAnchor, multiplier: 0).isActive = true
        View.trailingAnchor.constraint(equalToSystemSpacingAfter: View.trailingAnchor, multiplier: -10).isActive = true
        let c = View.bottomAnchor.constraint(equalToSystemSpacingBelow: View.bottomAnchor, multiplier: 128)
        c.identifier = "bottom"
        c.isActive = true
        View.layer.cornerRadius = 10
        View.layer.cornerRadius = 10
    }
}
