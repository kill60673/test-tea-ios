//
//  FeedBackTableViewCell.swift
//  seven_tea
//
//  Created by harrison on 2020/3/11.
//  Copyright © 2020 harrison公司機. All rights reserved.
//

import UIKit

class FeedBackTableViewCell: UITableViewCell {
    @IBOutlet weak var lbTime: UILabel!
    @IBOutlet weak var lbReply: UILabel!
    @IBOutlet weak var lbTitle: UILabel!
    @IBOutlet weak var ibType: UILabel!
    @IBOutlet weak var ibContent: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
