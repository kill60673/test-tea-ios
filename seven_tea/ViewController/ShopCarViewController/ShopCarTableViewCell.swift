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
var itemName = ShopCarViewController.sdddd.getitemname()
var itemPrice = ShopCarViewController.sdddd.getitemprice()
protocol TableViewCellDelegate {
    func tableviewcelldelegate(sender: ShopCarTableViewCell)
}

class ShopCarTableViewCell: UITableViewCell {
    @IBOutlet weak var btPlus: UIButton!
    @IBOutlet weak var beLess: UIButton!
    @IBOutlet weak var lbPrice: UILabel!
    @IBOutlet weak var lbSugar: UILabel!
    @IBOutlet weak var lbItemName: UILabel!
    @IBOutlet weak var lbQty: UILabel!
    var delegate: TableViewCellDelegate!
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
        if itemQty[index_row] >= 99 {
            itemQty[index_row] = 99
        } else {
            itemQty[index_row] += 1
            lbQty.text = "共\(itemQty[index_row])杯"
            shoppingcaritemprice[itemName[index_row]] = itemPrice[index_row]
            getitemtotalpriceplus()
            lbshoppingtotalprice.text = "$\(shoppingcartotalprice)"
            delivery()
        }
    }
    @IBAction func btLess(_ sender: Any) {
        delegate?.tableviewcelldelegate(sender: self)
        if itemQty[index_row] >= 1 {
            itemQty[index_row] -= 1
            lbQty.text = "共\(itemQty[index_row])杯"
            shoppingcaritemprice[itemName[index_row]] = itemPrice[index_row]
            getitemtotalpriceless()
            lbshoppingtotalprice.text = "$\(shoppingcartotalprice)"
            delivery()
        }
        if itemQty[index_row] < 1 {
            deleteSingleItemMessage(itemid: itemstoreId[index_row])
        }
    }
    func getitemtotalpriceplus(){
        for i in 0..<shoppingcaritemprice.count{
            shoppingcartotalprice += shoppingcaritemprice[itemname[i]]!
            shoppingdelivery -= shoppingcaritemprice[itemname[i]]!
        }
    }
    func getitemtotalpriceless(){
        for i in 0..<shoppingcaritemprice.count{
            shoppingcartotalprice -= shoppingcaritemprice[itemname[i]]!
            if shoppingcartotalprice < 300 {
            shoppingdelivery += shoppingcaritemprice[itemname[i]]!
            }
        }
    }
    func delivery(){
        if shoppingcartotalprice >= 300 {
            lbshoppingdelivery.text = "已達到可外送金額"
        }else{
            lbshoppingdelivery.text = "還差\(shoppingdelivery)可達外送金額"
        }
    }
}
