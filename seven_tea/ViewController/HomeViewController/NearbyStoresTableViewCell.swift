//
//  NearbyStoresTableViewCell.swift
//  seven_tea
//
//  Created by harrison on 2020/3/24.
//  Copyright © 2020 harrison公司機. All rights reserved.
//

import UIKit

class NearbyStoresTableViewCell: UITableViewCell {
    @IBOutlet weak var lbStoreName: UILabel!
    @IBOutlet weak var lbBusinessHours: UILabel!
    @IBOutlet weak var lbPhone: UILabel!
    @IBOutlet weak var lbAddress: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}