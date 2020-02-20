//
//  AppOverallstyle.swift
//  seven_tea
//
//  Created by harrison on 2020/2/18.
//  Copyright © 2020 harrison公司機. All rights reserved.
//

import Foundation
import UIKit

extension UITextField{
        func textFieldShouldReturn(textField : UITextField) -> Bool
        {
            textField.resignFirstResponder()
            return true
        }
}
extension UIViewController{
    
    func keyboad(){
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target : self , action : #selector(dismissKeyBoard))
        self.view.addGestureRecognizer(tap) // to Replace "TouchesBegan"
    }
    @objc func dismissKeyBoard()
    {
        self.view.endEditing(true)
    }
}
