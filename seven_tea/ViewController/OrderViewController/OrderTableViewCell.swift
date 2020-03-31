//
//  OrderTableViewCell.swift
//  seven_tea
//
//  Created by harrison on 2020/3/30.
//  Copyright © 2020 harrison公司機. All rights reserved.
//

import UIKit

class OrderTableViewCell: UITableViewCell {

    @IBOutlet weak var orderView: UIView!
    @IBOutlet weak var orderTime: UILabel!
    @IBOutlet weak var orderNo: UILabel!
    @IBOutlet weak var orderName: UILabel!
    @IBOutlet weak var orderPhone: UILabel!
    @IBOutlet weak var orderGetMethod: UILabel!
    @IBOutlet weak var orderGetTime: UILabel!
    @IBOutlet weak var orderAddress: UILabel!
    @IBOutlet weak var orderStore: UILabel!
    @IBOutlet weak var orderSerialNumber: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        orderView.setframe(view: orderView)

        // Configure the view for the selected state
    }

}
