//
//  AppOverallstyle.swift
//  seven_tea
//
//  Created by harrison on 2020/2/18.
//  Copyright © 2020 harrison公司機. All rights reserved.
//

import Foundation
import UIKit

extension UITextField {
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
extension String {
    func urlEncoded() -> String {
        let encodeUrlString = self.addingPercentEncoding(withAllowedCharacters:
            .urlQueryAllowed)
        return encodeUrlString ?? ""
    }
}
extension UIViewController {

    func keyboad() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyBoard))
        self.view.addGestureRecognizer(tap) // to Replace "TouchesBegan"
    }
    @objc func dismissKeyBoard() {
        self.view.endEditing(true)
    }
    func getphotoalert() {
        let myAlert =  UIAlertController(title: "上傳照片", message: "請選擇上傳方式", preferredStyle: .actionSheet)
        //拍照
        let takePictureAction = UIAlertAction(title: "拍照", style: .default) { (_: UIAlertAction) in
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self as! UIImagePickerControllerDelegate & UINavigationControllerDelegate
            imagePicker.sourceType = .camera
            imagePicker.allowsEditing = true
            self.present(imagePicker, animated: true, completion: nil)
        }
        //相簿
        let pickPictureAction = UIAlertAction(title: "從相簿中選取", style: .default) { (_: UIAlertAction) in
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self as! UIImagePickerControllerDelegate & UINavigationControllerDelegate
            imagePicker.sourceType = .photoLibrary
            //照片編輯器
            imagePicker.allowsEditing = true
            self.present(imagePicker, animated: true, completion: nil)
        }
        //alert取消
        let cancelAction = UIAlertAction(title: "取消", style: .destructive) { (_: UIAlertAction) in
        }
        //把按鈕放在警告控制器中
        myAlert.addAction(takePictureAction)
        myAlert.addAction(pickPictureAction)
        myAlert.addAction(cancelAction)
        present(myAlert, animated: true, completion: nil)
    }
    func openlise() {
        let vc = UIViewController()
               vc.preferredContentSize = CGSize(width: 250, height: 300)
               let pickerView = UIPickerView(frame: CGRect(x: 0, y: 0, width: 250, height: 300))
               pickerView.delegate = self as? UIPickerViewDelegate
               pickerView.dataSource = self as? UIPickerViewDataSource
               vc.view.addSubview(pickerView)
               let editRadiusAlert = UIAlertController(title: "Choose distance", message: "", preferredStyle: UIAlertController.Style.alert)
               editRadiusAlert.setValue(vc, forKey: "contentViewController")
               editRadiusAlert.addAction(UIAlertAction(title: "Done", style: .default, handler: nil))
               editRadiusAlert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
               self.present(editRadiusAlert, animated: true)
    }
}
