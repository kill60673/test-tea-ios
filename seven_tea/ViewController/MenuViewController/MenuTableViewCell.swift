//
//  MenuTableViewCell.swift
//  seven_tea
//
//  Created by harrison on 2020/3/26.
//  Copyright © 2020 harrison公司機. All rights reserved.
//

import UIKit

class MenuTableViewCell: UITableViewCell {
    @IBOutlet weak var lbItemName: UILabel!
    @IBOutlet weak var lbSizeLPrice: UILabel!
    @IBOutlet weak var lbSizeMPrice: UILabel!
    @IBOutlet weak var imageIce: UIImageView!
    @IBOutlet weak var imageHot: UIImageView!
    @IBOutlet weak var imageSizeM: UIImageView!
    @IBOutlet weak var imageSizeL: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
