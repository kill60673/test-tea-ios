//
//  AddFeedBackViewController.swift
//  seven_tea
//
//  Created by harrison on 2020/3/11.
//  Copyright © 2020 harrison公司機. All rights reserved.
//

import UIKit

class AddFeedBackViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate, UITextViewDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var tfTitle: UITextField!
    @IBOutlet weak var tvContent: UITextView!
    @IBOutlet weak var pvType: UIPickerView!
    @IBOutlet weak var btSubmit: UIBarButtonItem!
    @IBOutlet weak var UIImageView: UIView!
    @IBOutlet weak var imageView: UIImageView!
    var type = "未選擇意見類型"
    override func viewDidLoad() {
        super.viewDidLoad()
        tfTitle.delegate = self
        tvContent.delegate = self
        tvContent.setframe(textview: tvContent)
        UIImageView.setframe(view: UIImageView)
    }
    @IBAction func btSubmit(_ sender: Any) {
        //送出判斷式連結API
    }
    @IBAction func btPickImage(_ sender: Any) {
        let myAlert =  UIAlertController(title: "上傳照片", message: "請選擇上傳方式", preferredStyle: .actionSheet)
        //拍照
        let takePictureAction = UIAlertAction(title: "拍照", style: .default) { (_: UIAlertAction) in
        let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.sourceType = .camera
            imagePicker.allowsEditing = true
            self.present(imagePicker, animated: true, completion: nil)
        }
        //相簿
        let picPictureAction = UIAlertAction(title: "從相簿中選取", style: .default) { (_: UIAlertAction) in
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
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
        myAlert.addAction(picPictureAction)
        myAlert.addAction(cancelAction)
        present(myAlert, animated: true, completion: nil)
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
        /* 利用指定的key從info dictionary取出照片 */
        if let pickedImage = info[.originalImage] as? UIImage {
            imageView.image = pickedImage
        }
        dismiss(animated: true, completion: nil)
    }

    /* 挑選照片過程中如果按了Cancel，關閉挑選畫面 */
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return feedbacktype.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return feedbacktype[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        type = feedbacktype[row]
        print("選擇的是\(type)")
    }
}
