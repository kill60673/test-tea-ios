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
    var feedbackoption = [FeedBackOption]()
    var type = "未選擇意見類型"
    var typeid = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        tfTitle.delegate = self
        tvContent.delegate = self
        tvContent.setframe(textview: tvContent)
        UIImageView.setframe(view: UIImageView)
        feedbackoption = FeedBackOptionApi.FeedBackOptionApiInstance.getlist()
    }
    @IBAction func btSubmit(_ sender: Any) {
        //送出判斷式連結API
        GetCreateFeedBackMessage.getCreateFeedBackInstance.getCreateFeedBackMessage(title: tfTitle.text ?? "" , feedback_type_id: self.typeid, content: tvContent.text ?? "", feedback_images: [])
    }
    @IBAction func btPickImage(_ sender: Any) {
        getphotoalert()
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
        return FeedBackOptionApi.FeedBackOptionApiInstance.getCount()
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return feedbackoption[row].name
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        type = feedbackoption[row].name
        self.typeid = feedbackoption[row].id
        print("選擇的是\(type)")
    }
}
