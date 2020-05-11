//
//  OrderTableViewCell.swift
//  seven_tea
//
//  Created by harrison on 2020/3/26.
//  Copyright © 2020 harrison公司機. All rights reserved.
//
import Foundation
import UIKit
var qty = 0
var itemQty = ShopCarViewController.sdddd.getitemqty()
protocol TableViewCellDelegate{
    func tableviewcelldelegate(sender: ShopCarTableViewCell)
}

class ShopCarTableViewCell: UITableViewCell {
    @IBOutlet weak var btPlus: UIButton!
    @IBOutlet weak var beLess: UIButton!
    @IBOutlet weak var lbPrice: UILabel!
    @IBOutlet weak var lbSugar: UILabel!
    @IBOutlet weak var lbItemName: UILabel!
    @IBOutlet weak var lbQty: UILabel!
    var delegate : TableViewCellDelegate?
    override func awakeFromNib() {
        super.awakeFromNib()
         
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    @IBAction func brPlus(_ sender: Any) {
        delegate?.tableviewcelldelegate(sender: self)
      print(itemQty)
        if itemQty[index_row] >= 99 {
            itemQty[index_row] = 99
        }else{
            itemQty[index_row] += 1
            lbQty.text = "\(itemQty[index_row])"
        }
    }
    @IBAction func btLess(_ sender: Any) {
         delegate?.tableviewcelldelegate(sender: self)
          if itemQty[index_row] <= 0 {
                  itemQty[index_row] = 0
            //updateShoppincar
              }else{
                  itemQty[index_row] -= 1
                  lbQty.text = "\(itemQty[index_row])"
              }
    }
}
