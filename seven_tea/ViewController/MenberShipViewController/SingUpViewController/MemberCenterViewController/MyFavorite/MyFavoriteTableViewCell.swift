//
//  MyFavoriteTableViewCell.swift
//  seven_tea
//
//  Created by harrison on 2020/3/6.
//  Copyright © 2020 harrison公司機. All rights reserved.
//

import UIKit

class MyFavoriteTableViewCell: UITableViewCell {
    @IBOutlet weak var lbTeaName: UILabel!
    @IBOutlet weak var lbTeaDetail: UILabel!
    @IBOutlet weak var lbTeaPrice: UILabel!
    @IBOutlet weak var btAddToShopCart: UIButton!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}