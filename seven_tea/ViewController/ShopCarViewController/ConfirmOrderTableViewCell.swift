//
//  ConfirmOrderTableViewCell.swift
//  seven_tea
//
//  Created by harrison on 2020/5/15.
//  Copyright © 2020 harrison公司機. All rights reserved.
//

import UIKit

class ConfirmOrderTableViewCell: UITableViewCell {
    @IBOutlet weak var lbPrice: UILabel!
    @IBOutlet weak var lbQty: UILabel!
    @IBOutlet weak var lbFeed: UILabel!
    @IBOutlet weak var lbTmp: UILabel!
    @IBOutlet weak var lbSugar: UILabel!
    @IBOutlet weak var imageSize: UIImageView!
    @IBOutlet weak var lbItemName: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
