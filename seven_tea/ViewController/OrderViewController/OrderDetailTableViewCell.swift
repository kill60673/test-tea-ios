//
//  OrderDetailTableViewCell.swift
//  seven_tea
//
//  Created by harrison on 2020/5/30.
//  Copyright © 2020 harrison公司機. All rights reserved.
//

import UIKit

class OrderDetailTableViewCell: UITableViewCell {

    @IBOutlet weak var lbItemName: UIView!
    @IBOutlet weak var lbItemPrice: UILabel!
    @IBOutlet weak var lbItemQty: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
