//
//  OrderDetailTableViewCell.swift
//  seven_tea
//
//  Created by harrison on 2020/5/30.
//  Copyright © 2020 harrison公司機. All rights reserved.
//

import UIKit

class OrderDetailTableViewCell: UITableViewCell {

    @IBOutlet weak var lbItemName: UILabel!
    @IBOutlet weak var lbItemPrice: UILabel!
    @IBOutlet weak var lbItemQty: UILabel!
    @IBOutlet weak var lbSize: UILabel!
    @IBOutlet weak var lbSugar: UILabel!
    @IBOutlet weak var lbTmp: UILabel!
    @IBOutlet weak var lbFeed: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
