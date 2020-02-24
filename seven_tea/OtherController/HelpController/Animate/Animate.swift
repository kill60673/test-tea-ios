//
//  Animate.swift
//  seven_tea
//
//  Created by harrison公司機 on 2020/2/5.
//  Copyright © 2020 harrison公司機. All rights reserved.
//

import Foundation
import UIKit

/*/延伸UILabel類別的定義，新增一個function,內容為將label的元件都可以帶上搖晃的效果*/
extension UILabel {
    func shake() {
        let animation = CAKeyframeAnimation(keyPath: "transform.translation.x")
        animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.linear)
        animation.duration = 1.0
        animation.values = [-3.0, 3.0, -3.0, 3.0, -3.0, 3.0, -3.0, 3.0, -3.0, 3.0, -3.0, 3.0, -3.0, 3.0, -3.0, 3.0, -3.0, 3.0, 0.0 ]
        layer.add(animation, forKey: "shake")
    }
}
/*/延伸UITextField類別的定義，新增一個function,內容為將textfield的元件都可以帶上搖晃的效果*/
extension UITextField {
    func shake() {
        let animation = CAKeyframeAnimation(keyPath: "transform.translation.x")
        animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.linear)
        animation.duration = 1.0
        animation.values = [-3.0, 3.0, -3.0, 3.0, -3.0, 3.0, -3.0, 3.0, -3.0, 3.0, -3.0, 3.0, -3.0, 3.0, -3.0, 3.0, -3.0, 3.0, 0.0 ]
        layer.add(animation, forKey: "shake")
    }
}
