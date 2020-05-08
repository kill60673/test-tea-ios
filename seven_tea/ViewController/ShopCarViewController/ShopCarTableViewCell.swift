//
//  OrderTableViewCell.swift
//  seven_tea
//
//  Created by harrison on 2020/3/26.
//  Copyright © 2020 harrison公司機. All rights reserved.
//

import UIKit
var qty = 0
class ShopCarTableViewCell: UITableViewCell {
    @IBOutlet weak var btPlus: UIButton!
    @IBOutlet weak var beLess: UIButton!
    @IBOutlet weak var lbPrice: UILabel!
    @IBOutlet weak var lbSugar: UILabel!
    @IBOutlet weak var lbItemName: UILabel!
    @IBOutlet weak var lbQty: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    @IBAction func brPlus(_ sender: Any) {
        if qty >= 99 {
            qty = 99
        }else{
            qty += 1
        }
    }
    @IBAction func btLess(_ sender: Any) {
        if qty <= 0 {
            //updateshoppingcar.api
        }else{
            qty -= 1
        }
    }
}
