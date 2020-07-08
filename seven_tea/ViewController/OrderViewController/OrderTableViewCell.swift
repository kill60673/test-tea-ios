//
//  OrderTableViewCell.swift
//  seven_tea
//
//  Created by harrison on 2020/3/30.
//  Copyright © 2020 harrison公司機. All rights reserved.
//

import UIKit
protocol MemberDetailTableViewCellDelegate {
    func tableviewcelldelegate(sender: OrderTableViewCell)
}
var itemorderno = OrderViewController.OrderItemInstance.getorderno()
var itemdetailnumber = ""
class OrderTableViewCell: UITableViewCell {
    @IBOutlet weak var orderView: UIView!
    @IBOutlet weak var LbOrderNumber: UILabel!
    @IBOutlet weak var LbOrderStatus: UILabel!
    @IBOutlet weak var LbStore: UILabel!
    @IBOutlet weak var btNext: UIButton!
    @IBOutlet weak var LbItemName: UILabel!
    @IBOutlet weak var LbTotalPrice: UILabel!
    @IBOutlet weak var LbTotalQty: UILabel!
    var delegate: MemberDetailTableViewCellDelegate!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        orderView.setframe(view: orderView)

        // Configure the view for the selected state
    }
    @IBAction func BtNextPage(_ sender: Any) {
        delegate?.tableviewcelldelegate(sender: self)
        itemdetailnumber = itemorderno[index_row]
    }
}
