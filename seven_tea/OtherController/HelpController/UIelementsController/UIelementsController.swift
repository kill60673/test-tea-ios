//
//  File.swift
//  seven_tea
//
//  Created by harrison on 2020/2/15.
//  Copyright © 2020 harrison公司機. All rights reserved.
//

import Foundation
import UIKit

extension UIButton{
    func customized_button(button : UIButton)
        {
        button.layer.borderWidth = 1.0//外框粗度
        button.layer.cornerRadius = 5//圓角
        }
    }
extension UIViewController{
    
    func keyboad(){
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target : self, action : #selector(dismissKeyBoard))
        self.view.addGestureRecognizer(tap) // to Replace "TouchesBegan"
    }
    @objc func dismissKeyBoard()
    {
        self.view.endEditing(true)
    }
}
extension UITextField{
        func textFieldShouldReturn(textField : UITextField) -> Bool
        {
            textField.resignFirstResponder()
            return true
        }
}
