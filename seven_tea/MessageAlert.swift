//
//  File.swift
//  seven_tea
//

import Foundation
import UIKit

class MessageAlert : NSObject {
    static let Instance = MessageAlert()
    
    var alert: UIAlertController!
    
    private override init() {
    }
    
    // 取得最上層的畫面
    func getTopViewController() -> UIViewController? {
        if let rootViewController = UIApplication.shared.keyWindow?.rootViewController
        {
            var topViewControlelr: UIViewController = rootViewController
            while let presentedViewController = topViewControlelr.presentedViewController
            {
                topViewControlelr = presentedViewController
            }
            return topViewControlelr
        }
        else
        {
            return nil
        }
    }
    
    // 每一個UIAlerController可以跳出tittle七盞茶 message自行輸入字串回傳顯示在畫面上
    func message(message: String)  {
        let topViewController: UIViewController = getTopViewController()!
        let Alert = UIAlertController(title : "七盞茶" , message : message , preferredStyle : .alert)
        let confirm = UIAlertAction(title : "確認" , style: .default , handler : nil)
        Alert.addAction(confirm)
        topViewController.present(Alert , animated : true, completion : nil)
    }
}
